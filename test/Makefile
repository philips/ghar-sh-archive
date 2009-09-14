TESTS = $(wildcard *.test)

PATH := $(abspath ../):$(PATH)
PATH := $(abspath ./fakebin):$(PATH)
export GHAR_HOME := $(abspath ./home-test)
export GHAR_DIR := $(GHAR_HOME)/.ghar
export TEMP_DIR := $(abspath ./tempdir)

default: clean $(TESTS)

clean:
	rm -Rf $(GHAR_HOME) $(TEMP_DIR)

$(TESTS):
	mkdir $(GHAR_HOME) $(TEMP_DIR)
	@echo "*** $@ ***"; perl run $@
	rm -Rf $(GHAR_HOME) $(TEMP_DIR)

.PHONY: $(TESTS)
