# Changing and Displaying Names in Assembly

## source code 

```assembly
section .text
   global _start    ; Declare global entry point _start
_start:             ; Program entry point
   
   ; Writing the name 'AAA BBB'
   mov   edx, 9     ; Message length
   mov   ecx, name  ; Message to write
   mov   ebx, 1     ; File descriptor (stdout)
   mov   eax, 4     ; System call number (sys_write)
   int   0x80       ; Call kernel
   
   mov   [name], DWORD 'CCC'  ; Change the name to CCC BBB
   
   ; Writing the name 'CCC BBB'
   mov   edx, 8     ; Message length
   mov   ecx, name  ; Message to write
   mov   ebx, 1     ; File descriptor (stdout)
   mov   eax, 4     ; System call number (sys_write)
   int   0x80       ; Call kernel
   
   mov   eax, 1     ; System call number (sys_exit)
   int   0x80       ; Call kernel

section .data
name db 'AAA BBB'   ; Initial name 'AAA BBB'
```

### Explanation

This assembly code demonstrates the manipulation and display of names using system calls on a Linux platform. The code initializes a name as 'AAA BBB', changes it to 'CCC BBB', and then outputs both versions of the name. It leverages Linux syscalls to write the names to the standard output.

### Code Explanation

1. The data segment (`section .data`) contains the initial name 'AAA BBB' stored in memory.

2. The text segment (`section .text`) begins with the global declaration `_start`, indicating the entry point for the linker.

3. The code uses the `mov` instruction to set up syscalls for writing and to initialize the name 'AAA BBB'.

4. The first `mov` instruction sets up a syscall to write 'AAA BBB' to the standard output. The registers are set as follows:
   - `edx`: Length of the message (9)
   - `ecx`: Address of the message (name)
   - `ebx`: File descriptor for standard output (1)
   - `eax`: Syscall number for sys_write (4)
   - `int 0x80`: Invokes the kernel to execute the syscall

5. The code then changes the name to 'CCC BBB' by overwriting the memory location of the name using the `mov` instruction.

6. The second `mov` instruction sets up another syscall to write the modified name 'CCC BBB' to the standard output. The registers are similarly configured.

7. Finally, the code uses syscalls to exit the program (`eax` set to 1) and ends the `_start` section.

### Example

Suppose you assemble and run this code on a Linux system. The output displayed will be:

```
AAA BBB
CCC BBB
```

This example illustrates how assembly language can be employed to manipulate and output text data, showcasing the process of changing and displaying names using basic syscalls.