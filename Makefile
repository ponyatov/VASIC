log.log: ./exe.exe src.src
	./exe.exe < src.src > log.log && tail log.log
C = c.c y.tab.c lex.yy.c
H = h.h y.tab.h
CFLAGS += -ansi
./exe.exe: $(C) $(H)
	$(CC) $(CFLAGS) -o $@ $(C)
y.tab.c: y.y
	bison $<
lex.yy.c: l.l
	flex -I $<

.PHONY: all clean pdf log.log
all: pdf log.log

clean:
	rm -rf *.log *.out *.aux *.toc tmp/*

TEX = manual_ru.tex ../texheader/mini.tex 
TEX += ../texheader/lgpl.tex ../texheader/soft.tex

SRC = test/comment.src test/sym.src test/str.src test/int.src test/num.src
SRC += test/hex.src test/bin.src
SRC += test/print.src

LOG = tmp/comment.log tmp/sym.log tmp/str.log tmp/int.log tmp/num.log
LOG += tmp/hex.log tmp/bin.log
LOG += tmp/print.log

LATEX = pdflatex -halt-on-error
pdf: manual_ru.pdf
manual_ru.pdf: $(TEX) $(SRC) $(LOG) Makefile
	$(LATEX) $< && $(LATEX) $<

tmp/%.log: test/%.src ./exe.exe
	mkdir -p tmp ; ./exe.exe < $< > $@

src.src: $(SRC) Makefile
	cat $(SRC) > src.src


