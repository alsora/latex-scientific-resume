.PHONY : all latex bibtex view clean distclean

TARGET=cv_sample
SOURCE=$(TARGET).tex
LATEX=lualatex

all:
	$(LATEX) $(SOURCE)
	bibtex $(TARGET)
	$(LATEX) $(SOURCE)
	$(LATEX) $(SOURCE)

png:
	pdftoppm $(TARGET).pdf $(TARGET) -png -f 1 -singlefile

latex:
	$(LATEX) $(SOURCE)
	$(LATEX) $(SOURCE)

bibtex:
	bibtex $(TARGET)

view:
	open $(TARGET).pdf &

clean:
	rm -f $(TARGET).aux $(TARGET).bbl $(TARGET).blg $(TARGET).log

distclean:clean
	rm -f $(TARGET).pdf
