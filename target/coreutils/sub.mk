# Makefile for coreutils test case
include ../../testenv.mk

LDFLAGS =

.PHONY: all
all: $(DIR)

$(DIR): build/Makefile;
	@$(MAKE) -C build install > /dev/null

build/Makefile: $(PACKAGE)
	@mkdir -p build && \
	cd build && \
	env LDFLAGS=$(LDFLAGS) ../$(PACKAGE)/configure --prefix=$(abspath ./$(DIR)) > /dev/null 2>&1

$(PACKAGE): $(PACKAGE).tar.xz
	@tar axf $<
	@touch $@

$(PACKAGE).tar.xz:
	@curl -O https://ftp.gnu.org/gnu/coreutils/$(PACKAGE).tar.xz > /dev/null 2>&1

.PHONY: clean
clean:
	-@rm -rf $(DIR)
	$(if $(wildcard $(PACKAGE)/Makefile),$(MAKE) -C $(PACKAGE) clean)

realclean:
	-@rm -rf $(DIR) $(PACKAGE) $(PACKAGE).tar.xz build
