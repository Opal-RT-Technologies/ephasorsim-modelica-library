from __future__ import unicode_literals
import re
import logging
import logging.config
import os

LOGGER = logging.getLogger("frontend.eph_fmu.modelica_parser")


class ModelicaParserException(Exception):
    pass


class ModelicaParser(object):
    @staticmethod
    def extract_class(fname, classname):
        if os.path.basename(fname) == 'package.mo':
            classfile = os.path.join(os.path.dirname(fname), classname + '.mo')
            if os.path.exists(classfile):
                return ModelicaParser.extract_class(classfile, classname)
        begin = None
        end = None

        lines = safe_get_lines(fname)
        depth = 0
        openers = "(block|class|equation|interfacepin|model|pwpin)"
        for line_no, line in enumerate(lines):
            if re.match(r'\s*(class|model|block)\s+{0}\s*( ".*")?\s*$'.format(classname),line):
                begin = line_no
                depth = 1
            elif re.match(r'\s*{0}\s*(?!{1})\s*$'.format(openers, classname), line):
                depth += 1
            elif re.match(r'\s*end\s+{0}\s*;$'.format(classname), line):
                depth -= 1
                if begin is None or depth != 0:
                   LOGGER.debug(("Found an end for {0} at line {1} but opening and closing " +
                                   "sections do not seem to line up!").format(classname, line_no+1))
                end = line_no + 1
                break
            elif "end" in line:
                depth -= 1

        if begin is None or end is None:
            LOGGER.error("Unable to find class {0} in {1}".format(classname, fname))
            return None

        indent = len(lines[begin]) - len(lines[begin].lstrip())

        return [l[indent:] for l in lines[begin:end]]


    @staticmethod
    def parse_classes(fname):
        if os.path.basename(fname) == 'package.mo':
            package = os.path.join(os.path.dirname(fname), 'package.order')
            return [m.strip() for m in safe_get_lines(package)]
        lines = safe_get_lines(fname)
        classes = []
        for line in lines:
            m = re.match(r'\s*(block|class|model)\s+(?P<class_name>(?:\w+|\'\S+\'))\s*( ".*")?\s*$', line)
            if m:
                classes.append(m.group('class_name'))

        classes.sort()
        return classes


    @staticmethod
    def parse_package(fname):
        lines = safe_get_lines(fname)
        package = None
        for line in lines:
            m = re.match(r'\s*package\s+(?P<package_name>[\w\.]+)\s*$', line)
            if m:
                package = m.group('package_name')
                break

        return package


def safe_get_lines(fname):
    try:
        with open(fname) as f:
            lines = f.readlines()
    except IOError as e:
        err = e.message if hasattr(e, "message") and e.message else str(e)
        LOGGER.error("Could not open file {0} because {1}".format(fname, err))
        raise ModelicaParserException()
    return lines


#if __name__ == "__main__":
#        print ModelicaParser.class_begin_end(sys.argv[1], sys.argv[2])
#        print ModelicaParser.parse_classes(sys.argv[1])

