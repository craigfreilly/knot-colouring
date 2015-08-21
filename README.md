# knot-colouring
A constraint programming model for knot colouring.

##How to run
Clone this repo or just download the java files.  Then compile using javac *.java.  _KnotColouring_ currently takes as argument a file name, followed by an integer.  The integer is the value p, for which you wish to colour the knot mod p by.  For example, _KnotColouring_ is run from the command line as follows:

```
java KnotColouring trefoil.txt 3
```

The file should be a text file, and should contain one or more Gauss codes for knots in the format "-1, 2, -3, 1, -2, 3", each on its own line, and with no trailing empty lines at the end of the file.  _KnotColouring_ outputs to the command line the Gauss code for a knot followed by its colouring should one exist, and "No solution found" if the knot does not admit a colouring mod p.

###Dependencies

You need to have java installed on your machine and have [Choco version 2.1.5](http://www.dcs.gla.ac.uk/~pat/cpM/jchoco/jchoco2.1.5/jar/) in your classpath for this to work.

##Overview

This repo currently consists of my knot data structures and constraint model for colouring knots.  ColouringList is really another data structure for a knot and should be renamed.

An _AdjSetKnot_ bject is a knot modelled as a digraph and implemented as if using adjacency sets for crossings.  Each crossing has as a label an array of its outbound arcs, the first position in the array is for the arc which is outbound from the crossing in an over orientation and the second position in the array if for the arc which is outbound from the crossing in an under orientation.  Each crossing can be named, and each crossing is given a number corresponding to the order in which it is added to the knot.

_ColouringList_ takes a knot (currently an _AdjSetKnot_) and adds its crossings to an array.  Each node in the array has a label for the crossing number (the one it is assigned when added to the knot) and two stacks, one corresponding to the over arcs for the crossing and another the under -- if all goes well each node should have two stacks of size two.  _ColouringList_ is really another data structure to represent a knot.

_Colourist_ takes a knot, and attempts to colour it mod p using the following model.

##The constraint model

Each arc in the knot (where over arcs are split into two arcs, both incomming and outgoing at a crossing) is represented in the model in an integer variable array called _arc_, which is of length numberOfArcs.  The domain of each variable depends on the colouring, and is 0 to p-1.  The arcs in the arc array are ordered as they appear in the walk from some arbirary crossing (currently we start from the crossing reached from the over outbound arc from the last crossing added to the knot).  For each crossing we add the following constraint, that 2x - y - z = 0 mod p, where x is the colour on an over arc and y and z are colours on the under arc.  Only one over arc is used, and the constraint that over arcs at a crossing should take the same colour is imposed.

We also have an array of 0/1 variables (called notAllSame) which is numberOfArcs -1 in length, and for each pair {x, x+ 1} if x != x+1 then the (variable in the notAllSame array with the same index as x in the arcs array) gets set to 1.  I then require that the sum of the notAllSame is geq to 1. 
