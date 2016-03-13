TEX = manual_ru.tex ../texheader/mini.tex

LATEX = pdflatex -halt-on-error
manual_ru.pdf: $(TEX) Makefile
	$(LATEX) $< && $(LATEX) $<

log.log: ./exe.exe src.src
	./exe.exe < src.src > log.log && tail log.log
C = cpp.cpp ypp.tab.cpp lex.yy.c
H = hpp.hpp ypp.tab.hpp
./exe.exe: $(C) $(H)
	$(CXX) $(CXXFLAGS) -o $@ $(C)
ypp.tab.cpp: ypp.ypp
	bison $<
lex.yy.c: lpp.lpp
	flex $<
