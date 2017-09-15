# Makefile for a test case
include ../../testenv.mk
ROOT = ../..

TARGET = $(shell basename $$(pwd))
SOURCES = $(wildcard *.c) $(wildcard *.cpp) $(wildcard *.s) $(wildcard *.S)

.PHONY: all
all: $(BUILDDIR)$(TARGET) $(BUILDDIR)$(TARGET)-static

$(BUILDDIR)$(TARGET): $(SOURCES)
	@mkdir -p $(BUILDDIR)
	$(SHORT_CC) $(CFLAGS) $(WITH_PIE) -o $@ $^
	@ln -sf $@ $(TARGET)
$(BUILDDIR)$(TARGET)-static: $(SOURCES)
	@mkdir -p $(BUILDDIR)
	$(SHORT_CC) $(CFLAGS) $(WITH_PIE) $(STATIC_LINKING) -o $@ $^
	@ln -sf $@ $(TARGET)-static

.PHONY: clean
clean:
	-@rm -f $(BUILDDIR)$(TARGET) $(TARGET) \
		$(BUILDDIR)$(TARGET)-static $(TARGET)-static
