TESTS = $(wildcard *.test)

PATH := $(abspath ../):$(PATH)
export GHAR_HOME := $(abspath ./home-test)
export GHAR_DIR := $(GHAR_HOME)/.ghar

$(TESTS):
	mkdir $(GHAR_HOME)
	@echo "*** $@ ***"; perl run $@
	rm -Rf $(GHAR_HOME)

default: $(TESTS)

.PHONY: $(TESTS)
