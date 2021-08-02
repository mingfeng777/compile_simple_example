#MAKEFLAGS += --no-print-directory


#Q:=@
curdir    := $(CURDIR)
srctree   := $(curdir)
TOPDIR    := $(srctree)

#VPATH := $(srctree)$(if $(KBUILD_EXTMOD),:$(KBUILD_EXTMOD))

export Q TOPDIR

PHONY += all
PHONY += _check_config
#_check_config: .config
#all: _check_config 

###########################################
INSTALL_DIR ?=
ifeq ($(INSTALL_DIR),)
INSTALL_DIR := $(shell grep ^CONFIG_PREFIX .config 2>/dev/null)
INSTALL_DIR := $(subst CONFIG_PREFIX=,,$(INSTALL_DIR))
INSTALL_DIR := $(subst ",,$(INSTALL_DIR))
#")
INSTALL_DIR_TMP = $(shell echo $(INSTALL_DIR) | grep ^/)
ifeq ($(INSTALL_DIR_TMP),)
INSTALL_DIR := $(CURDIR)/$(INSTALL_DIR)
endif
$(info INSTALL_DIR is $(INSTALL_DIR))
endif

export INSTALL_DIR

###########################################
PHONY += _files _make_files _clean_files

CROSS_COMPILE_DIR ?=
CROSS_COMPILE_PREFIX ?=
CROSS_COMPILE ?=
ifeq ($(CROSS_COMPILE),)
CROSS_COMPILE_DIR := $(shell grep ^CONFIG_MF_CROSS_COMPILER_DIR .config 2>/dev/null)
CROSS_COMPILE_DIR := $(subst CONFIG_MF_CROSS_COMPILER_DIR=,,$(CROSS_COMPILE_DIR))
CROSS_COMPILE_DIR := $(subst ",,$(CROSS_COMPILE_DIR))
#")
CROSS_COMPILE_PREFIX := $(shell grep ^CONFIG_MF_CROSS_COMPILER_PREFIX .config 2>/dev/null)
CROSS_COMPILE_PREFIX := $(subst CONFIG_MF_CROSS_COMPILER_PREFIX=,,$(CROSS_COMPILE_PREFIX))
CROSS_COMPILE_PREFIX := $(subst ",,$(CROSS_COMPILE_PREFIX))
#")
CROSS_COMPILE := $(CROSS_COMPILE_DIR)/$(CROSS_COMPILE_PREFIX)
#$(info CROSS_COMPILE_DIR is $(CROSS_COMPILE_DIR))
endif

PATH := $(CROSS_COMPILE_DIR)/bin:$(PATH)

export PATH

# SUBARCH tells the usermode build what the underlying arch is.  That is set
# first, and if a usermode build is happening, the "ARCH=um" on the command
# line overrides the setting of ARCH below.  If a native build is happening,
# then ARCH is assigned, getting whatever value it gets normally, and
# SUBARCH is subsequently ignored.

ifneq ($(CROSS_COMPILE),)
SUBARCH := $(shell echo $(CROSS_COMPILE) | cut -d- -f1 | sed 's:^.*/::g')
else
SUBARCH := $(shell uname -m)
endif
SUBARCH := $(shell echo $(SUBARCH) | sed -e s/i.86/i386/ -e s/sun4u/sparc64/ \
					 -e s/arm.*/arm/ -e s/sa110/arm/ \
					 -e s/s390x/s390/ -e s/parisc64/parisc/ \
					 -e s/ppc.*/powerpc/ -e s/mips.*/mips/ )

ARCH ?= $(SUBARCH)

include Makefile.env
#$(info minfeng, CROSS_COMPILE is $(CROSS_COMPILE))
#$(info minfeng, CC is $(CC))

# For maximum performance (+ possibly random breakage, uncomment
# the following)
MAKEFLAGS += --include-dir=$(srctree)
MAKEFLAGS += -rR

_files:= minfeng_book 

all: .config _make_files

_make_files: $(_files)
	$(Q)$(MAKE) -C $(_files) all

clean: _clean_files

_clean_files: $(_files)
#	rm -r $(INSTALL_DIR)
	@echo 'rm -f $(INSTALL_DIR))'
	$(Q)$(MAKE) -C $(_files) clean

PHONY += mf_clean
mf_clean: $(_files)
#	rm -r $(INSTALL_DIR)
	@echo 'rm -f $(INSTALL_DIR))'
	$(Q)$(MAKE) -C $(_files) distclean

###########################################
PHONY += install check_install_dir _install_files
install: .config check_install_dir _install_files

check_install_dir:
	$(Q)mkdir -p "$(INSTALL_DIR)" || exit1

_install_files: $(_files)
	$(Q)$(MAKE) -C $(_files) install

###########################################
PHONY += menuconfig
menuconfig: _check_tools
	cp_conf/mconf Config.in

PHONY += _check_tools
_check_tools:
	$(Q)$(MAKE) -f Makefile.prepare

.PHONY: $(PHONY)
