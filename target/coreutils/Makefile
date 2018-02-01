# Makefile for coreutils test case
export PACKAGE = coreutils-8.29
export DIR = install

.PHONY: all
all: $(DIR)/bin/cat-q

$(DIR)/bin/cat-q: $(DIR)/bin/cat
	@mv $(DIR) $(DIR).b
	@rm build/Makefile
	@$(MAKE) -f sub.mk LDFLAGS='-Wl,-q'
	$(foreach f,$(notdir $(wildcard $(DIR)/bin/*)), \
		mv $(DIR)/bin/$f $(DIR).b/bin/$f-q;)
	@touch $(DIR).b -r $(DIR)
	@rm -fr $(DIR)
	@mv $(DIR).b $(DIR)

$(DIR)/bin/cat:
	@$(MAKE) -f sub.mk all

%clean:
	$(MAKE) -f sub.mk $@

