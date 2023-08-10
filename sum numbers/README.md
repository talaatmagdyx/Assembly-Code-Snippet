# Calculate and Display Sum

This assembly code calculates the sum of three numbers and displays the result using system calls. The code takes advantage of x86 assembly language and Linux system calls for input and output operations.

## source code 
```assembly
section .text
   global _start   ; Declare entry point for linker (ld)
   
_start:	
   
   mov  eax,3      ; Number of bytes to be summed (counter)
   mov  ebx,0      ; EBX will store the sum
   mov  ecx, x     ; ECX will point to the current element to be summed

top:
   add  ebx, [ecx] ; Add the current element to the sum

   add  ecx,1      ; Move pointer to next element
   dec  eax        ; Decrement counter
   jnz  top        ; If counter not 0, then loop again

done:
   add   ebx, '0'  ; Convert sum to ASCII character
   mov  [sum], ebx ; Store result in "sum"

display:
   mov  edx,1      ; Message length
   mov  ecx, sum   ; Message to write
   mov  ebx, 1     ; File descriptor (stdout)
   mov  eax, 4     ; System call number (sys_write)
   int  0x80       ; Call kernel
	
   mov  eax, 1     ; System call number (sys_exit)
   int  0x80       ; Call kernel

section .data
global x
x:    
   db  2
   db  4
   db  3

sum: 
   db  0
```

### Code Explanation:

The provided assembly code performs the following steps:

1. **Setup and Loop:**
   - Registers `eax`, `ebx`, and `ecx` are used to manage operations and data.
   - The loop starts with the `_start` label and iterates over the `x` array's elements to calculate the sum.

2. **Sum Calculation:**
   - Inside the loop, each element of the `x` array is added to the `ebx` register (used as a sum accumulator).
   - The `add` and `dec` instructions are used to perform these operations, with the loop condition checked using `jnz` (jump if not zero).

3. **ASCII Conversion:**
   - After the loop, the sum in the `ebx` register is converted into its ASCII character representation by adding the ASCII value of '0'.

4. **Displaying the Result:**
   - The `sys_write` system call (using `int 0x80`) is used to display the result on the screen.
   - The `sys_exit` system call is used to terminate the program.

5. **Data Storage:**
   - The `x` array contains the input numbers.
   - The `sum` variable stores the ASCII representation of the calculated sum.

### Example:

Let's consider the values in the `x` array: 2, 4, and 3.

- The code will calculate the sum: 2 + 4 + 3 = 9.
- The sum 9 will be converted to its ASCII character representation ('9') and displayed on the screen.

When the code is assembled and executed in a suitable x86 assembly environment, the output will be:

```
9
```

### Usage:

To run the code:

1. Assemble the code using an x86 assembly assembler, for example:
   ```
   nasm -f elf file.asm -o file.o
   ```

2. Link the object file to create an executable:
   ```
   ld -m elf_i386 -s -o file file.o
   ```

3. Run the executable:
   ```
   ./file
   ```

Please ensure that you have an appropriate x86 assembly environment and that you're running this code on a Linux-based system to observe the expected output.

---

Feel free to replace "file" in the usage commands with a suitable name for your executable.