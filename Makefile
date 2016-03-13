.PHONY: all clean pdf log.log
all: pdf log.log

TEX = manual_ru.tex ../texheader/mini.tex

LATEX = pdflatex -halt-on-error
manual_ru.pdf: $(TEX) Makefile
	$(LATEX) $< && $(LATEX) $<

log.log: ./exe.exe src.src
	./exe.exe < src.src > log.log && tail log.log
C = c.c y.tab.c lex.yy.c
H = h.h y.tab.h
CFLAGS += -ansi
./exe.exe: $(C) $(H) Makefile
	$(CC) $(CFLAGS) -o $@ $(C)
y.tab.c: y.y
	bison $<
lex.yy.c: l.l Makefile
	flex -I $<
