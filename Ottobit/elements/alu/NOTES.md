# Notes of ALU

See https://people.cs.pitt.edu/~don/coe1502/current/Unit1/ArithBlock/ALU_Arith.html

You will need to create a simulation macro file which will run at least one set of vectors to test each possible outcome of each operation:

ADD : Signed Addition or Addition with Overflow
* A is positive, B is positive, and the result is less than or equal to +2^63-1 (no overflow).
* A is positive, B is positive, and the result is greater than +2^63-1 (overflow).
* A is positive, B is negative, the result is not equal to zero, there should never be overflow.
* A is positive, B is negative, the result is equal to zero, there should never be overflow.
* A is negative, B is positive, the result is not equal to zero, there should never be overflow.
* A is negative, B is positive, the result is equal to zero, there should never be overflow.
* A is negative, B is negative, and the result is greater than or equal to -2^63 (no overflow).
* A is negative, B is negative, and the result is less than -2^63 (overflow).

ADDU : Unsigned Addition or Addition without Overflow
* Repeat the test cases from the ADD simulation and make sure that overflow is never reported.

SUB : Signed Subtraction or Subtraction with Overflow
* A is positive, B is positive, the result is not equal to zero, there should never be overflow.
* A is positive, B is positive, the result is equal to zero, there should never be overflow.
* A is positive, B is negative, and the result is less than or equal to +2^63 (no overflow).
* A is positive, B is negative, and the result is greater than +2^63 (overflow).
* A is negative, B is positive, and the result is greater than or equal to -2^63 (no overflow).
* A is negative, B is positive, and the result is less than -2^63 (overflow).
* A is negative, B is negative, the result is not equal to zero, there should never be overflow.
* A is negative, B is negative, the result is equal to zero, there should never be overflow.

SUBU : Unsigned Subtraction or Subtraction without Overflow
* Repeat the test cases from the SUB simulation and make sure that overflow is never reported.