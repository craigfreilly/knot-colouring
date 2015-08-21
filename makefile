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

%.txt:
	mkdir -p $(RESULTS)/
	$(foreach c, $(COLOURS), mkdir -p $(RESULTS)/$(c) && $(JVM) $(CHOCOFLAG) KnotColouring Rolfsen-table/3_1.txt $(c))

# %.txt: classes 
# 	$(JVM) $(CHOCOFLAG) KnotColouring Rolfsen-table/$(INSTANCES) 3

run: classes $(foreach p, $(COLOURS), $(RESULTS)/$(p)/3_1.txt)

#	$(JVM) $(CHOCOFLAG) KnotColouring Rolfsen-table/3_1.txt 3

