#==============================================================================#
# Copyleft (c) 2022 linyuzhou linyuzhou@lixiang.com
#
# Copyright description information omitted.
#
# @file    buildinfo.mk
# @author  linyuzhou
# @version 0.1.0
# @date    2023-08-15
# @brief   Omit
#          This file contains:
#              - Omit
#
# -----------------------------------------------------------------------------
# Change History:
#   <Date>      |  <Version>  |  <Author>   |  <Description>
#   2023-08-15  |  v0.1.0     |  linyuzhou  |  Create file
# -----------------------------------------------------------------------------
#==============================================================================#

.PHONY: buildinfo buildinfo_clean
buildinfo: buildinfo.xml

ifeq ($(MAKECMDGOALS),buildinfo)
BUILDINFO_CC := $(CC)
BUILDINFO_AS := $(AS)
BUILDINFO_LD := $(LD)
BUILDINFO_BUILD_ROOT_DIR := $(realpath $(PROJECT_ROOT_PATH)/Source/adpt)
BUILDINFO_C_FLAGS := $(VCOS_C_FLAGS) $(USER_CFLAGS)
BUILDINFO_ASM_FLAGS := $(VCOS_AS_FLAGS) $(USER_ASFLAGS)
BUILDINFO_LD_FLAGS := $(VCOS_LD_FLAGS) $(USER_LDFLAGS)
BUILDINFO_C_INC_LST := $(patsubst %,-I%,$(PROJECT_INCLUDE_DIRS))
BUILDINFO_C_SOURCE_LST := $(VCOS_C_SOURCES) $(VCOS_CXX_SOURCES)
endif

buildinfo.xml: 
	@echo "Generate $@"
	$(file >$@,<?xml version='1.0' encoding='UTF-8'?>)
	$(file >>$@,<buildinformation>)
	$(file >>$@, <devtoolinfo>)
	$(file >>$@,    <tool type='Compiler' manufacturer='$(CC)'>)
	$(file >>$@,      <entry type='AllOptions'>$(patsubst -o%,-o,$(subst -o ,-o,$(BUILDINFO_C_FLAGS)))</entry>)
	$(file >>$@,    </tool>)
	$(file >>$@,    <tool type='Assembler' manufacturer='$(AS)'>)
	$(file >>$@,      <entry type='AllOptions'>$(patsubst -o%,-o,$(subst -o ,-o,$(BUILDINFO_ASM_FLAGS)))</entry>)
	$(file >>$@,    </tool>)
	$(file >>$@,    <tool type='Linker' manufacturer='$(LD)'>)
	$(file >>$@,      <entry type='AllOptions'>$(BUILDINFO_LD_FLAGS)</entry>)
	$(file >>$@,    </tool>)
	$(file >>$@, </devtoolinfo>)
	$(file >>$@, <sourceinfo>)
	$(file >>$@,  <entry type='BuildRoot'>$(BUILDINFO_BUILD_ROOT_DIR))
	$(file >>$@,  </entry>)
	$(file >>$@,  <entry type='Include'>$(BUILDINFO_C_INC_LST))
	$(file >>$@,  </entry>)
	$(file >>$@,  <entry type='Sources'>$(BUILDINFO_C_SOURCE_LST))
	$(file >>$@,  </entry>)
	$(file >>$@, </sourceinfo>)
	$(file >>$@,</buildinformation>)

buildinfo_clean:
	@echo "Clean      buildinfo"
	@rm -rf buildinfo.xml
