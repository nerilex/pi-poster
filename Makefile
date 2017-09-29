SHELL=sh

SOURCES = $(wildcard *.ps)

.PHONY: all clean

PS_FLAGS=-dNOSAFER

all: $(filter-out %.inc.pdf,$(SOURCES:%.ps=%.pdf))

%_A0.pdf: %_A0.ps
	ps2pdf $(PS_FLAGS) -sPAPERSIZE=a0 $<

%_A4.pdf: %_A4.ps
	ps2pdf $(PS_FLAGS) -sPAPERSIZE=a4 $<

%.pdf: %.ps
	ps2pdf $(PS_FLAGS) $<

	
clean:
	rm -rf -- *.pdf