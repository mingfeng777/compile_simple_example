CC?=gcc
EXE1:=n_fibo_recursive
EXE2:=n_fibo_dp
OBJS1:=$(EXE1:%=%.o)
OBJS2:=$(EXE2:%=%.o)

all: $(OBJS1) $(OBJS2)
	$(Q)$(CC) -o $(EXE1) $(OBJS1)
	$(Q)$(CC) -o $(EXE2) $(OBJS2)

install:
	install -m 755 $(EXE1) $(D)/$(EXE1)
	install -m 755 $(EXE2) $(D)/$(EXE2)

%.o: %.c
	$(Q)$(CC) -c -o $@ $<

clean distclean:
	rm -f $(EXE) *.o
