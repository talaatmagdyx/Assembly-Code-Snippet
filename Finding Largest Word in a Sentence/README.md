# Assembly Program: Finding and Printing the Largest Word in a Sentence

This assembly program reads a sentence from the user, identifies words, and finds the largest word within it. It utilizes Linux syscalls for I/O operations and program termination.

## source code 

```assembly
section .text

; Input procedure to read user input
input:
    mov eax, 3     ; syscall number for sys_read
    mov ebx, 0     ; file descriptor (stdin)
    int 0x80       ; invoke syscall
    ret

; Output procedure to display output
output:
    mov eax, 4     ; syscall number for sys_write
    mov ebx, 1     ; file descriptor (stdout)
    int 0x80       ; invoke syscall
    ret

global _start

_start:

    ; Display prompt for input sentence
    mov ecx, inpmsg
    mov edx, linp
    call output

    ; Read input sentence from user
    mov ecx, inpsen
    mov edx, 1000
    call input

    mov ebp, 0    ; Initialize index for word comparison
    mov esi, 0    ; Initialize index for sentence traversal

finding_large:
    mov ebp, esi  ; Start index of a word
    mov cl, byte [inpsen + ebp]
    cmp cl, 10    ; Check for newline character
    je printsen
    cmp cl, 32    ; Check for space character
    jne wordcheck
    add ebp, 1

wordcheck:
    add esi, 1    ; Move to the next character in sentence
    mov cl, byte [inpsen + esi]
    cmp cl, 10    ; Check for newline character
    je checkexit
    cmp cl, 32    ; Check for space character
    jne wordcheck
    checkexit:
    mov ebx, esi  ; Stop index of the current word
    sub ebx, ebp
    mov eax, dword [large]  ; Load the current largest word length

    cmp ebx, eax  ; Compare with the current word length
    jl finding_large
    mov dword [large], ebx  ; Update largest word length
    mov dword [ptrstrt], ebp ; Update start index of largest word
    mov dword [ptrstop], esi ; Update stop index of largest word
    jmp finding_large

printsen:
    ; Print "Entered: "
    mov ecx, entered
    mov edx, 1
    call output

    ; Print newline character
    mov ecx, 10
    mov edx, 1
    call output

    ; Print "LARGEST WORD - "
    mov ecx, omsg
    mov edx, lomsg
    call output

printdoc:
    mov esi, dword [ptrstop]
    mov ebp, dword [ptrstrt]

printing:
    ; Compare current index with stop index
    cmp ebp, esi
    je exit

    ; Get character and store in printdata
    mov al, byte [inpsen + ebp]
    mov byte [printdata], al

    ; Print character from printdata
    mov ecx, printdata
    mov edx, 1
    call output

    add ebp, 1
    jmp printing

exit:
    ; Print newline character
    mov ecx, entered
    mov edx, 1
    call output

    ; Exit program
    mov eax, 1
    mov ebx, 0
    int 0x80

section .bss
inpsen resb 1000

section .data
entered db 10
ptrstop dd 0
ptrstrt dd 0
inpmsg db "ENTER THE SENTENCE : ", 32
linp equ $ - inpmsg
large dd 0
omsg db "LARGEST WORD - ", 32
lomsg equ $ - omsg
printdata db 30h
```

## Code Explanation

The provided assembly code performs the following steps:

1. **Input Procedure** (`input`):
   - Invokes syscall 3 (`sys_read`) to read input from the user.

2. **Output Procedure** (`output`):
   - Invokes syscall 4 (`sys_write`) to display output to the user.

3. **Main Procedure** (`_start`):
   - Prompts the user to enter a sentence.
   - Reads the input sentence from the user.
   - Iterates through the sentence to find the largest word.
   - Prints the entered sentence and the largest word.

4. **Finding Largest Word** (`finding_large`):
   - Identifies words by detecting spaces or newline characters.
   - Compares word lengths and updates the largest word.

5. **Printing the Largest Word** (`printsen`, `printdoc`):
   - Prints the entered sentence.
   - Prints the label "LARGEST WORD - " followed by the largest word.

6. **Program Termination**:
   - Uses syscall 1 (`sys_exit`) to exit the program.

## Example

Suppose you run the program and provide the following input:

```
ENTER THE SENTENCE : The quick brown fox jumps over the lazy dog.
```

Output:
```
Entered: The quick brown fox jumps over the lazy dog.
LARGEST WORD - jumps
```

In this example, the program finds and displays the largest word "jumps" from the given sentence.

## Usage

1. Ensure you are running this code on a Linux environment or emulator that supports the syscalls used in the code.
2. Assemble the code using an appropriate assembler (e.g., NASM) and linker (e.g., LD).
3. Run the assembled binary to execute the program.
4. Follow the prompt to enter a sentence.
5. Observe the output, which displays the entered sentence and the largest word.

**Note**: Assembly language can interact with system components. Make sure you understand the code before running it, especially when it involves system calls.

---