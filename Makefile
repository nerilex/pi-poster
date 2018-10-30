SHELL=sh

SOURCES = $(wildcard src/main/*.ps)
PDF_TARGETS=$(SOURCES:src/main/%.ps=out/%.pdf)
PNG_TARGETS=$(PDF_TARGETS:%.pdf=%.png)
TARGETS=$(PDF_TARGETS) $(PNG_TARGETS)
GS=gs
FAST=1

ifdef FAST
	TARGETS:=$(filter-out %_A0.pdf,$(TARGETS))
	TARGETS:=$(filter-out %_A0.png,$(TARGETS))
endif

.PHONY: all clean TEST_int TEST_float test TEST

PS_FLAGS=-dNOSAFER -Isrc/inc

all: $(TARGETS)
test: out/float-test.ps out/int-test.ps
TEST: TEST_float TEST_int

out/%_A0.pdf: src/main/%_A0.ps
	ps2pdf $(PS_FLAGS) -sPAPERSIZE=a0 $< $@

out/%_A4.pdf: src/main/%_A4.ps
	ps2pdf $(PS_FLAGS) -sPAPERSIZE=a4 $< $@

out/%.pdf: src/main/%.ps
	ps2pdf $(PS_FLAGS) $< $@

float-test_conf.ps:
	echo '% /test_limit 1000 def' > $@

int-test_conf.ps:
	echo '% /test_limit 1000 def' > $@

TEST_float: src/inc/pi-bbp-float-core.inc.ps
	$(GS) $(PS_FLAGS) $<

TEST_int: src/inc/pi-bbp-int-core.inc.ps
	$(GS) $(PS_FLAGS) $<

out/%-test.ps: src/inc/cheat_hex.ps src/inc/trigo.inc.ps src/inc/paper.inc.ps src/inc/aux.inc.ps %-test_conf.ps src/inc/test.inc.ps src/inc/pi-bbp-%-core.inc.ps
	cat $^ > $@

%.png: %.pdf
	convert $< $@
	
clean:
	rm -rf -- $(TARGETS)