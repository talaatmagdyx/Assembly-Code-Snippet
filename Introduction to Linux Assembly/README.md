# Introduction to Linux Assembly Programming with Messages

This assembly program demonstrates a simple example of using Linux syscalls to display messages on the console. It prints three different messages using the `SYS_WRITE` syscall and then exits using the `SYS_EXIT` syscall. The provided code is designed to be assembled and executed on a Linux environment.

## source code 
```assembly
SYS_EXIT  equ 1
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section .text
   global _start    ; Must be declared for linker (gcc)
   
_start:             ; Tell linker entry point
   ; Display "Hello, programmers!" message
   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg1         
   mov edx, len1 
   int 0x80                
   
   ; Display "Welcome to the world of," message
   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg2         
   mov edx, len2 
   int 0x80 
   
   ; Display "Linux assembly programming!" message
   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg3         
   mov edx, len3 
   int 0x80
   
   ; Exit the program
   mov eax, SYS_EXIT    ; System call number (sys_exit)
   int 0x80             ; Call kernel

section .data
msg1 db  'Hello, programmers!', 0xA, 0xD    ; First message
len1 equ $ - msg1       

msg2 db 'Welcome to the world of,', 0xA, 0xD ; Second message
len2 equ $ - msg2 

msg3 db 'Linux assembly programming! '        ; Third message
len3 equ $ - msg3
```

## Code Explanation

The assembly code performs the following steps:

1. **Displaying Messages** (`_start` section):
   - Uses the `SYS_WRITE` syscall to display the "Hello, programmers!" message.
   - Uses the same syscall to display the "Welcome to the world of," message.
   - Uses the syscall once again to display the "Linux assembly programming!" message.

2. **Exiting the Program**:
   - Uses the `SYS_EXIT` syscall to terminate the program.

## Example

Suppose you assemble and execute the provided assembly code on a Linux environment. The program will display the following messages in sequence:

1. "Hello, programmers!"
2. "Welcome to the world of,"
3. "Linux assembly programming!"

Example Output:
```
Hello, programmers!
Welcome to the world of,
Linux assembly programming!
```

In this example, the program successfully displays the messages using the `SYS_WRITE` syscall and then gracefully exits using the `SYS_EXIT` syscall.

## Usage

1. Ensure you are running this code on a Linux environment or emulator that supports the syscalls used in the code.
2. Assemble the code using an appropriate assembler (e.g., NASM) and linker (e.g., LD).
3. Run the assembled binary to execute the program.
4. Observe the output, which will display the provided messages in the order specified in the code.

**Note**: Assembly language can interact with system components. Make sure you understand the code before running it, especially when it involves system calls.

---