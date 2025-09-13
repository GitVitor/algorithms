# Data Structures and Algorithms

Each folder contains a problem and an algorithm aimed at solving the problem.

## hofstadter-figure-figure

*Language used:* Javascript

Hofstadter's figure-figure sequence is a family of integer sequences defined by nonlinear recurrence relations. One way to define the sequence is:

F(1) = 1; S(1) = 2; F(n) = F(n-1) + S(n-1), n > 1;

S(n) is the value that is not in F(n).

For example, F(2) = F(1) + S(1) = 3, and S(2) is the next integer not in R, which is 4. The sequence R is called "figure," and the sequence S is called "complementary figure."

### What does my algorithm do?

I created a Javascript algorithm that efficiently helps find the position of an item in sequence F.
For example:
```
hof 0 = 1
hof 1 = 3
hof 2 = 7
```

Some interesting points about this algorithm:
- I used recursive programming techniques to solve the problem;
- As the number of items within the lists grows significantly with each iteration, the algorithm quickly starts to lose performance in finding values within these lists. Therefore, it was necessary to use Javascript's [Set](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Set) to achieve better performance.
- TLDR; Theory behind Javascript generators: By using Javascript's Generator, I replicated the concept of Lazy Evaluation present in functional languages like Haskell. Using Generators, it was possible to create sequences that are not evaluated until they are needed, avoiding unnecessary processing and improving program performance. In Haskell, this strategy is called "lazy evaluation" and can be applied in various contexts, such as generating infinite lists. With the use of Generators in Javascript, it is possible to achieve a similar behavior, allowing the creation of sequences that are generated on demand and consumed efficiently. This makes algorithm implementation more flexible and efficient, as it is possible to save computational resources by avoiding the processing of elements that will not be used.


## Split

**Language used: [Oz language](http://mozart2.org/mozart-v1/doc-1.4.0/tutorial/index.html)**

The goal of the Split function is to divide the input list Xs into two output lists Ys and Zs, alternating the elements between the two lists. For example, if the input list is [1 2 3 4], then the function should return the lists [1 3] and [2 4].

The function uses recursion to divide the input list. It first checks if the list is empty or contains only one element. If so, it assigns the appropriate values to the output variables and returns. Otherwise, it divides the list into three parts: the first element (X1), the second element (X2), and the rest of the list (Xr). Then, it recursively calls itself with the remaining list as input and assigns the results to the output variables.

Overall, this algorithm efficiently divides a list into two parts by alternating its elements.

## AppendD

**Language used: [Oz language](http://mozart2.org/mozart-v1/doc-1.4.0/tutorial/index.html)**

The goal of this algorithm is to implement an efficient way to append one list with another list.
When I say efficient, I am referring to the fact that usually appending one list with another can take O(n) time, but with this AppendD algorithm, the time is constant O(1).

To achieve O(1) time in this algorithm, it was necessary to use a technique called Difference Structure. In this technique, we have two structures:
- Head - A structure that is filled (or not);
- Tail - Another structure that is not filled.

The idea behind this difference structure technique is that we can create new structures by combining them with existing structures.