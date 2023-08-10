# Assembly Program: Demonstrating Loop and Testing

This assembly program showcases a demonstration loop that performs tests on a range of values and prints the results using ASCII characters. The program uses Linux syscalls for I/O operations and program termination.

## source code

```assembly
; This assembly code demonstrates a loop that performs various tests and prints results.

section .text
global _start  ; Declaration for the linker to indicate the entry point
_start:        ; Entry point for the program

    mov ax, -4  ; Test value

doFewTests:
    push eax    ; Preserve the value of AX on the stack

    cmp ax, 0
    jl handleNegative
    ; Handle non-negative value
    add al, '0' ; Fake conversion to ASCII for numbers 0-9
    mov ecx, strPositive
    mov edx, lenPositive
    mov [ecx + edx - 2], al
    jmp printMessage

handleNegative:
    ; Handle negative value
    neg al      ; Negate the value
    add al, '0' ; Fake conversion to ASCII for numbers -9 to -1
    mov ecx, strNegative
    mov edx, lenNegative
    mov [ecx + edx - 2], al

printMessage:
    mov ebx, 1  ; File descriptor (stdout)
    mov eax, 4  ; System call number (sys_write)
    int 0x80    ; Call the kernel to print the message
    pop eax     ; Restore the original value of AX
    inc ax
    cmp ax, 5
    jl doFewTests ; Perform the demonstration loop for -4 to +4

    ; Exit the program
    mov eax, 1  ; System call number (sys_exit)
    int 0x80    ; Call the kernel to exit

section .data

strPositive db 'Positive number: x', 10
lenPositive equ $ - strPositive
strNegative db 'Negative number: -x', 10
lenNegative equ $ - strNegative
```

## Code Explanation

The provided assembly code demonstrates the following steps:

1. **Loop and Tests** (`doFewTests`):
   - The code initializes a test value `ax` with -4 and enters a loop to perform tests on a range of values.
   - Tests include checking if the value is negative, zero, or positive.

2. **Handling Non-Negative Values** (`handleNegative`):
   - If the value is non-negative, the code converts it to an ASCII character and constructs a message indicating that it is a positive number.

3. **Handling Negative Values**:
   - For negative values, the code negates the value, converts it to an ASCII character, and constructs a message indicating that it is a negative number.

4. **Printing Messages** (`printMessage`):
   - The code uses Linux syscall 4 (`sys_write`) to print the constructed messages to the standard output.

5. **Demonstration Loop**:
   - The loop continues until the test value reaches 5, showcasing a range from -4 to +4.

6. **Program Termination**:
   - After the demonstration loop is complete, the program exits using Linux syscall 1 (`sys_exit`).

## Example

When you run the program, it performs tests and prints messages for a range of values:

```
Negative number: -4
Negative number: -3
Negative number: -2
Negative number: -1
Positive number: 0
Positive number: 1
Positive number: 2
Positive number: 3
Positive number: 4
```

After displaying the messages for the demonstration loop, the program exits.

## Usage

1. Ensure you are running this code on a Linux environment or emulator that supports the syscalls used in the code.
2. Assemble the code using an appropriate assembler (e.g., NASM) and linker (e.g., LD).
3. Run the assembled binary to execute the program.
4. Observe the printed messages that showcase the loop and tests on a range of values.

**Note**: Assembly language can interact with system components. Make sure you understand the code before running it, especially when it involves system calls.

---