JFLAGS = -g
CHOCOFLAG = -cp choco-solver-2.1.5.jar:.
JC = javac
JVM = java
SHELL := /bin/bash
INSTANCES := $(shell cut -d' ' -f1 instances.txt)
COLOURS := $(shell cut -d' ' -f1 colours.txt)
RESULTS := results
.SUFFIXES: .java .class
.java.class:
	$(JC) $(JFLAGS) $(CHOCOFLAG) $*.java

CLASSES = \
	Walk.java \
	Knot.java \
	AdjSetKnot.java \
	ColouringList.java \
	Colourist.java \
	KnotColouring.java 

default: classes

classes: $(CLASSES:.java=.class)

clean:
	$(RM) *.class

dir-%:
	mkdir -p $(RESULTS)/$(COLOURS)

%-coloured.txt:
	$JVM $(CHOCOFLAG) KnotColouring Rolfsen-table/$(i) $(COLOURS)

run: classes
	$(foreach i, $(INSTANCES), $(RESULTS)/$(COLOURS)/$(i))
#	$(JVM) $(CHOCOFLAG) KnotColouring Rolfsen-table/3_1.txt 3

