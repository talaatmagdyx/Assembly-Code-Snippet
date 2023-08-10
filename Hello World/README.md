# Displaying "Hello World!" in x86 Assembly

This example demonstrates how to use x86 assembly language to display the message "Hello World!" to the standard output (stdout) using Linux syscalls. The code is written for the Intel x86 architecture and is intended to run on a Linux system.

### Code Explanation

```assembly
section     .text

extern printf
global      _start                              ; Entry point for the program

_start:                                         ; Start of the program
	
    mov     edx,len                             ; Calculate message length
    mov     ecx,msg                             ; Load address of message
    mov     ebx,1                               ; File descriptor (stdout)
    mov     eax,4                               ; System call number (sys_write)
    int     0x80                                ; Call kernel to display message

    mov     eax,1                               ; System call number (sys_exit)
    int     0x80                                ; Call kernel to exit program

section     .data

msg     db  'Hello World!',10                    ; Our message with a newline
len     equ $ - msg                             ; Calculate length of message
```

### How It Works

1. The program begins with the `_start` label, which is the entry point for the program. 

2. The code uses the `mov` instruction to load the address of the message (`msg`) into the ECX register and calculates the length of the message (`len`).

3. It sets the file descriptor for stdout to 1 (ebx = 1), which corresponds to the standard output. It also sets the syscall number for sys_write to 4 (eax = 4).

4. The `int 0x80` instruction triggers a software interrupt to perform the syscall. This causes the kernel to execute the sys_write syscall, which displays the message to the console.

5. After displaying the message, the program calls the syscall for sys_exit (eax = 1) to terminate the program.

### Example

When you run the program, it will display "Hello World!" to the console. The message will be followed by a newline character (`10` in ASCII), so the next command prompt will appear on a new line.

### How to Run

To run this program:

1. Assemble the code using an assembler like NASM:
   ```
   nasm -f elf file.asm -o file.o
   ```

2. Link the object file to create an executable:
   ```
   ld -m elf_i386 file.o -o file
   ```

3. Run the executable:
   ```
   ./file
   ```

Ensure you have NASM and a compatible x86 assembler installed.
