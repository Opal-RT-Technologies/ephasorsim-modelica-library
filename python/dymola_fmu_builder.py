import argparse
import json
import logging
import os
import shutil
import zip

import dymola_interface

def model_short_name(model):
    return model.split(".")[-1]

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('build_dir', help='output directory')
    parser.add_argument('components', type=str, help='path to a json fil containing a list of components', default="")
    parser.add_argument('--dymola-home', type=str, help='path to a dymola installation', default="C:/Program Files/Dymola 2019")
    parser.add_argument('--modelica-library', type=str, help='path to a modelica library', default="C:/Users/karlbenoit/.modelica/MSL4/")
    parser.add_argument('--sources-dest', type=str, help='path to folder where to save the generated sources', default=None)
    parser.add_argument('--no-exit-on-error', help='keep building upon error', action='store_true')

    args = parser.parse_args()

    logging.basicConfig(level=logging.INFO)
    handler = logging.StreamHandler()
    formatter = logging.Formatter('[%(name)s] %(message)s')
    root_logger = logging.getLogger()
    for handler in root_logger.handlers:
        handler.setFormatter(formatter)

    components = list()
    with open(args.components) as components_json:
        components = json.load(components_json)

    flags = {
        'Advanced.CheckPackageRestriction': 'false',  # Removes some errors for other GenUnits in EP1326
        'Advanced.FMI.xmlIgnoreProtected': 'false',  # Disable filtering protected variables (some derivatives might be defined as protected)
        'Advanced.FMI.xmlIgnoreLocal': 'false',  # Disable filtering local variables
        'Advanced.FMI.BlackBoxModelDescription': 'false',  # Disable filtering Black-box FMU (By disabling this option, the FMU model includes all other signals beside input/outputs)
        'Advanced.EnableCodeExport': 'true',  # Enables the production of FMUs
        'Advanced.Define.NewJacobian': 'false',  # Optimisations
        'Advanced.Define.AimForHighAccuracy': 'false',  # Optimisations
    }

    keep_sources = args.sources_dest is not None
    failed_components = dymola_interface.build_fmus(args.dymola_home, args.build_dir, components, keep_sources=keep_sources, flags=flags, no_exit_on_error=args.no_exit_on_error)

    dymola_build_files = os.path.join(os.path.dirname(__file__), '..', 'dymola', 'dymola_make')

    if keep_sources:
        for component in components:
            if component in failed_components:
                continue

            zip.filter_zip(os.path.join(args.build_dir, f'{model_short_name(component)}.fmu'), "sources", original_prefix="src", dest=args.sources_dest)

        all_components_sources = os.path.join(args.sources_dest, 'src-components')
        if os.path.exists(all_components_sources):
            shutil.rmtree(all_components_sources)
        os.mkdir(all_components_sources)

        shutil.copyfile(os.path.join(dymola_build_files, 'Makefile-all'), os.path.join(all_components_sources, 'Makefile'))
        shutil.copytree(os.path.join(dymola_build_files, 'include'), os.path.join(all_components_sources, 'include'))

        for component in components:
            if component in failed_components:
                continue

            zip.extract_zip(os.path.join(args.sources_dest, f'src-{model_short_name(component)}.fmu'), os.path.join(all_components_sources, model_short_name(component)))
            shutil.rmtree(os.path.join(all_components_sources, model_short_name(component), 'binaries'))

            shutil.copyfile(os.path.join(dymola_build_files, 'Makefile-component'), os.path.join(all_components_sources, model_short_name(component), 'Makefile'))
