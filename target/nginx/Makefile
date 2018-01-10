# Makefile for nginx test case
include ../../testenv.mk

DIR = nginx

.PHONY: all
all: $(DIR)/sbin/nginx

$(DIR)/sbin/nginx:
	@cd nginx-1.11.3; \
	./configure --prefix=$(abspath ./$(DIR)) --with-cc-opt='-O2 -fPIC' --with-ld-opt='-pie' --with-threads >& /dev/null; \
	$(MAKE); \
	$(MAKE) install; \
	cd -; \
	dd if=/dev/zero of=$(DIR)/html/100k bs=1024 count=100; \
	dd if=/dev/zero of=$(DIR)/html/1024k bs=1024 count=1024

.PHONY: clean
clean:
	-@rm -rf $(DIR)
	$(if $(wildcard nginx-1.11.3/Makefile),$(MAKE) -C nginx-1.11.3 clean)