
#MD_PREPROCESSOR=markdown-pp /dev/stdin
#MD_PREPROCESSOR=multimarkdown /dev/stdin
# MD_PREPROCESSOR=mmark /dev/stdin

MD_FILES= draft-fengfar-led.md

draft-fengfar-led.txt: $(MD_FILES)

base:	draft-fengfar-led.txt

LIBDIR := lib
include $(LIBDIR)/main.mk

$(LIBDIR)/main.mk:
ifneq (,$(shell grep "path *= *$(LIBDIR)" .gitmodules 2>/dev/null))
	git submodule sync
	git submodule update $(CLONE_ARGS) --init
else
	git clone -q --depth 10 $(CLONE_ARGS) \
	    -b main https://github.com/martinthomson/i-d-template $(LIBDIR)
endif

cleantrash:
	rm -f *~
