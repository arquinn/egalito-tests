# Makefile for codeform test case
include ../../testenv.mk
ROOT = ../..

TARGET = $(shell basename $$(pwd))
DIR = dir

.PHONY: all
all: $(DIR)/codeform

$(DIR):
	@unzip -q codeform.zip -d $(DIR)

$(DIR)/codeform: $(DIR)
	@cd $(DIR) && make CFLAGS="-W -Wall -ansi -pedantic -O2 -g -Wno-unused-but-set-variable"

.PHONY: clean
clean:
	-@rm -rf $(DIR)
