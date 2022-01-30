TEX_ENGINE = xelatex
BIB_ENGINE = bibtex
OPR_SYSTEM = $(shell uname -s)

ifeq ($(OPR_SYSTEM), Darwin)
	DOC_VIEWER = open -a Preview
else
	DOC_VIEWER = zathura
endif

pdf:
	$(TEX_ENGINE) main
	$(DOC_VIEWER) main.pdf

bib:
	$(TEX_ENGINE) main
	$(BIB_ENGINE) main
	$(TEX_ENGINE) main
	$(TEX_ENGINE) main
	$(DOC_VIEWER) main.pdf

clean:
	rm main.aux main.bbl main.blg main.lof main.log main.lot main.out main.pdf

.PHONY: pdf bib clean
