CC?=gcc
EXE:=test
OBJS:=$(EXE:%=%.o)

all: $(OBJS)
	$(Q)$(CC) -o $(EXE) $(OBJS)

install:
	install -m 755 test $(D)/test

%.o: %.c
	$(Q)$(CC) -c -o $@ $<

clean distclean:
	rm -f $(EXE) *.o
