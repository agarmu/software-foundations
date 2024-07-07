COQMFFLAGS := -R . LF


CHAPTERS := Basics Induction Lists Poly Tactics Logic IndProp Maps ProofObjects IndPrinciples Rel Imp ImpParser ImpCEvalFun Extraction Auto AltAuto Postscript Bib

FILES := $(addprefix src/,$(addsuffix .v,$(CHAPTERS)))
TESTFILES := $(addprefix test/,$(addsuffix Test.v,$(CHAPTERS)))

build: Makefile.coq
	$(MAKE) -f Makefile.coq

clean::
	if [ -e Makefile.coq ]; then $(MAKE) -f Makefile.coq cleanall; fi
	$(RM) $(wildcard Makefile.coq Makefile.coq.conf) imp.ml imp.mli imp1.ml imp1.mli imp2.ml imp2.mli

Makefile.coq:
	coq_makefile $(COQMFFLAGS) -o Makefile.coq $(FILES) $(TESTFILES)

-include Makefile.coq

.PHONY: build clean
