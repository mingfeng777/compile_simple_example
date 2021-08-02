CC?=gcc
EXE:=test2
OBJS:=$(EXE:%=%.o)

all: $(OBJS)
	$(Q)$(CC) -o $(EXE) $(OBJS)

install:
	install -m 755 test2 $(D)/test2

%.o: %.c
	$(Q)$(CC) -c -o $@ $<

clean distclean:
	rm -f $(EXE) *.o
