
import re
from xml.etree import ElementTree as ET
from io import TextIOWrapper
from enum import Enum

GEN_COMPILEDB_VERSION = "0.2.0"

class CompileTools(Enum):
    GCC = 1
    GHS = 2
    TASKING = 3

CONFIG_COMPILE_TOOLS = CompileTools.TASKING
CONFIG_BUILDINFO_FILE = "D:\\Projects\\ADMAX\\Build\\AD_VCOS\\Source\\adpt\\buildinfo.xml"

def get_buildinfo(inputfile) -> tuple:
    source_cc_list = []
    include_info = []
    cflags_info = []
    build_root = ''
    tree = ET.parse(inputfile)
    root = tree.getroot()
    for child in root:
        if "sourceinfo" == child.tag:
            for source_info in child:
                if "Include" == source_info.attrib["type"]:
                    inc_info_list = re.split(" |\n", source_info.text.strip().rstrip())
                    for inc_info in inc_info_list:
                        inc_info_tmp = inc_info.replace("\\", "/")
                        include_info.append(inc_info_tmp)
                if "Sources" == source_info.attrib["type"]:
                    src_info_list = re.split(" |\n", source_info.text.strip().rstrip())
                    for cfile in src_info_list:
                        cfile_tmp = cfile.replace("\\", "/")
                        source_cc_list.append(cfile_tmp)
                if "BuildRoot" == source_info.attrib["type"]:
                    build_root = source_info.text.strip().rstrip()
        if "devtoolinfo" == child.tag:
            for tool_info in child:
                if "Compiler" == tool_info.attrib["type"]:
                    for compiler_info in tool_info:
                        if "AllOptions" == compiler_info.attrib["type"]:
                            options_list = re.split(" |\n", compiler_info.text.strip().rstrip())
                            for compiler_opt in options_list:
                                if "-D" in compiler_opt:
                                    cflags_info.append(compiler_opt)
    
    return (build_root, source_cc_list, include_info, cflags_info)

def gen_compiledb_file(compile_type:CompileTools, file_output:TextIOWrapper, prj_dir:str, c_file:str, include_info:list, cflags_info:list, inc_info_end = False):
    file_output.writelines("{\n")
    file_output.writelines("\"arguments\": [\n")
    file_output.writelines("\"arm-none-eabi-gcc\",\n")
    if CompileTools.GHS == compile_type:
        file_output.writelines("\"-D__ghs__\",\n")
        file_output.writelines("\"-D__CHAR_BIT=8\",\n")
        file_output.writelines("\"-D__SHRT_BIT=16\",\n")
        file_output.writelines("\"-D__INT_BIT=32\",\n")
        file_output.writelines("\"-D__LLONG_BIT=64\",\n")
        file_output.writelines("\"-DBRS_COMP_GHS\",\n")
        file_output.writelines("\"-DBRS_PLATFORM_ARM\",\n")
        file_output.writelines("\"-ID:/Projects/CompilerPath/GHS_INC/comp_202115/ansi\",\n")
    elif CompileTools.TASKING == compile_type:
        file_output.writelines("\"-D__TASKING__\",\n")
        file_output.writelines("\"-D__CHAR_BIT__=8\",\n")
        file_output.writelines("\"-D__WCHAR_BIT__=8\",\n")
        file_output.writelines("\"-D__SHORT_BIT__=16\",\n")
        file_output.writelines("\"-D__INT_BIT__=32\",\n")
        file_output.writelines("\"-D__SIZE_BIT__=32\",\n")
        file_output.writelines("\"-D__LONG_BIT__=32\",\n")
        file_output.writelines("\"-D__INTPTR_BIT__=32\",\n")
        file_output.writelines("\"-D__LLONG_BIT__=64\",\n")
        file_output.writelines("\"-D__fract=long\",\n")
        file_output.writelines("\"-D__sfract=short\",\n")
        file_output.writelines("\"-D__dsync()=0\",\n")
        file_output.writelines("\"-D__mfcr(x)=x\",\n")
        file_output.writelines("\"-D__disable()=0\",\n")
        file_output.writelines("\"-D__enable()=0\",\n")
        file_output.writelines("\"-D__nop()=0\",\n")
        file_output.writelines("\"-D__near=\",\n")
        file_output.writelines("\"-D__far=\",\n")
        file_output.writelines("\"-D__align=aligned\",\n")
        file_output.writelines("\"-ID:/Projects/CompilerPath/TASKING_INCLUDE/ctc/include\",\n")

    for cflag in cflags_info:
        file_output.writelines("\"" + cflag + "\",\n")

    for inc_path in include_info:
        file_output.writelines("\"" + inc_path + "\",\n")

    file_output.writelines("\"-c\",\n")
    file_output.writelines("\"-std=c99\",\n")
    file_output.writelines("\"-Wall\",\n")
    file_output.writelines("\"-o\",\n")
    file_output.writelines("\"build/test\",\n")
    file_output.writelines("\"" + c_file + "\"\n")
    file_output.writelines("],")
    file_output.writelines("\"directory\": \"" + prj_dir + "\",\n")
    file_output.writelines("\"file\": \"" + c_file + "\"\n")
    if inc_info_end:
        file_output.writelines("}\n")
    else:
        file_output.writelines("},\n")

if __name__ == "__main__":
    f_out = open("compile_commands.json", "w")
    (build_root_dir, source_list, inc_info, cflags_info) = get_buildinfo(CONFIG_BUILDINFO_FILE)
    f_out.writelines("[\n")
    for cc_file in source_list:
        if "" == cc_file:
            continue
        if cc_file == source_list[-1]:
            gen_compiledb_file(CONFIG_COMPILE_TOOLS, f_out, build_root_dir, cc_file, inc_info, cflags_info, inc_info_end=True)
        else:
            gen_compiledb_file(CONFIG_COMPILE_TOOLS, f_out, build_root_dir, cc_file, inc_info, cflags_info)
    f_out.writelines("]\n")
    f_out.close()
    print("finish")