SUBDIRS := bind9 busybox coreutils htop inetutils iperf3 masscan mtr nmap openssh socat sshpass strace tcpdump
DEPENDS :=

.PHONY: all $(SUBDIRS) $(DEPENDS)
all: $(SUBDIRS) $(DEPENDS)

$(SUBDIRS):
	$(MAKE) -C $@

$(DEPENDS): $(SUBDIRS)
	$(MAKE) -C $@
