# Assembly Program: Sorting Numerical Elements

This assembly program takes multiple numerical inputs, sorts them, and displays the sorted list using ASCII characters. The program is designed for a Linux environment and utilizes Linux syscalls for I/O operations and program termination.

## source code 
```Assembly
; This assembly code takes multiple numerical inputs, sorts them, and displays the sorted list.

section .text

; Function to display a newline character
startnew:
    mov ecx, newline
    mov edx, 1
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret

; Function to convert ASCII character to numerical digit
convert:
    mov ecx, [inp]     ; Load memory address of inp into ECX
    mov bl, 10         ; Set BL to 10 for multiplication
    mov al, cl         ; Move ASCII character to AL
    sub al, 30h        ; Convert ASCII to numerical value
    
    cmp ch, 10         ; Check if the high byte (CH) is 10
    je converted       ; If CH = 10, jump to "converted"
    mul bl             ; Multiply AL by BL
    sub ch, 30h        ; Convert CH to numerical value
    add al, ch         ; Add CH to AL
converted:
    mov byte [inp], al ; Store the converted value back into inp
    ret

; Function to take input and convert
takeinput:
    mov ecx, msgele
    mov edx, lmsgele
    mov eax, 4
    mov ebx, 1
    int 0x80
    
tinput:
    mov ecx, inp
    mov edx, 3
    mov eax, 3
    mov ebx, 0
    int 0x80
    
    call convert      ; Call the convert function
    
    ret

global _start
_start:
    mov ecx, noele
    mov edx, lnoele
    mov eax, 4
    mov ebx, 1
    int 0x80
    
    call tinput      ; Call the input and convert function
    
    mov al, byte[inp]
    mov byte[n], al
    
    mov ebx, 0
    mov bl, [n]
    mov edx, 0
    
taking:
    push dx
    call takeinput  ; Call the input and convert function
    mov al, byte[inp]
    mov edx, 0
    pop dx
    mov byte[input+edx], al  ; Store input in the 'input' array
    add dx, 1
    mov bl, [n]
    cmp dl, bl
    jne taking
    
mov edx, 0

; Sorting the input array
sort:
    mov bl, byte[input+eax]
    mov cl, byte[input+eax+1]
    cmp bl, cl
    jl dontswap
    mov byte[input+eax+1], bl
    mov byte[input+eax], cl
dontswap:
    add eax, 1
    mov bl, byte[n]
    sub bl, 1
    cmp al, bl
    jne sort
    mov eax, 0
    add edx, 1
    mov bl, byte[n]
    add bl, 1
    cmp dl, bl
    jne sort

call startnew

mov ecx, sortmsg
mov edx, lsortmsg
mov eax, 4
mov ebx, 1
int 0x80

mov edx, 0
mov esi, 0

; Displaying sorted output
output:
    push 29h
    mov ebx, 0
    mov bl, byte[input+esi]
    mov ax, bx
    mov ebx, 0
    mov bl, 10
break:
    mov edx, 0
    div bx
    add dl, 30h
    push dx
    cmp al, 0
    jne break

mov edx, 0
pop dx

prints:
    mov byte[printdata], dl

mov ecx, printdata
mov edx, 1
mov eax, 4
mov ebx, 1
int 0x80

mov edx, 0
pop dx
cmp dl, 29h
jne prints

mov ecx, space
mov edx, 1
mov eax, 4
mov ebx, 1
int 0x80

add esi, 1
mov ebx, 0
mov bl, byte[n]
cmp esi, ebx
jne output

call startnew
call startnew

mov eax, 1
mov ebx, 0
int 0x80

section .bss
input resb 100

section .data
inp dd 30h
temp db 30h
space db 32
newline db 10
n db 30h
printdata db 30h
noele db "ENTER THE NO:OF ELEMENTS ",32
lnoele equ $-noele
msgele db "ENTER THE ELEMENT ",32
lmsgele equ $-msgele
sortmsg db "SORTED LIST",10
lsortmsg equ $-sortmsg
```

## Code Explanation

The provided assembly code performs the following steps:

1. **Display Newline Function** (`startnew`):
   - Displays a newline character using a Linux syscall.

2. **Conversion Function** (`convert`):
   - Converts ASCII characters to numerical digits.
   - Supports conversion of numbers up to 99 (two digits).

3. **Input and Conversion Function** (`takeinput` and `convert`):
   - Displays a message prompting the user to enter an element.
   - Reads user input, converts it to its numerical form, and stores it in the `input` array.

4. **Sorting the Input Array** (`sort`):
   - Implements a basic bubble sort algorithm to arrange the elements in ascending order.

5. **Displaying the Sorted Output** (`output`):
   - Converts sorted numerical values back to ASCII and displays them with spaces between elements.

6. **Program Termination**:
   - The program terminates after displaying the sorted list.

## Example

Suppose you run the program and input the following elements:
```
5
9
1
3
7
```

The program will sort these elements in ascending order and display the sorted list:
```
1 3 5 7 9
```

After displaying the sorted list, the program will terminate.

## Usage

1. Make sure you are running this code on a Linux environment or emulator that supports the syscalls used in the code.
2. Assemble the code using an appropriate assembler (e.g., NASM) and linker (e.g., LD).
3. Run the assembled binary to execute the program.
4. Follow the instructions to input the number of elements and then enter the elements one by one.
5. The program will sort the elements and display the sorted list.

**Note**: Assembly language is platform-specific and can interact with system components. Make sure you understand the code before running it, especially when it involves system calls.

---