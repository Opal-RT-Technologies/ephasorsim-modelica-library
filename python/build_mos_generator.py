import argparse
import json
import os
import pathlib


moscript_load_dependencies = '''echo(false);
exit_on_error := {exit_on_error};
print("[OpenModelica] MODELICAPATH: " + getModelicaPath() + "\\n");

print("[OpenModelica] Loading Modelica library" + "\\n");
success := loadModel(Modelica);
if not success then
    print("[OpenModelica] " + getErrorString() + "\\n");
    if exit_on_error then
        exit(1);
    end if;
end if;

print("[OpenModelica] Loading OpalRT library" + "\\n");
success := loadModel(OpalRT);
if not success then
    print("[OpenModelica] " + getErrorString() + "\\n");
    if exit_on_error then
        exit(1);
    end if;
end if;

component_list := {component_list}
nb_components := size(component_list, 1);

'''

moscript_format_build = '''// buildModelFMU for each components
for i in 1:nb_components loop
    print("[OpenModelica] Building " + component_list[i] + ".fmu" + "\\n");
    startIndex := Modelica.Utilities.Strings.findLast(component_list[i], ".");
    shortName := Modelica.Utilities.Strings.substring(
        component_list[i],
        startIndex + 1,
        Modelica.Utilities.Strings.length(component_list[i])
    );
    resultingFile := buildModelFMU(stringTypeName(component_list[i]), version="1.0", fmuType = "me", fileNamePrefix = shortName);

    if Modelica.Utilities.Strings.isEmpty(resultingFile) then
        print("[OpenModelica] " + getErrorString() + "\\n");
        print("[OpenModelica] Build failed for " + component_list[i] + "\\n");
        if exit_on_error then
            print("[OpenModelica] Exiting..." + "\\n");
            exit(1);
        end if;
    else
       print("[OpenModelica] Successfully generated " + resultingFile + "\\n");
    end if;
end for;

'''

moscript_format_load_model = '''// checkModel for each components
for i in 1:nb_components loop
    results := checkModel(stringTypeName(component_list[i]));
    if not Modelica.Utilities.Strings.isEmpty(results) then
        print("[OpenModelica] checkModel for " + component_list[i] + " results:\\n" + results + "\\n");
    else
        print("[OpenModelica] checkModel for " + component_list[i] + " results: Failed" + "\\n");
    end if;

    print("\\n");
end for;
'''


def build_modelica_path(path):
    if ';' in path:
        windows_path = path.split(';')
        path = ';'.join([pathlib.PureWindowsPath(entry).as_posix() for entry in windows_path])
    elif ':' in path:
        linux_path = path.split(':')
        path = ':'.join([pathlib.PureWindowsPath(entry).as_posix() for entry in linux_path])
    else:
        path = pathlib.PureWindowsPath(path).as_posix()

    return f'"{path}"'


def generate_mos(dest_dir, components, check_only=False, no_exit_on_error=False):
    mos_component_list = "{\n"
    for component in components:
        mos_component_list += f'    "{component}",\n'
    mos_component_list = mos_component_list[:-2]
    mos_component_list += "\n};"

    with open(os.path.join(dest_dir, 'build.mos'), 'w') as mos_script:
        mos_script.write(moscript_load_dependencies.format(**{
            'exit_on_error': "false" if no_exit_on_error else "true",
            'component_list': mos_component_list
        }))

        if check_only:
            mos_script.write(moscript_format_load_model)
        else:
            mos_script.write(moscript_format_build)


def save_component_list(dest_dir, components):
    with open(os.path.join(dest_dir, 'components.json'), 'w') as components_json:
        json.dump(components, components_json)


def prepare_component_list(modelica_root, component_type, whitelist, blacklist):
    filtered_components = list()
    path = component_type.split('.')
    components_dir = pathlib.Path(os.path.join(modelica_root, *path))
    for component_file in components_dir.glob("*.mo"):
        component_name = os.path.basename(component_file).strip(".mo")
        if component_name == "package":
            continue

        if len(whitelist) and component_name not in whitelist:
            continue

        if not len(whitelist) and component_name in blacklist:
            continue

        filtered_components.append(f"{component_type}.{component_name}")
    return filtered_components


if __name__ == "__main__":
    # Those components are skipped because they don't compile with Dymola and would fail the build. They should be fixed in the future and re-enabled.
    components_to_skip = [
        "EX_T1",
        "MAXEX1",
        "MAXEX2"
    ]

    parser = argparse.ArgumentParser()
    parser.add_argument('--no-build-fmu', action='store_true', help='skip build fmu section')
    parser.add_argument('--whitelist', type=str, help='coma separated component list', default="")
    parser.add_argument('--blacklist', type=str, help='coma separated component list', default=",".join(components_to_skip))
    parser.add_argument('--no-exit-on-error', action='store_true', help='output directory')
    parser.add_argument('--force', action='store_true', help='output directory')
    parser.add_argument('--generate-mos', action='store_true', help='whether to generate a .mos to generate FMUs (openmodelica only)')
    parser.add_argument('--modelica-root', type=str, help='Modelica root directory', default=f"{os.path.join(os.path.dirname(__file__), '..', 'modelica')}")
    parser.add_argument('build_dir', help='output directory')

    args = parser.parse_args()

    if not os.path.exists(args.build_dir):
        os.makedirs(args.build_dir)

    blacklist = list(filter(None, args.blacklist.split(',')))
    whitelist = list(filter(None, args.whitelist.split(',')))
    build_dir = pathlib.Path(os.path.join(args.build_dir))

    filtered_components = list()

    component_types = [
        'OpalRT.Electrical.Control.Excitation',
        'OpalRT.Electrical.Control.OverExcitationLimiter',
        'OpalRT.Electrical.Control.UnderExcitationLimiter',
        'OpalRT.Electrical.Control.Stabilizer',
        'OpalRT.Electrical.Control.TurbineGovernor',
        'OpalRT.ePHASORSIM.WrappedModels'
    ]

    for type in component_types:
        filtered_components.extend(prepare_component_list(args.modelica_root, type, whitelist, blacklist))

    # save filtered component list to be used at later stages
    save_component_list(args.build_dir, filtered_components)

    if args.generate_mos:
        generate_mos(args.build_dir, filtered_components, args.no_build_fmu, args.no_exit_on_error)
