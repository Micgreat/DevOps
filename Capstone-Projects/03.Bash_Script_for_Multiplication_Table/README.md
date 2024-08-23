# Capstone Project #3: Bash Script for Generating a Multiplication Table 

## Project Scenario

Using bash script, I created a script that generates a multiplication table for a number entered by the user. It prompts the user to enter a number and then ask if they prefer to see a full multiplication table from 1 to 10 or a partial table with specified range. 

## Objectives
1. Familiarize with windows Ubuntu as bash is a linux/unix language
2. Implement using loops, user inputs and conditional logic.
3. Use of comment for code quality and readability.

## Step 1: Implement the Functions

1. A Bash script typically starts with a shebang (#!) followed by the path to the Bash interpreter (/bin/bash).

![img1](./img/1.shebang.png)

2. Initialize the functions for both ascending and descending display.

    Ascending = `display_table_ascending`

![img2](./img/2.ascending.png)

Descending = `display_table_ascending`
   
![img3](./img/3.descending.png)

3. Verify if the input `is_number` is a valid number, if not print invalid.

![img4](./img/4.validate-input.png)

## Step 2: Input Request
1. Display the instruction for the user to input a number and store in `number` variable.

![img5](./img/5.input.png)

2. Validate the input is a number
 
![img6](./img/6.valii.png)

3. Print out a request for either partial or full table

![img7](./img/7.initial-print.png)

4. Range initialization

![img8](./img/8.range-initialization.png)

5. Range request for start and end values if the user selects partial

![img9](./img/9.partial-start-end.png)

6. If user selects full table

![img10](./img/10.full-range.png)

## Step 3: Order Request

1. Request for which order the display should be in

![img11](./img/11.order.png)

2. Display result 

![img12](./img/12.%20display_output.png)

## Results

![img13](./img/13.result1.png)

![img14](./img/14.result2.png)

![img15](./img/15.result3.png)