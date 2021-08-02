include ./makefile.table_name
#include ../../.config

config_tmp = $(shell grep "^CONFIG_BOOK1" ../../.config | grep "_CH[0-9]*_" | grep "_PROGRAM[0-9]*=y")
dir_virtual_set = $(foreach i,$(config_tmp),$(shell echo "$i" | awk -F "_CH" '{print $$2}' | awk -F "_" '{print $$1}'),$(shell echo "$i" | awk -F "_PROGRAM" '{print $$2}' | awk -F "=" '{print $$1}'))

dir_path_set = $(foreach i,$(dir_virtual_set),$(CH$(shell echo "$i" | awk -F "," '{print $$1}'))/$(PROG$(shell echo "$i" | awk -F "," '{print $$2}')))

dir_path_set_clean = $(addsuffix _clean,$(dir_path_set))
dir_path_set_install = $(addsuffix _install,$(dir_path_set))

$(info minfeng, config_tmp is $(config_tmp))
$(info minfeng, dir_virtual_set is $(dir_virtual_set))
$(info minfeng, dir_path_set is $(dir_path_set))
$(info minfeng, dir_path_set_clean is $(dir_path_set_clean))
$(info minfeng, dir_path_set_install is $(dir_path_set_install))

BOOK_DIR=$(notdir $(patsubst %/,%,$(CURDIR)))

export BOOK_DIR
#########################################################

PHONY += all clean distclean $(dir_path_set) $(dir_path_set_clean) install check_install_dir $(dir_path_set_install)

all: $(dir_path_set)
	@echo dir_path_set is $(dir_path_set)

$(dir_path_set):
	$(Q)$(MAKE) -C $@ all

clean distclean: $(dir_path_set_clean)

$(dir_path_set_clean):
	$(Q)$(MAKE) -C $(patsubst %_clean,%,$@) clean

install: check_install_dir $(dir_path_set_install)

check_install_dir:
ifneq ($(INSTALL_DIR),)
	$(Q)install -d $(INSTALL_DIR)/$(BOOK_DIR)
else
$(error INSTALL_DIR is empty)
endif

$(dir_path_set_install):
	$(Q)$(MAKE) -C $(patsubst %_install,%,$@) install

.PHONY: $(PHONY)
