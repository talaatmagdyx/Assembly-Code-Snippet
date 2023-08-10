# BCD Addition and Display in Assembly

This assembly code demonstrates Binary-Coded Decimal (BCD) addition using the `adc` (Add with Carry) and `aaa` (ASCII Adjust for Addition) instructions. BCD is a binary-encoded representation of decimal values that uses four bits to represent each digit (0-9). The `adc` instruction is used for adding BCD digits while considering any carry from the previous addition, and the `aaa` instruction adjusts the result to ensure that each digit remains in the valid range (0-9).

### Explanation

1. **Initialization**: The `_start` label marks the beginning of the program. The `esi` register is used to point to the rightmost digit, and `ecx` is set to the number of digits (5).

2. **Addition Loop**: The `add_loop` label is the main loop that iterates through the digits. Inside the loop:
   - The `al` register is loaded with the BCD digits from `num1` and `num2` at the current position (`esi`).
   - The `adc` instruction adds the contents of `al` from `num1` and `num2`, considering any carry from the previous iteration.
   - The `aaa` instruction adjusts the `al` register to ensure proper BCD addition and updates the carry and auxiliary carry flags accordingly.
   - The result in `al` is converted back to ASCII by performing an OR operation with `30h` (ASCII '0').

3. **Storing Result**: The ASCII result in `al` is stored in the memory location specified by `sum` at the current position (`esi`).

4. **Displaying Message**: The message "The Sum is:" followed by a newline is displayed using the Linux system call `sys_write` (eax=4). The message is stored in the `msg` variable, and its length is specified using `len`.

5. **Displaying Result**: The result stored in the memory location `sum` is displayed using another `sys_write` system call. The result contains multiple characters and is specified by the `sum` variable.

6. **Exiting**: The program exits by using the `sys_exit` system call (eax=1).

### Example

```assembly
section	.text
   global _start        ; Entry point for the program
	
_start:	                ; Start of the program
   mov     esi, 4       ; Pointing to the rightmost digit
   mov     ecx, 5       ; Number of digits
   clc                   ; Clear carry flag
   
add_loop:  
   mov     al, [num1 + esi]  ; Load BCD digit from num1
   adc     al, [num2 + esi]  ; Add BCD digit from num2 with carry
   aaa                        ; Adjust result for BCD addition
   pushf                      ; Push flags onto the stack
   or      al, 30h            ; Convert result back to ASCII
   popf                       ; Pop flags from the stack
	
   mov     [sum + esi], al    ; Store the ASCII result in memory location 'sum'
   dec     esi                 ; Move to the next digit
   loop    add_loop            ; Loop for remaining digits
	
   mov     edx,len	        ; Message length
   mov     ecx,msg	        ; Message to write
   mov     ebx,1	        ; File descriptor (stdout)
   mov     eax,4	        ; System call number (sys_write)
   int     0x80	        ; Call kernel to display message

   mov     edx,5	        ; Message length
   mov     ecx,sum	        ; Message to write
   mov     ebx,1	        ; File descriptor (stdout)
   mov     eax,4	        ; System call number (sys_write)
   int     0x80	        ; Call kernel to display result

   mov     eax,1	        ; System call number (sys_exit)
   int     0x80	        ; Call kernel to exit program
	
section	.data
msg db 'The Sum is:',0xa ; Message to display
len equ $ - msg             ; Calculate length of message
num1 db '12345'             ; First BCD number
num2 db '23456'             ; Second BCD number
sum db '     '              ; Storage for the sum (initialized with spaces)
```

This example demonstrates how to perform BCD addition using the `adc` instruction, adjust the result with `aaa`, and display both the message and the result using system calls in assembly language. It adds two BCD numbers and ensures proper BCD representation of the sum.

---