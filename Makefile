.PHONY: all clean pdf log.log
all: pdf log.log

TEX = manual_ru.tex ../texheader/mini.tex

SRC = test/comment.src tmp/comment.log

LATEX = pdflatex -halt-on-error
pdf: manual_ru.pdf
manual_ru.pdf: $(TEX) $(SRC) Makefile
	$(LATEX) $< && $(LATEX) $<

tmp/%.log: test/%.src ./exe.exe
	./exe.exe < $< > $@

src.src: $(TEST)
	cat $(TEST) > src.src

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
