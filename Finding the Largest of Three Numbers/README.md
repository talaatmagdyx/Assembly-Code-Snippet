
# Assembly Program: Finding the Largest of Three Numbers

This assembly program compares three ASCII numbers and determines the largest among them. It then displays the largest number using Linux syscalls for I/O operations and program termination.

## source code

```assembly
; This assembly code finds the largest of three numbers and displays the result.

section .text
global _start       ; Declare _start as the entry point for the linker

_start:             ; Start of the program
   mov   ecx, [num1]
   cmp   ecx, [num2]
   jg    check_third_num
   mov   ecx, [num2]

check_third_num:
   cmp   ecx, [num3]
   jg    _exit
   mov   ecx, [num3]

_exit:
   mov   [largest], ecx    ; Store the largest number in 'largest'
   mov   ecx, msg
   mov   edx, len
   mov   ebx, 1             ; File descriptor (stdout)
   mov   eax, 4             ; System call number (sys_write)
   int   0x80               ; Call kernel to print the message

   mov   ecx, largest
   mov   edx, 2
   mov   ebx, 1             ; File descriptor (stdout)
   mov   eax, 4             ; System call number (sys_write)
   int   0x80               ; Call kernel to print the largest number
    
   mov   eax, 1             ; System call number (sys_exit)
   int   80h                ; Call kernel to exit

section .data
msg db "The largest digit is: ", 0xA, 0xD   ; Message to be displayed
len equ $ - msg            ; Length of the message
num1 dd '47'               ; First number (ASCII representation)
num2 dd '22'               ; Second number (ASCII representation)
num3 dd '31'               ; Third number (ASCII representation)

segment .bss
largest resb 2             ; Storage for the largest number (ASCII representation)
```

## Code Explanation

The provided assembly code performs the following steps:

1. **Comparison and Finding Largest**:
   - Compares three ASCII numbers: `num1`, `num2`, and `num3`.
   - Determines the largest number by comparing and updating the `ecx` register.
   
2. **Printing Message** (`msg`):
   - Displays the message "The largest digit is: " using Linux syscall 4 (`sys_write`).
   
3. **Printing the Largest Number**:
   - Displays the largest number stored in the `largest` variable using another `sys_write` syscall.
   
4. **Program Termination**:
   - Exits the program using Linux syscall 1 (`sys_exit`).

## Example

Suppose you run the program, and the numbers are set as follows:

```assembly
num1 dd '47'
num2 dd '22'
num3 dd '31'
```

Output:
```
The largest digit is: 47
```

In this example, the program compares the numbers 47, 22, and 31. It identifies 47 as the largest number and displays the message "The largest digit is: " followed by the largest number, which is 47.

## Usage

1. Ensure you are running this code on a Linux environment or emulator that supports the syscalls used in the code.
2. Assemble the code using an appropriate assembler (e.g., NASM) and linker (e.g., LD).
3. Run the assembled binary to execute the program.
4. Observe the output that displays the largest number among the three provided numbers.

**Note**: Assembly language can interact with system components. Make sure you understand the code before running it, especially when it involves system calls.

---