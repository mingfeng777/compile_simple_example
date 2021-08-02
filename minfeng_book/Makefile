include ../.config

BOOK_LIST:=$(patsubst %/,%,$(sort $(dir $(wildcard */))))
$(info minfeng,BOOK_LIST is $(BOOK_LIST))

BOOK1_CONFIG:=
BOOK2_CONFIG:=

include Makefile.book_config_parse

PHONY += all clean distclean install
all:
ifeq ($(BOOK1_CONFIG),1)
	$(Q)$(MAKE) -C book1 all
endif
ifeq ($(BOOK2_CONFIG),1)
	$(Q)$(MAKE) -C book2 all
endif

clean:
ifeq ($(BOOK1_CONFIG),1)
	$(Q)$(MAKE) -C book1 clean
endif
ifeq ($(BOOK2_CONFIG),1)
	$(Q)$(MAKE) -C book2 clean
endif

install:
ifeq ($(BOOK1_CONFIG),1)
	$(Q)$(MAKE) -C book1 install
endif
ifeq ($(BOOK2_CONFIG),1)
	$(Q)$(MAKE) -C book2 install
endif


clean-book_list:= $(addprefix _clean_,$(BOOK_LIST))
PHONY += $(clean-book_list)
distclean: $(clean-book_list)

$(clean-book_list):
	$(Q)$(MAKE) -C $(patsubst _clean_%,%,$@) $(MAKECMDGOALS)


.PHONY: $(PHONY)
