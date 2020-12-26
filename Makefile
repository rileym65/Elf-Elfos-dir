PROJECT = dir

$(PROJECT).prg: $(PROJECT).asm bios.inc
	../dateextended.pl > date.inc
	../build.pl > build.inc
	rcasm -l -v -x -d 1802 $(PROJECT) 2>&1 | tee dir.lst
	cat $(PROJECT).prg | sed -f adjust.sed > x.prg
	rm $(PROJECT).prg
	mv x.prg $(PROJECT).prg

clean:
	-rm $(PROJECT).prg

