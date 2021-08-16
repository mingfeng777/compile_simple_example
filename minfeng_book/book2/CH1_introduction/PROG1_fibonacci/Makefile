srcdir:= $(CURDIR)/files
curdir = $(CURDIR)
prog_dir = $(notdir $(patsubst %/,%,$(curdir)))
ch_dir   = $(notdir $(patsubst %/$(prog_dir),%,$(patsubst %/,%,$(curdir))))
ifneq ($(INSTALL_DIR),)
 ifneq ($(BOOK_DIR),)
  D:=$(INSTALL_DIR)/$(BOOK_DIR)/$(ch_dir)/$(prog_dir)
 else
  $(error BOOK_DIR is empty)
 endif
else
$(error INSTALL_DIR is empty)
endif

export D

all:
	$(Q)$(MAKE) -C $(srcdir)

clean distclean:
	$(Q)$(MAKE) -C $(srcdir) clean

install: check_install_dir
	$(Q)$(MAKE) -C $(srcdir) install

check_install_dir:
	$(Q)install -d $(D)
