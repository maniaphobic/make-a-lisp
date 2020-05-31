default = compile
source_files = $(wildcard *.hs) MakeALisp/*.hs
object_files =  $(wildcard *.o) MakeALisp/*.o
interface_files = $(wildcard *.hi) MakeALisp/*.hi
artifact_files = $(object_files) $(interface_files)
executables = \
    step0_repl \
    step1_read_print

compile: $(executables)

MakeALisp/Step0.o: MakeALisp/Step0.hs
	ghc -c $<

step0_repl: MakeALisp/Step0.o step0_repl.o
	ghc -o $@ $?

step0_repl.o: step0_repl.hs
	ghc -c $<

step1_read_print: step1_read_print.o reader.o
	ghc $?

step1_read_print.o: step1_read_print.hs
	ghc -c $@ $<

reader.o: reader.hs
	ghc -c $@ $<

clean_artifacts:
	rm -f ${artifact_files}

clean_executables:
	rm -f ${executables}

clean_all: clean_artifacts clean_executables

clean: clean_artifacts
