import logging
import os
import sys


if not sys.platform.lower().startswith('win'):
    sys.exit("This script currently only runs on windows")


LOGGER = logging.getLogger("DYMOLA")


def sanitize_model_name(model):
    return model.replace(".", "_")


def model_short_name(model):
    return model.split(".")[-1]


def build_fmus(dymola_home, build_dir, models, fmi_ver="1", debug=False, keep_sources=False, flags={}, no_exit_on_error=False):
    LOGGER.info(f"MODELICAPATH: {os.environ['MODELICAPATH']}")
    dymola = None

    try:
        if not any('dymola.egg' in s for s in sys.path):
            sys.path.append(os.path.join(dymola_home, 'Modelica', 'Library', 'python_interface', 'dymola.egg'))

        from dymola.dymola_interface import DymolaInterface
        from dymola.dymola_exception import DymolaException

        dymola = DymolaInterface(dymolapath=os.path.join(dymola_home, 'bin64', 'Dymola.exe'), showwindow=False, debug=debug)
        dymola_version = dymola.DymolaVersionNumber()
        if dymola_version != 2019:
            raise Exception('Unexpected dymola version: {}'.format(dymola_version))

        LOGGER.info("Checking Dymola license features")
        if not dymola.RequestOption("Standard"):
            # issue a warning instead of raising since this might work with demo license
            raise Exception("Dymola standard feature license check failed")

        if not dymola.RequestOption("SourceCodeGeneration") and keep_sources:
            raise Exception("Dymola source code generation feature license check failed. This feature is required for "
                            "compiling on remote targets or for exporting the model sources")
        
        LOGGER.info("All license features checks passed")
    except Exception as e:
        if dymola is not None:
            dymola.close()
        raise e

    failed_components = list()

    try:
        dymola.clear()  # unload everything that was preloaded, e.g. the default Modelica library

        for flag, value in flags.items():
            flag_str = f"{flag}={value}"
            LOGGER.info(f"Setting flag {flag_str}")
            dymola.ExecuteCommand(flag_str)

        dymola.cd(build_dir)

        # TODO: make compiler version choosable
        dymola.SetDymolaCompiler("vs", ["CCompiler=MSVC", "MSVCDir=C:/Program Files (x86)/Microsoft Visual Studio 10.0/Vc"])
        if not dymola.verifyCompiler():
            raise DymolaException("Failed to setup compiler")

        counter = 0
        for model in models:
            counter += 1
            fmu_model_name = model_short_name(model)
            fmu_file_name = f"{fmu_model_name}.fmu"
            final_fmu_path = os.path.abspath(os.path.join(build_dir, fmu_file_name))
            if os.path.exists(final_fmu_path):
                LOGGER.info(f"[{counter}/{len(models)}] Already built {fmu_model_name}.fmu. Skipping...")
                continue

            dymola.system(f"mkdir {model}")
            dymola.cd(model)

            try:
                # Sanity check first
                res = dymola.checkModel(model)
                if not res:
                    LOGGER.debug("raising a dymola exception!")
                    raise DymolaException("Failed to verify model " + model)

                # Call dymola to produce the fmu
                LOGGER.info(f"[{counter}/{len(models)}] Building {fmu_model_name}.fmu")
                res = dymola.translateModelFMU(modelToOpen=model, storeResult=False, modelName=fmu_model_name, fmiVersion=fmi_ver, fmiType="me", includeSource=keep_sources)

                fmu_path = os.path.abspath(os.path.join(build_dir, model, fmu_file_name))
                if not (res == fmu_model_name and os.path.exists(fmu_path)):
                    raise DymolaException("Failed to generate FMU for " + model)

                res = dymola.system(f"move {fmu_model_name}.fmu ..\\{fmu_file_name}")

                if not res or not os.path.exists(final_fmu_path):
                    raise DymolaException(f"Failed to relocate {fmu_file_name}")

                LOGGER.info(f"[{counter}/{len(models)}] Successfully generated {final_fmu_path} ")
            except DymolaException as e:
                handle_dymola_exception(dymola, e, model)
                if not no_exit_on_error:
                    exit(1)

                failed_components.append(model)

            dymola.cd("..")

    except DymolaException as e:
        handle_dymola_exception(dymola, e)

    finally:
        if 'dymola' in locals() and dymola is not None:
            dymola.close()
            dymola = None

    return failed_components


def handle_dymola_exception(dymola, e, model=None):
    # Prints html formatted text, and it's ugly in the console
    last_error = dymola.getLastErrorLog()
    if model:
        LOGGER.error("Generating {0} FMU:\n{1}".format(model, last_error.rstrip()))
    else:
        LOGGER.error("Preparing dymola to compile models:\n" + last_error.rstrip())
    LOGGER.debug("Thrown exception was:\n{0}".format(str(e)))
