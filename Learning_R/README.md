# Overview

During these last two weeks, I've been striving to learn the basics of R. I had a goal set of being able to:

- Display output to the screen  
- Use at least 5 different R datatypes in your program  
- Incorporate at least one loop that works with lists or arrays  
- Use DataFrames
- Incorporate CSV files

I wanted to apply all of these ideas into one program. I decided to go with a student grading program. The goal of the program was to incorporate each of the previously listed criteria to list process scores and statistics based on the names and scores provided in a CSV file. 

This R program processes student score data either from a CSV file or built-in sample data. It starts with a function called load_data(), which, if the CSV file exists, reads the file and creates a dataframe of the data, assigning each student an ID based on the order in which the students are listed in the file. Then, calling the grade_students() function, it assigns each student found in the dataframe a letter grade and pass/fail status based on their numeric score using a loop to evaluate individual records. Then, in the calculate_stats() function, it calculates performance metrics for the group. Finally, it calls the display_summary() function, which displays a formatted summary. The program utilizes multiple R data types—including character, numeric, logical, factor, and integer, all within a dataframe. It outputs the student’s results with the calculated statistics, including the average, highest, and lowest scores of the given group. 

The purpose of writing this software was to create a practical way to reinforce and demonstrate my understanding of the foundational concepts in R. Rather than writing isolated examples, I wanted to build a complete, functional program that combined the predescribed criteria into a single tool. By simulating a real-world task like student grade analysis, this project helped me gain confidence using R’s core features and deepened my understanding of how to efficiently structure programs in R.

Here's a link to the youtube video of a [demo of the code](https://youtu.be/hzAjanHUWgY)

## Development Environment

For the programming language itself, R was obviously used, which is made for statistical computing and data analysis. While I didn't use any external packages beyond base R in this initial version, the program relied heavily on built-in functions and data structures, including `data.frame`, `read.csv`, `factor`, `mean()`, `max()`, `min()`, and `for` loops.

I used lots of great tools to learn the basics of R. I used VS Code as my IDE for this program. I started by learning from a few YouTube videos, then branched into W3Schools, the R documentation, and GeeksforGeeks once I started programming and needed to research different data types and syntax. I also researched a few specifics on Reddit. 

# Useful Websites

- [W3Schools](https://www.w3schools.com/)
- [R Documentation](https://www.r-project.org/about.html)
- [GeeksforGeeks](https://www.geeksforgeeks.org/r-programming-language-introduction/)
- [Reddit](https://www.reddit.com/)

## Future Work

A list of things that I need to fix, improve, and add in the future.

- I'd like to make the summary a bit more comprehensive with better formatting, maybe prepped to be sent to a webpage or to be translated into a different format somehow.
- I'd like to create a graph of the different results and show that along with the calculated data.
- I could have made the program more scalable, calculated based on different classes or years that the grades had been collected, or could have done some different calculations with the grades in general.
