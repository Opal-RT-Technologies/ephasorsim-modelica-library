import os
import glob
from conans import ConanFile, tools


class EPhasorsimModelicaLibrary(ConanFile):
    name = "ephasorsim-modelica-library"
    major_minor = "1.0"
    default_user = "opal-rt-ephasorsim"

    scm = {
        "type": "git",
        "url": "auto",
        "revision": "auto"
    }

    url = "None"
    license = "None"
    description = "None"
    revision_mode = "scm"
    short_paths = True

    python_requires = ["conan-baseclasses/[>=12.0 <13.0]@opal-rt-buildsystem/release_2026.2", "ci-scripts/[>=2.0.0 <3.0.0]@opal-rt-buildsystem/release_2026.2"]
    python_requires_extend = "ci-scripts.CiScriptsBase", "conan-baseclasses.OpalBase"

    exports_sources = "fmus/**/*.fmu"

    def package(self):

        pkg_dir = os.path.join(self.package_folder)
        tools.mkdir(pkg_dir)

        self._package_fmus(
            src_dir=os.path.join(self.source_folder, "fmus", "linux64"),
            suffix="linux64"
        )

        self._package_fmus(
            src_dir=os.path.join(self.source_folder, "fmus", "win32"),
            suffix="win32"
        )

    def _package_fmus(self, src_dir, suffix):
        if not os.path.isdir(src_dir):
            self.output.warn("FMU directory not found: {}".format(src_dir))
            return

        for fmu in glob.glob(os.path.join(src_dir, "*.fmu")):
            base = os.path.basename(fmu)
            name, _ = os.path.splitext(base)
            dst_name = "{}.{}.fmu".format(name, suffix)
            dst = os.path.join(self.package_folder, dst_name)

            self.output.info("Packaging FMU: {} -> {}".format(base, dst_name))
            tools.rename(fmu, dst)
