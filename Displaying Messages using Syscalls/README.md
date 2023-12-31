# Assembly Program: Displaying Messages using Syscalls

This assembly program demonstrates how to display messages on the standard output using Linux syscalls. It prints two messages: one with a fixed message and another with a repeated word.

## source code 

```assembly
; This assembly program displays messages using syscalls.

section .text
   global _start     ; Must be declared for linker (gcc)
	
_start:             ; Tell linker entry point
   mov edx, len      ; Message length
   mov ecx, msg      ; Message to write
   mov ebx, 1        ; File descriptor (stdout)
   mov eax, 4        ; System call number (sys_write)
   int 0x80          ; Call kernel to display message

   mov edx, 9        ; Message length
   mov ecx, s2       ; Message to write
   mov ebx, 1        ; File descriptor (stdout)
   mov eax, 4        ; System call number (sys_write)
   int 0x80          ; Call kernel to display message

   mov eax, 1        ; System call number (sys_exit)
   int 0x80          ; Call kernel to exit

section .data
msg db 'Displaying 9 stars', 0xa ; A message
len equ $ - msg    ; Length of the message
s2 times 6 db 'File'
``

## Code Explanation

The provided assembly code performs the following steps:

1. **Displaying the First Message**:
   - Initializes registers for syscall 4 (`sys_write`) to print the first message.
   - Calls the kernel to display the message "Displaying 9 stars" followed by a newline.

2. **Displaying the Second Message**:
   - Initializes registers for another syscall 4 to print the second message.
   - Prints the word "File" repeated 6 times without newline.

3. **Program Termination**:
   - Uses syscall 1 (`sys_exit`) to exit the program.

## Example

Upon running the program, you will see the following output:

```
Displaying 9 stars
FileFileFileFileFileFile
```

In this example, the program uses syscalls to display the messages as described in the code.

## Usage

1. Ensure you are running this code on a Linux environment or emulator that supports the syscalls used in the code.
2. Assemble the code using an appropriate assembler (e.g., NASM) and linker (e.g., LD).
3. Run the assembled binary to execute the program.
4. Observe the output, which displays the messages using syscalls.

**Note**: Assembly language can interact with system components. Make sure you understand the code before running it, especially when it involves system calls.

---