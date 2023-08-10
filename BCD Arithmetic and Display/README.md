# BCD Arithmetic and Display in Assembly

This assembly code demonstrates Binary-Coded Decimal (BCD) arithmetic operations using the `aas` (ASCII Adjust for Subtraction) instruction. BCD is a binary-encoded representation of decimal values that uses four bits to represent each digit (0-9). The `aas` instruction is used to adjust the result of a subtraction operation in BCD format to ensure that each digit remains in the valid range (0-9).

### Explanation

1. **Initializing**: The `_start` label marks the beginning of the program. The `ah` register is cleared to zero using `sub ah, ah`, and the ASCII value of '9' is loaded into the `al` register using `mov al, '9'`.

2. **BCD Subtraction**: The value '9' is subtracted from '3' in the `al` register using `sub al, '3'`. This subtraction in BCD format results in the value '6' (9 - 3), which is stored in the `al` register.

3. **ASCII Adjustment**: The `aas` instruction is used to adjust the `al` register value for BCD subtraction. The `aas` instruction checks if the lower nibble of `al` is greater than 9 (indicating that a borrow occurred during BCD subtraction). If a borrow occurred, the value in `al` is adjusted to correct the BCD representation.

4. **ASCII Conversion**: The result in `al` is then converted back to ASCII format by performing an OR operation with `30h` (ASCII '0'). This converts the numeric value '6' to its ASCII representation '6'.

5. **Storing Result**: The ASCII result in `al` is stored in the memory location specified by `res`.

6. **Displaying Message**: The message "The Result is:" followed by a newline is displayed using the Linux system call `sys_write` (eax=4). The message is stored in the `msg` variable, and its length is specified using `len`.

7. **Displaying Result**: The result stored in the memory location `res` is displayed using another `sys_write` system call. The result is a single character and is specified by the `res` variable.

8. **Exiting**: The program exits by using the `sys_exit` system call (eax=1).

### Example

```assembly
section	.text
   global _start        ; Entry point for the program
	
_start:	                ; Start of the program
   sub     ah, ah       ; Clear AH register (AH = 0)
   mov     al, '9'      ; Load ASCII value of '9' into AL
   sub     al, '3'      ; Convert ASCII to decimal using ASCII adjustment
   aas                   ; ASCII Adjust for Subtraction (correct BCD result)
   or      al, 30h      ; Convert result back to ASCII
   mov     [res], ax    ; Store the ASCII result in memory location 'res'

   mov	edx,len	        ; Message length
   mov	ecx,msg	        ; Message to write
   mov	ebx,1	        ; File descriptor (stdout)
   mov	eax,4	        ; System call number (sys_write)
   int	0x80	        ; Call kernel to display message

   mov	edx,1	        ; Message length
   mov	ecx,res	        ; Message to write
   mov	ebx,1	        ; File descriptor (stdout)
   mov	eax,4	        ; System call number (sys_write)
   int	0x80	        ; Call kernel to display result

   mov	eax,1	        ; System call number (sys_exit)
   int	0x80	        ; Call kernel to exit program
	
section	.data
msg db 'The Result is:',0xa ; Message to display
len equ $ - msg             ; Calculate length of message
section .bss
res resb 1                   ; Storage for the result
```

This example showcases how to perform BCD arithmetic, use the `aas` instruction, and display results using system calls in assembly language. It calculates the result of subtracting '3' from '9' in BCD format, converts it to ASCII, and displays both the message and the result.

---