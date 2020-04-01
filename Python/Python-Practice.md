### Question 1
- Description: Write a program which will find all such numbers which are divisible by 7 but are not a multiple of 5, between 2000 and 3200 (both included). The numbers obtained should be printed in a comma-separated sequence on a single line.
- Hint: Consider use for loop. `','.join(['a','b'])` will produce `a,b`

### Question 2
- Description: Write a program which can compute the factorial of a given number.<br/>
Suppose the following input is supplied to the program: 8<br/>
Then, the output should be: 40320
- Hint: Consider use for loop. Better to define a function.

### Question 3
- Description: With a given integral number n, write a program to generate a dictionary that contains (i, i\*i) such that is an integral number between 1 and n (both included) and then the program should print the dictionary.<br/>
Suppose the following input is supplied to the program: 8<br/>
Then, the output should be: {1: 1, 2: 4, 3: 9, 4: 16, 5: 25, 6: 36, 7: 49, 8: 64}
- Hint: Consider use for loop and dict.

### Question 4
- Description: Write a program which accepts a sequence of comma-separated numbers from console and generate a list and a tuple which contains every number.<br/>
Suppose the following input is supplied to the program: 34,67,55,33,12,98<br/>
Then, the output should be: [34, 67, 55, 33, 12, 98]
- Hint: `input()` is the function to receive values typed from the console.

### Question 5
- Description: Write a program that calculates and prints the value according to the given formula:<br/>
Q = Square root of [(2 * C * D)/H]<br/>
Following are the fixed values of C and H:<br/>
C is 50. H is 30.<br/>
D is the variable whose values should be input to your program in a comma-separated sequence.<br/>
Example<br/>
Let us assume the following comma separated input sequence is given to the program:<br/>
100,150,180<br/>
The output of the program should be:<br/>
18,22,24
- Hint: `input()` is the function to receive values typed from the console. Also use built-in function from `math` module.

### Question 6
- Description: Construct a string as simple as you can, assign it to a variable, and print it like the following.
```
        1        
       222       
      33333      
     4444444     
    555555555    
   66666666666   
  7777777777777  
 888888888888888 
99999999999999999
```
- Hint: use string * operation (e.g. `'1'*3` will produce `111`) and list comprehension.

### Question 7
- Description: Copy the following table into a text file and save it.
```
ID	Name	Age	Courses
1001	John	23	Math,English
1002	Susan	45	Chinese,Physics
1003	Bush	67	English
```
Use Python to read the text file and construct the following dictionary.
![](https://github.com/FeiYao-Edinburgh/CS-hardware-software/blob/master/Python/dict.png)
- Hint: Upon saving the test file, you can read its lines into a list like the following.
```
with open('your_text_file', 'r') as f:
    lines = f.readlines()
    # then you can process each line like the following
    for line in lines:
        # your codes
```

### Question 8
- Description: see the following picture.<br/>
![](https://github.com/FeiYao-Edinburgh/CS-hardware-software/blob/master/Python/needle.png)
- Hint: use `math` and `random` functions.

### Question 9
- Description: write a program calculating rental bills automatically that helps make life easier!

