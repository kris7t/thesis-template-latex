PROJECTNAME=MScThesis

.PHONY: all clean

all:
	if [ -a out/run2.pid ]; then rm -rf out; fi;
	if [ -a out/run1.pid ]; then touch out/run2.pid; fi;
	mkdir -p out pdf
	touch out/run1.pid

	mkdir -p out out/include out/chapters pdf
	cd src; texfot latexmk -pdf -outdir=../out -jobname=$(PROJECTNAME) -interaction=nonstopmode main; echo $?
	mv out/$(PROJECTNAME).pdf pdf/$(PROJECTNAME).pdf

	rm  out/run*.pid

jenkins: clean all

clean:
	rm -rf ./out
	rm -rf ./pdf
