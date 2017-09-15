include testenv.mk

TARGET_DIRS = $(filter-out target/Makefile,$(wildcard target/*))
CONFIG_DIRS = $(wildcard x86_64*) $(wildcard aarch64*) $(wildcard arm*)

.PHONY: all clean realclean
all:  # default target

all clean:
	$(foreach DIR, $(TARGET_DIRS), \
		$(MAKE) -C $(DIR) PLATFORM=$(PLATFORM) --no-print-directory $@;)

realclean:
	$(foreach CONFIG, $(CONFIG_DIRS), rm -f $(CONFIG)/build/*;)

symlinks:
	@ln -sf $(PLATFORM) platform
	@ln -sf $(PLATFORM)/build build
