# Word Search Challenge

**Problem Statement**
Given a 2D Matrix of chars, find all occurrences of provided words in the matrix.
A word can be matched in all 8 directions at any point.
Word is said to be found in a direction if all characters match in this direction (not in zig-zag form). The 8 directions are, Horizontally Left, Horizontally Right, Vertically Up, Vertical Down and 4 Diagonal directions.

> **What about duplicates in the dictionary?**
If the input dictionary contains the same word multiple times, you can either count it multiple times or just once. Both answers are acceptable. For example, given the input dictionary "APPLE", "APPLE", "APPLE" you can find "APPLE" once or three times in the matrix. Some of the sample input dictionaries here do contain the same word twice but the final inputs we run the performance tests on will not.

**Program Input**

Line|Content|Example
------------|------------|------------
1|Matrix rows, matrix columns|4,5 meaning 4 rows of 5 columns
2|Matrix of characters within which to search|A,P,P,L,E,N,-,E,D,T,T,-,T,E,E,T,O,A,Z,B
 |||meaning:
 |||APPLE
 |||N-EDT
 |||T-TEE
 |||TOAZB
3|Comma-separated dictionary of words for which to search|APPLE,JAVA,COMPUTER,DESK,TEA,TOP,ANT,BEEP,TO,TEST

**Desired Output**
One line for each word in the dictionary. If the word is found, give the positions it was found at, as below. The last line is the total number of words found.
For the input above, the output on stdout should be:

```
APPLE: (0,0) SW
JAVA: Not Found
TO: (3,0) NE
2 words found.
```

**Winning Criteria**
 - Correctness - winners will have the correct answer
 - Execution speed - worry about this!
 - Code Quality
 - We award kudos for learning something useful or interesting.

The winning criteria does not consider memory usage but solutions that are frugal with memory are often the fastest.
Time your program as follows: time your-program < input.txt and take the real time.

**Points To Note**
 1. Programmers are free to choose any desired programming language.
 2. Submissions must run on a single core of a Macbook. (The execution environment will be my Macbook, which can run Mac, docker/linux and has a Windows 10 VM.)
 3. Use of any word search library or service not allowed. Code should be self-contained in the sense that it can build and run on my Mac.
 4. Words may occur more than once in the matrix but you don't have to find all of them. Even if you find a word multiple times in the grid, it counts once.
 5. The input to the program will be a text file (as provided in the sample below). Programmers should provide facility to provide input via text file on demo day.
 6. The bash `time` command will measure the execution time of your process. This means that it include the parsing and JIT times interpreted or JIT-compiled languages. e.g. `time ./Crossword < input1.txt > output1.txt`
 7. Do share your answers and performance stats on this page. If it is not better than others you can keep improving before final submission.
 8. Multiple submissions are allowed.
