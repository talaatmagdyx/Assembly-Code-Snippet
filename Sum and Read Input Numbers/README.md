# Sum and Read Input Numbers:

## source code 

```assembly
; Constants for system calls and file descriptors
SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

segment .data 

   msg1 db "Enter a digit ", 0xA,0xD 
   len1 equ $- msg1 

   msg2 db "Please enter a second digit", 0xA,0xD 
   len2 equ $- msg2 

   msg3 db "The sum is: "
   len3 equ $- msg3

segment .bss

   num1 resb 2 
   num2 resb 2 
   res resb 1    

section	.text
   global _start    ;must be declared for using gcc
	
_start:             ;tell linker entry point
   ; Display "Enter a digit" message
   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg1         
   mov edx, len1 
   int 0x80                

   ; Read the first digit
   mov eax, SYS_READ 
   mov ebx, STDIN  
   mov ecx, num1 
   mov edx, 2
   int 0x80            

   ; Display "Please enter a second digit" message
   mov eax, SYS_WRITE        
   mov ebx, STDOUT         
   mov ecx, msg2          
   mov edx, len2         
   int 0x80

   ; Read the second digit
   mov eax, SYS_READ  
   mov ebx, STDIN  
   mov ecx, num2 
   mov edx, 2
   int 0x80        

   ; Display "The sum is: " message
   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg3          
   mov edx, len3         
   int 0x80

   ; Moving the first number to eax register and second number to ebx
   ; Subtracting ascii '0' to convert it into a decimal number
   mov eax, [num1]
   sub eax, '0'
	
   mov ebx, [num2]
   sub ebx, '0'

   ; Add eax and ebx to calculate the sum
   add eax, ebx
   ; Add '0' to convert the sum from decimal to ASCII
   add eax, '0'

   ; Storing the sum in memory location res
   mov [res], eax

   ; Print the sum 
   mov eax, SYS_WRITE        
   mov ebx, STDOUT
   mov ecx, res         
   mov edx, 1        
   int 0x80

   ; Exit the program
   mov eax, SYS_EXIT   
   xor ebx, ebx 
   int 0x80
```


This assembly program takes two single-digit numeric inputs from the user, calculates their sum, and then displays the result. It utilizes various system calls for input and output operations. Here's a breakdown of the program's functionality:

1. The program uses symbolic constants (`SYS_EXIT`, `SYS_READ`, `SYS_WRITE`, `STDIN`, and `STDOUT`) to represent system call numbers and standard input/output file descriptors.

2. In the `.data` section, two messages `msg1` and `msg2` are defined to prompt the user for input, and `msg3` is defined to display the sum. The lengths of these messages are calculated using the `len1`, `len2`, and `len3` equates.

3. The `.bss` section reserves memory for `num1` (2 bytes), `num2` (2 bytes), and `res` (1 byte), which will store the user inputs and the result.

4. In the `.text` section, the `_start` label marks the program's entry point.

5. The program uses the `SYS_WRITE` system call to display `msg1`, asking the user to enter a digit.

6. The `SYS_READ` system call is used to read a digit from the user and store it in the `num1` variable.

7. Similarly, the program prompts the user for the second digit using `msg2` and reads it into the `num2` variable.

8. The program uses `msg3` to display the message "The sum is: ".

9. The ASCII values of the digits in `num1` and `num2` are converted to decimal by subtracting the ASCII value of '0'. These decimal values are added together.

10. The sum is then converted back to ASCII by adding the ASCII value of '0' before storing it in the `res` variable.

11. Finally, the program uses the `SYS_WRITE` system call to print the sum stored in `res` on the screen.

12. The program exits using the `SYS_EXIT` system call.

### Example:

Suppose the user enters the first digit as '4' and the second digit as '9'. The program will display the following output:

```
Enter a digit 
Please enter a second digit
The sum is: 13
```

This example illustrates how the assembly program interacts with the user, performs calculations, and displays the sum of the entered digits. It provides a basic introduction to using assembly language for input, processing, and output tasks.

---