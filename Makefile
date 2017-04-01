SHELL=sh

SOURCES = $(wildcard *.ps)

.PHONY: all clean

all: $(SOURCES:%.ps=%.pdf)

%_A0.pdf: %_A0.ps
	ps2pdf -sPAPERSIZE=a0 $<

%_A4.pdf: %_A4.ps
	ps2pdf -sPAPERSIZE=a4 $<

%.pdf: %.ps
	ps2pdf $<

	
clean:
	rm -rf -- *.pdf