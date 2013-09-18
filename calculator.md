# RPN Calculator

Please implement a reverse polish notation (RPN) calculator.  It can be written
in a (non-esoteric) language you choose; it will be evaluated based on its
successful implementation of the algorithm, its style and conformance to best
practices according to the standards of the language, and its modularity.

This exercise may require two to four hours.


## Specifications

1. The calculator should use standard input and standard output, unless the
   language makes that impossible.

2. It should implement the four standard arithmetic operators.

3. It should support negative and decimal numbers, and should not have
   arbitrary limits on the number of operands.

4. The calculator should not allow invalid or undefined behavior.

5. The calculator should exit when it receives a `q` command or an end of input 
   indicator.

6. Write unit tests.  These should be executable independently of your
   calculator.


## Sample Input/Output

    > 5 8 +
    13

---

    > -3 -2 * 5 +
    11

---

    > 2 9 3 + *
    24

---

    > 20 13 - 2 / 
    3.5

---

The stack should be persistent between lines:                                   
                                                                                
    > 3                                                                         
    3                                                                           
                                                                                
    > 2 +                                                                       
    5                                                                           

---

Note that if your output is reasonable, it doesn't have to match this output
precisely; for example, if your calculator outputs floating point numbers, you
are not required to strip the trailing 0 from the output.