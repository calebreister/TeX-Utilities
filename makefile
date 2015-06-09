# $(NAME) is appended at the beginning of this file by report.sh

.IGNORE: all
all:
	latexmk -pdf -pdflatex=lualatex -latexoption="-synctex=1 -interaction=batchmode" ./$(NAME).tex

.PHONY: clean
clean:
	rm -rf 

