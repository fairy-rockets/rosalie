.PHONY: clean all

ORIG=$(shell find . -name Chapter\*.md -print | sort -V)
PIXIV=$(ORIG:.md=.pixiv.txt)

all: $(PIXIV);

cl: $(PIXIV)
	@echo -n $(PIXIV) | xargs wc -m

%.pixiv.txt: %.md
	bash to-pixiv.sh $< > $@

clean:
	rm -f *.pixiv.txt
