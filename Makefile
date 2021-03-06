all: target
FORCE:
	;

.PHONY: FORCE

target: uhttpd uhttpd2 uhttpd3 uhttpd4 uhttpd5 uhttpd6

CC=cc

CFLAGS=-Wall -W -O2 -I/usr/include -I/usr/local/include

# DEBUG option, set before make, eg 'DEBUG=1 make'
ifeq ($(DEBUG),1)
	CFLAGS+=-DDEBUG=1
endif

LDFLAGS=-L /usr/lib/x86_64-linux-gnu/ -L /usr/local/lib -lmicrohttpd -levent -levhtp -lhiredis -lmemcached

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

uhttpd: uhttpd.c
	$(CC) $< -o $@ $(CFLAGS) $(LDFLAGS)

uhttpd2: uhttpd2.c
	$(CC) $< -o $@ $(CFLAGS) $(LDFLAGS)

uhttpd3: uhttpd3.c
	$(CC) $< -o $@ $(CFLAGS) $(LDFLAGS)

uhttpd4: uhttpd4.c
	$(CC) $< -o $@ $(CFLAGS) $(LDFLAGS)

uhttpd5: uhttpd5.c
	$(CC) $< -o $@ $(CFLAGS) $(LDFLAGS)

uhttpd6: uhttpd6.c
	$(CC) $< -o $@ $(CFLAGS) $(LDFLAGS)

clean:
	rm -f *.o uhttpd uhttpd2 uhttpd3 uhttpd4 uhttpd5 uhttpd6
