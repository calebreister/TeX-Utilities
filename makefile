NAME := $(shell basename "$(CURDIR)")

.IGNORE: all
all:
	mkdir -p ./tmp
	rm -f ./$(NAME).log #Clear errors on recompile
	lualatex -synctex=1 -interaction=batchmode -output-directory=./tmp ./$(NAME).tex
	mv -f ./tmp/$(NAME).pdf ./
	mv -f ./tmp/$(NAME).log ./ #Move compile log file

.PHONY: clean
clean:
	rm -rf ./tmp

