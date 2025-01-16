from __future__ import unicode_literals

import logging
import re

LOGGER = logging.getLogger("ephasor_fmu_interface")


class Pin(object):
    def __init__(self, name):
        if name is None:
            raise Exception("Cannot create {0} without a name".format(self.__class__.__name__))
        self.name = name

    def get_variables(self):
        raise NotImplementedError("Subclass of Pin must implement get_variables")

    def get_equations(self):
        raise NotImplementedError("Subclass of Pin must implement get_equations")


class PwPin(Pin):
    def __init__(self, name=None):
        super(PwPin, self).__init__(name.strip(';'))

    def get_variables(self):
        return [
            "OpalRT.NonElectrical.SignalRouting.PIN2INOUT %s_PIN2INOUT;\n" % self.name,
            "input OpalRT.NonElectrical.Connector.InputInterfacePin %s_vr;\n" % self.name,
            "input OpalRT.NonElectrical.Connector.InputInterfacePin %s_vi;\n" % self.name,
            "output OpalRT.NonElectrical.Connector.OutputInterfacePin %s_ir;\n" % self.name,
            "output OpalRT.NonElectrical.Connector.OutputInterfacePin %s_ii;\n" % self.name,
        ]

    def get_equations(self):
        return [
            "connect({0}_PIN2INOUT.p, comp.{0});\n".format(self.name),
            "connect({0}_PIN2INOUT.vr, {0}_vr);\n".format(self.name),
            "connect({0}_PIN2INOUT.vi, {0}_vi);\n".format(self.name),
            "connect({0}_PIN2INOUT.ir, {0}_ir);\n".format(self.name),
            "connect({0}_PIN2INOUT.ii, {0}_ii);\n".format(self.name),
        ]


class InterfacePin(Pin):
    def __init__(self, name=None):
        super(InterfacePin, self).__init__(name.strip(';'))

    def get_variables(self):
        return ["input OpalRT.NonElectrical.Connector.InputInterfacePin %s;\n" % self.name]

    def get_equations(self):
        return ["connect(comp.{0}, {0});\n".format(self.name)]


class FmuInterfaceBuilder:
    def __init__(self, lines):
        self.lines = lines
        self.name = lines[0].strip().split()[1]

        self.new_name = self.name + 'Model'
        self.interfacePinPattern = re.compile('.*OpalRT\.NonElectrical\.Connector\.(Input|Output)?InterfacePin.*')

    def get_pwpins(self):
        count = 0
        pwpins = []
        for line in self.lines:
            if 'OpalRT.NonElectrical.Connector.PwPin' in line:
                count = count + 1
                pwpins.append(PwPin([e.strip(';') for e in line.split() if "bus" in e][0]))

        LOGGER.debug("%s pwpin(s) identified in %s", count, self.name)
        for pin in pwpins:
            LOGGER.debug("\t{0}".format(pin.name))

        return pwpins

    def get_interfacepins(self):
        count = 0
        interfacepins = []
        for l in self.lines:
            if self.interfacePinPattern.match(l) is not None:
                count = count + 1
                splited = l.strip(';').split()

                LOGGER.debug(splited)
                if self.interfacePinPattern.match(splited[0]) is not None:
                    LOGGER.debug("second element")
                    interfacepins.append(InterfacePin(splited[1]))
                else:
                    LOGGER.debug("second element")
                    interfacepins.append(InterfacePin(splited[2]))

        LOGGER.debug("%s interfacepin(s) identified in %s", count, self.name)
        for i in interfacepins:
            LOGGER.debug("\t" + i.name)

        return interfacepins

    def make_class(self):
        # Modify the name
        new_class = [self.lines[0].replace(self.name, self.new_name)]

        # The rest of the class can be pasted as is, plus formatting
        new_class += self.lines[1:-1]

        # Closes class block
        new_class.append(self.lines[-1].replace(self.name, self.new_name))

        return new_class

    def build(self):
        LOGGER.debug("Processing %s", self.name)

        # Creates new block
        fmu_lines = ["block %s\n" % self.name]

        for line in self.make_class():
            fmu_lines.append("  " + line)

        # Add class component to the block
        fmu_lines += ["\n", "  %s comp;\n" % self.new_name, "\n"]

        pins = self.get_pwpins() + self.get_interfacepins()

        LOGGER.debug("Making pins for %s", self.name)
        for pin in pins:
            fmu_lines += ["    %s" % l for l in pin.get_variables()]
            fmu_lines.append("\n")

        fmu_lines.append("  equation\n")

        for pin in pins:
            fmu_lines += ["    %s" % l for l in pin.get_equations()]
            fmu_lines.append("\n")

        # Closes FMU block
        fmu_lines.append("end %s;\n" % self.name)

        return fmu_lines


def main():
    logging.basicConfig(level=logging.DEBUG)

    lines = [
        'class SimpleLoad\n',
        '  parameter Real G ( fixed = false );\n',
        '  parameter Real B ( fixed = false );\n',
        '  OpalRT.NonElectrical.Connector.PwPin bus0;\n',
        '  OpalRT.NonElectrical.Connector.PwPin bus1;\n',
        '  input OpalRT.NonElectrical.Connector.InterfacePin TRIP;\n',
        'equation\n',
        '  bus0.ir = -( G*bus0.vr - B*bus0.vi );\n',
        '  bus0.ii = -( B*bus0.vr + G*bus0.vi );\n',
        '  bus1.ir = -( G*bus1.vr - B*bus1.vi );\n',
        '  bus1.ii = -( B*bus1.vr + G*bus1.vi );\n',
        'end SimpleLoad;\n'
    ]

    builder = FmuInterfaceBuilder(lines)
    fmu = builder.build()

    for line in fmu:
        LOGGER.debug(line.rstrip())

    with open(builder.name + '.m0', "w") as f:
        for line in fmu:
            f.write(line)


if __name__ == "__main__":
    main()
