# Makefile for a test case
include ../../testenv.mk
ROOT = ../..

TARGET = $(shell basename $$(pwd))
SOURCES = $(wildcard *.c) $(wildcard *.cpp) $(wildcard *.s) $(wildcard *.S)

.PHONY: all
all: $(BUILDDIR)$(TARGET) $(BUILDDIR)$(TARGET)-static $(BUILDDIR)$(TARGET)-s

$(BUILDDIR)$(TARGET): $(SOURCES)
	@mkdir -p $(BUILDDIR)
	$(SHORT_CC) $(CFLAGS) $(WITH_PIE) -o $@ $^
	@ln -sf $@ $(TARGET)
$(BUILDDIR)$(TARGET)-static: $(SOURCES)
	@mkdir -p $(BUILDDIR)
	$(SHORT_CC) $(CFLAGS) $(STATIC_LINKING) -o $@ $^
	@ln -sf $@ $(TARGET)-static
$(BUILDDIR)$(TARGET)-s: $(SOURCES)
	@mkdir -p $(BUILDDIR)
	$(SHORT_CC) $(CFLAGS) $(WITH_PIE) -o $@ $^ -s
	@ln -sf $@ $(TARGET)-s

.PHONY: clean
clean:
	-@rm -f $(BUILDDIR)$(TARGET) $(TARGET) \
		$(BUILDDIR)$(TARGET)-static $(TARGET)-static \
		$(BUILDDIR)$(TARGET)-s $(TARGET)-s
