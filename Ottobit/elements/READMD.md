# Digital Building Elements for a CPU

Let's start with this list of digital building blocks:
* Comparator
* Adder
* Subtractor (basically adder and 2C negate second operand)

These elements along with others implement the arithmetic logic unit (ALU). The ALU operations are as follows:
| F<sub>2:0</sub> | ALU Function |
| ---- | ------------ |
| ```000``` | A AND B |
| ```001``` | A OR B |
| ```010``` | A + B |
| ```011``` | not used |
| ```100``` | A AND !B |
| ```101``` | A OR !B |
| ```110``` | A - B |
| ```111``` | SLT |

***Note***: **SLT** (set on less than) is used for magnitude comparison.


