# RPN Calculator

Please implement a reverse polish notation (RPN) calculator.  It can be written
in a (non-esoteric) language you choose; it will be evaluated based on its
successful implementation of the algorithm, its style and conformance to best
practices according to the standards of the language, and its extensibility.
Your solution will be reviewed by the whole team, so imagine that this is your
first commit into our production codebase!

## Specifications

1. The calculator should use standard input and standard output, unless the
   language makes that impossible.

2. It should implement the four standard arithmetic operators.

3. It should support negative and decimal numbers, and should not have
   arbitrary limits on the number of operations.

4. The calculator should not allow invalid or undefined behavior.

5. The calculator should exit when it receives a `q` command or an end of input 
   indicator (EOF).


## Sample Input/Output

    > 5 
    5
    > 8
    8
    > +
    13

---

    > -3
    -3
    > -2
    -2
    > *
    6
    > 5
    5
    > +
    11

---

    > 2
    2
    > 9
    9
    > 3
    3 
    > +
    12 
    > *
    24

---

    > 20
    20
    > 13
    13
    > -
    7
    > 2
    2
    > / 
    3.5