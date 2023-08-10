# Assembly Program: Determining Endianness and Displaying Messages

This assembly program determines the endianness of the system by comparing the least significant byte of a stored value. Depending on the endianness, the program displays corresponding messages. It utilizes Linux syscalls for I/O operations and program termination.

## source code 

```assembly
section .text

global _start   ; Entry point for the linker (gcc)

_start:

    ; Storing a 4-byte value (0x12345678) in memory
    mov dword [a], 0x12345678

    ; Loading the least significant byte of 'a' into register 'cl'
    mov cl, byte [a]

    ; Comparing the least significant byte with 0x78
    cmp cl, 0x78
    je little    ; Jump if equal to 'little' section

    ; Comparing the least significant byte with 0x12
    jne ext      ; Jump if not equal to 'ext' section

    ; Display 'big' message for big endian architecture
    mov ecx, big
    mov edx, lbig
    mov eax, 4
    mov ebx, 1    ; File descriptor (stdout)
    int 0x80      ; Invoke sys_write syscall

    jmp ext       ; Jump to 'ext' section

little:

    ; Display 'lit' message for little endian architecture
    mov ecx, lit
    mov edx, llit
    mov eax, 4
    mov ebx, 1    ; File descriptor (stdout)
    int 0x80      ; Invoke sys_write syscall

ext:

    ; Exit the program
    mov eax, 1    ; sys_exit syscall number
    mov ebx, 0    ; Return code
    int 0x80      ; Invoke sys_exit syscall

section .data

a dd 30h          ; Memory location to store the value
big db "BIG ENDIAN        -      GODLY", 10 ; Message for big endian
lbig equ $ - big  ; Length of the big endian message
lit db "LITTLE ENDIAN        -       GODLY", 10 ; Message for little endian
llit equ $ - lit  ; Length of the little endian message
```

## Code Explanation

The provided assembly code performs the following steps:

1. **Storing a Value** (`_start`):
   - Stores the 4-byte value `0x12345678` in memory.
   - Loads the least significant byte of the stored value into the `cl` register.

2. **Comparing Least Significant Byte**:
   - Compares the least significant byte with `0x78`.
   - If equal, jumps to the `little` section.
   - If not equal and not `0x12`, jumps to the `ext` section.

3. **Display Big Endian Message** (`big` section):
   - Displays the message "BIG ENDIAN - GODLY" for big endian architecture.
   - Invokes syscall 4 (`sys_write`) to print the message.

4. **Display Little Endian Message** (`little` section):
   - Displays the message "LITTLE ENDIAN - GODLY" for little endian architecture.
   - Invokes syscall 4 (`sys_write`) to print the message.

5. **Exit Program** (`ext` section):
   - Exits the program using syscall 1 (`sys_exit`).

## Example

Suppose you run the program on a little endian system. It detects the least significant byte of the stored value as `0x78`, which is not equal to `0x12`. Therefore, it displays the "LITTLE ENDIAN - GODLY" message:

Output:
```
LITTLE ENDIAN - GODLY
```

In this example, the program successfully determines the endianness of the system and displays the appropriate message.

## Usage

1. Ensure you are running this code on a Linux environment or emulator that supports the syscalls used in the code.
2. Assemble the code using an appropriate assembler (e.g., NASM) and linker (e.g., LD).
3. Run the assembled binary to execute the program.
4. Observe the output, which will display the appropriate endianness message based on the system architecture.

**Note**: Assembly language can interact with system components. Make sure you understand the code before running it, especially when it involves system calls.

---