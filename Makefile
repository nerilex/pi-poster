SHELL=sh

SOURCES = $(wildcard src/main/*.ps)
PDF_TARGETS=$(SOURCES:src/main/%.ps=out/%.pdf)
PNG_TARGETS=$(PDF_TARGETS:%.pdf=%.png)
TARGETS=$(PDF_TARGETS) $(PNG_TARGETS)

FAST=1

ifdef FAST
	TARGETS:=$(filter-out %_A0.pdf,$(TARGETS))
	TARGETS:=$(filter-out %_A0.png,$(TARGETS))
endif

.PHONY: all clean

PS_FLAGS=-dNOSAFER -Isrc/inc

all: $(TARGETS)

out/%_A0.pdf: src/main/%_A0.ps
	ps2pdf $(PS_FLAGS) -sPAPERSIZE=a0 $< $@

out/%_A4.pdf: src/main/%_A4.ps
	ps2pdf $(PS_FLAGS) -sPAPERSIZE=a4 $< $@

out/%.pdf: src/main/%.ps
	ps2pdf $(PS_FLAGS) $< $@

%.png: %.pdf
	convert $< $@
	
clean:
	rm -rf -- $(TARGETS)