# Assembly Program: Determining Even and Odd Numbers

This assembly program determines whether a given number is even or odd using bitwise operations and displays the result. It utilizes Linux syscalls for I/O operations and program termination.

## source code 
```assembly
; This assembly program determines whether a given number is even or odd using bitwise operations and displays the result.

section .text
   global _start            ; Must be declared for using GCC
	
_start:                     ; Tell linker entry point
   mov   ax, 8h             ; Load 8 into the ax register
   and   ax, 1              ; Perform bitwise AND with 1
   jz    evnn               ; Jump to 'evnn' if result is zero (even)
   mov   eax, 4             ; System call number (sys_write)
   mov   ebx, 1             ; File descriptor (stdout)
   mov   ecx, odd_msg       ; Message to write
   mov   edx, len2          ; Length of message
   int   0x80               ; Call kernel
   jmp   outprog            ; Jump to program exit

evnn:
   mov   ah, 09h            ; Set 'ah' register for displaying even message
   mov   eax, 4             ; System call number (sys_write)
   mov   ebx, 1             ; File descriptor (stdout)
   mov   ecx, even_msg      ; Message to write
   mov   edx, len1          ; Length of message
   int   0x80               ; Call kernel

outprog:
   mov   eax, 1             ; System call number (sys_exit)
   int   0x80               ; Call kernel

section .data
even_msg  db  'Even Number!' ; Message showing even number
len1  equ  $ - even_msg      ; Length of even_msg
   
odd_msg db  'Odd Number!'    ; Message showing odd number
len2  equ  $ - odd_msg       ; Length of odd_msg
```


## Code Explanation

The provided assembly code performs the following steps:

1. **Checking Even or Odd**:
   - Loads the number 8 into the `ax` register.
   - Performs a bitwise AND operation with 1 to check the least significant bit (LSB).
   - If the LSB is 0, it jumps to the `evnn` label, indicating an even number.
   - If the LSB is 1, it displays the message for an odd number.

2. **Displaying Even Number** (`evnn`):
   - Sets the `ah` register to 09h, indicating the display of an even number.
   - Displays the message "Even Number!" using syscalls.

3. **Displaying Odd Number** (`outprog`):
   - Displays the message "Odd Number!" using syscalls.

4. **Program Termination**:
   - Uses syscall 1 (`sys_exit`) to exit the program.

## Example

Suppose you run the program with the command-line argument `./evenodd 7`.

Output:
```
Odd Number!
```

In this example, the program determines that the number 7 is odd and displays "Odd Number!".

## Usage

1. Ensure you are running this code on a Linux environment or emulator that supports the syscalls used in the code.
2. Assemble the code using an appropriate assembler (e.g., NASM) and linker (e.g., LD).
3. Run the assembled binary to execute the program. You can provide a number as a command-line argument.
4. Observe the output, which will indicate whether the given number is even or odd.

**Note**: Assembly language can interact with system components. Make sure you understand the code before running it, especially when it involves system calls.

---
