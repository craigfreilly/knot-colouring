JFLAGS = -g
CHOCOFLAG = -cp choco-solver-2.1.5.jar:.
JC = javac
JVM = java
SHELL := /bin/bash
INSTANCES := $(shell cut -d' ' -f1 instances-R-H-T.txt)
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
	mkdir -p $(RESULTS)/3

# results/%/3_1.txt:
# 	mkdir -p $(RESULTS)/$*
# 	$(JVM) $(CHOCOFLAG) KnotColouring Rolfsen-table/3_1.txt $* > results/$*/3_1.txt

results/3/%:
	mkdir -p $(RESULTS)/3
	$(JVM) $(CHOCOFLAG) KnotColouring R-H-T-table/$* 3 > results/3/$*


# results/5/3_1.txt:
# 	mkdir -p $(RESULTS)/5
# 	$(JVM) $(CHOCOFLAG) KnotColouring Rolfsen-table/3_1.txt 5 > results/5/3_1.txt

# results/7/3_1.txt:
# 	mkdir -p $(RESULTS)/7
# 	$(JVM) $(CHOCOFLAG) KnotColouring Rolfsen-table/3_1.txt 7 > results/5/3_1.txt

# results/11/3_1.txt:
# 	mkdir -p $(RESULTS)/11
# 	$(JVM) $(CHOCOFLAG) KnotColouring Rolfsen-table/3_1.txt 11 > results/11/3_1.txt

# %13/3_1.txt:
# 	mkdir -p $(RESULTS)/13
# 	$(JVM) $(CHOCOFLAG) KnotColouring Rolfsen-table/3_1.txt 13 > results/13/3_1.txt




# %.txt: classes 
# 	$(JVM) $(CHOCOFLAG) KnotColouring Rolfsen-table/$(INSTANCES) 3

# run: classes $(foreach p, $(COLOURS), $(RESULTS)/$(p)/3_1.txt)

run: classes $(foreach i, $(INSTANCES), $(RESULTS)/3/$(i)))

#	$(JVM) $(CHOCOFLAG) KnotColouring Rolfsen-table/3_1.txt 3

