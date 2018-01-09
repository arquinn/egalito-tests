# Makefile for nginx test case
include ../../testenv.mk

BUILDDIR = nginx

.PHONY: all
all: $(BUILDDIR)/sbin/nginx

$(BUILDDIR)/sbin/nginx:
	@cd nginx-1.11.3; \
	./configure --prefix=$(abspath ./$(BUILDDIR)) --with-cc-opt='-O2 -fPIC' --with-ld-opt='-pie' --with-threads >& /dev/null; \
	$(MAKE); \
	$(MAKE) install

.PHONY: clean
clean:
	-@rm -rf $(BUILDDIR)
	$(if $(wildcard nginx-1.11.3/Makefile),$(MAKE) -C nginx-1.11.3 clean)
