
This is a program that attempts to solve sudoku puzzles using the same logic that I use when I solve them on paper.

I start with a matrix, in which the inital numbers are integers, the rest of the puzzle consists of and array of the numbers 1-9.

Summary of the logic I used:

1. Clear the numbers that cannot exist in those locations. This is done by searching through
   rows, columns and boxes.
2. Set any numbers that have an array size of 1.
3. Set any number of which there is only 1 remaining(regardless of array size)
4. Search for pairs in rows, columns and boxes. If they are found those numbers can be safely  
   cleared.
5. Search for trips (i.e [3,4], [3,5], and [3,4,5]) that exist in any row, column or box. If
   they are found then these numbers can be safely cleared.
6. Search for numbers that can only exist in a 1/3 section of a row or column. If they are 
   found then those numbers can be safely cleared from the box that they exist in.



ruby solve_sudoku.rb






