SUBDIRS := gmp libnet libpcap ncurses openssl zlib
DEPENDS := mpfr

.PHONY: all $(SUBDIRS) $(DEPENDS)
all: $(SUBDIRS) $(DEPENDS)

$(SUBDIRS):
	$(MAKE) -C $@

$(DEPENDS): $(SUBDIRS)
	$(MAKE) -C $@