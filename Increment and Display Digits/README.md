# Increment and Display Digits in Assembly

This example demonstrates a simple assembly program that displays and increments the digits '1' through '10' on the screen. The program uses Linux system calls to perform these operations.

```assembly
section	.text
    global _start    ; Entry point for the program
	
_start:             ; Start of the program
    mov ecx, 10     ; Initialize loop counter to 10
    mov eax, '1'    ; Load ASCII value of '1' into EAX
	
l1:                 ; Start of loop l1
    mov [num], eax  ; Store the ASCII value in memory location 'num'
    mov eax, 4      ; System call number (sys_write)
    mov ebx, 1      ; File descriptor (stdout)
    push ecx        ; Save loop counter
	
    mov ecx, num    ; Load address of 'num' into ECX
    mov edx, 1      ; Set length to 1 (single character)
    int 0x80        ; Call kernel to display the character
	
    mov eax, [num]  ; Load ASCII value from memory into EAX
    sub eax, '0'    ; Convert ASCII to decimal
    inc eax         ; Increment the decimal value
    add eax, '0'    ; Convert back to ASCII
    pop ecx         ; Restore loop counter
    loop l1         ; Repeat the loop if counter is not zero
	
    mov eax, 1      ; System call number (sys_exit)
    int 0x80        ; Call kernel to exit program

section .bss
num resb 1          ; Storage for the ASCII value
```

### Code Explanation:

The provided assembly code achieves its goal through the following steps:

1. **Setting Up the Loop:**
   - The program starts by initializing a loop counter `ecx` with the value 10.
   - The ASCII value of '1' is loaded into the `eax` register, which will be used to display the digits.

2. **Loop Execution:**
   - The program enters a loop labeled `l1`, where each iteration performs the following actions:
     - Stores the ASCII value in the memory location `num`.
     - Uses the `sys_write` system call to display the character stored in the `num` memory location.
     - Converts the ASCII value in `num` to decimal, increments it, and converts it back to ASCII.
     - Preserves the loop counter using the `push` instruction to maintain its value between iterations.
     - Repeats the loop using the `loop` instruction as long as the loop counter is not zero.

3. **Program Termination:**
   - After the loop completes, the program uses the `sys_exit` system call to terminate.

### Example:

Consider the following example of running the program:

```assembly
section	.text
    global _start

_start:
    mov ecx, 10      ; Initialize loop counter to 10
    mov eax, '1'     ; Load ASCII value of '1' into EAX

l1:
    mov [num], eax   ; Store ASCII value in memory location 'num'
    mov eax, 4       ; System call number (sys_write)
    mov ebx, 1       ; File descriptor (stdout)
    push ecx         ; Save loop counter

    mov ecx, num     ; Load address of 'num' into ECX
    mov edx, 1       ; Set length to 1 (single character)
    int 0x80         ; Call kernel to display the character

    mov eax, [num]   ; Load ASCII value from memory into EAX
    sub eax, '0'     ; Convert ASCII to decimal
    inc eax          ; Increment the decimal value
    add eax, '0'     ; Convert back to ASCII
    pop ecx          ; Restore loop counter
    loop l1          ; Repeat loop if counter is not zero

    mov eax, 1       ; System call number (sys_exit)
    int 0x80         ; Call kernel to exit program

section .bss
num resb 1           ; Storage for the ASCII value
```

When you assemble and run this program, it will display the digits '1' through '10' on the screen.

---
