PROJECT= opencc

CC= gcc

lib: opencc.cma opencc.cmxa

opencc.cma: opencc.ml
	ocamlfind ocamlc -package ctypes.foreign -a -o $@ $^

opencc.cmxa: opencc.ml
	ocamlfind ocamlopt -package ctypes.foreign -a -o $@ $^

opencc.ml: opencc.cmi


opencc.cmi: opencc.mli
	ocamlfind ocamlc -package ctypes.foreign $<

.PHONY: install clean

install: lib
	ocamlfind install $(PROJECT) META *.mli *.cmi *.cma *.cmxa *.a

uninstall:
	ocamlfind remove $(PROJECT)

clean:
	rm -f *.annot *.o *.cm* *.a *.so

