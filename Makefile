.PHONY: tests install

tests:
	cd test && bats *

install:
	bin/install $(DIR)
