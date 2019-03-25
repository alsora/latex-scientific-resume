.PHONY : all latex bibtex view clean distclean

TARGET=cv_sample
SOURCE=$(TARGET).tex

all:
	xelatex $(SOURCE)
	bibtex $(TARGET)
	xelatex $(SOURCE)
	xelatex $(SOURCE)

latex:
	xelatex $(SOURCE)
	xelatex $(SOURCE)

bibtex:
	bibtex $(TARGET)

view:
	open $(TARGET).pdf &

clean:
	rm -f $(TARGET).aux $(TARGET).bbl $(TARGET).blg $(TARGET).log

distclean:clean
	rm -f $(TARGET).pdf
