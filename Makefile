TARGET=main
all: pdf

pdf:
	pdflatex $(TARGET)
	pdflatex $(TARGET)
	bibtex $(TARGET)
	pdflatex $(TARGET)

clean:
	rm -f *.aux *.log *.out *.bbl *.blg *.brf *~ *.bak $(TARGET).pdf $(TARGET).ps $(TARGET).toc $(TARGET).lot $(TARGET).lof

cleanall: clean
	rm -f $(TARGET).pdf

ps: pdf
	GS_OPTIONS=-dPDFSETTINGS=/prepress pdftops -level1 $(TARGET).pdf
