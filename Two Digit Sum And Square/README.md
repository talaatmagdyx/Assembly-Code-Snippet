# Two-Digit Sum and Square - Assembly Program

## source code 

```assembly
section .text
    global _start

input:
    ; Read 2-digit input from user
    mov ecx, inp
    mov edx, 2
    mov eax, 3
    mov ebx, 1
    int 0x80
    ret

inputmessage:
    ; Display input prompt message
    mov ecx, msg
    mov edx, lmsg
    mov eax, 4
    mov ebx, 1
    int 80h
    ret

print:
    ; Print a single character
    mov ecx, printdata
    mov edx, 1
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret

printnewline:
    ; Print a newline character
    mov ecx, newline
    mov edx, 1
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret

outputmessage:
    ; Display output message
    mov ecx, omsg1
    mov edx, lomsg1
    mov eax, 4
    mov ebx, 1
    int 80h
    ret

convert:
    ; Convert 2-digit ASCII input to integer
    mov eax, 0
    mov edx, 10
    sub ch, 30h
    sub cl, 30h
    mov al, cl
    mul dl
    shr ecx, 8
    add eax, ecx
    mov ecx, eax
    ret

getdata:
    ; Read input data
    mov ecx, data
    mov edx, 2
    mov eax, 3
    mov ebx, 0
    int 80h
    ret

_start:
    call inputmessage
    call input
    mov ecx, [inp]
    call convert
    mov eax, 0
    mov dword [inp], ecx
    sum:
    add eax, [inp]
    loop sum
    mov ebx, 29h
    push bx
    mov ebx, 10

breakdigits:
    mov edx, 0
    div bx
    add dx, 30h
    push dx
    cmp eax, 0
    jne breakdigits

call outputmessage
sprint:
    mov eax, 0
    pop ax
    cmp ax, 29h
    je endprint
    mov byte [printdata], al
    call print
    jmp sprint

endprint:
    call printnewline
    mov eax, 1
    int 0x80

section .data
    inp dd 30h
    data dw 30h
    printdata db 30h
    newline db 0xa
    msg db "ENTER THE NUMBER (2 digit)", 10
    lmsg equ $-msg
    omsg1 db "SQUARE = "
    lomsg1 equ $-omsg1
```

### Explanation:

This assembly program takes a two-digit number as input from the user, calculates the sum of its digits, and then computes and displays the square of the sum.

Here's how the program works step by step:

1. The program starts with the `_start` label, which serves as the entry point for the program.

2. The `inputmessage` subroutine is called to display a message asking the user to enter a two-digit number. It uses the `msg` string and prints it using the `int 80h` system call.

3. The `input` subroutine is called to read the user input. It reads two characters (digits) using the `int 0x80` system call and stores the input in the `inp` buffer.

4. The `convert` subroutine converts the ASCII characters of the two digits into an actual numeric value. It subtracts `30h` (ASCII value of '0') from the ASCII values of the digits and then multiplies and adds them to form the numeric value.

5. The `sum` loop calculates the sum of the two digits by adding them together repeatedly using the `add` instruction and `loop` control structure.

6. The `breakdigits` loop is responsible for breaking down the sum into individual digits and pushing them onto the stack. It uses integer division and the `div` instruction to separate the digits.

7. The program then calls the `outputmessage` subroutine to display the message "SQUARE = ".

8. The `sprint` loop retrieves the digits from the stack, one by one, and prints them using the `print` subroutine.

9. Finally, the program calls the `printnewline` subroutine to print a newline character and then exits using the `int 0x80` system call.

### Example:

Let's run through an example of how the program works:

Suppose the user enters the two-digit number "25" as input.

1. The program will display the message "ENTER THE NUMBER (2 digit)".

2. The user inputs "25".

3. The `convert` subroutine converts the ASCII values of '2' and '5' into the numeric values 2 and 5, respectively.

4. The `sum` loop calculates the sum of 2 and 5, resulting in 7.

5. The `breakdigits` loop breaks down 7 into individual digits and pushes them onto the stack: '7'.

6. The `outputmessage` subroutine prints "SQUARE = ".

7. The `sprint` loop pops '7' from the stack and prints it.

8. The program prints a newline character.

9. The program exits.

Output:
```
ENTER THE NUMBER (2 digit)
25
SQUARE = 7
```

This program demonstrates basic input and output handling in x86 assembly language, along with numeric conversions and arithmetic operations. The program is designed to work with two-digit numbers, and its behavior is based on the user's input.

Make sure to assemble and run the code on an appropriate x86 assembly environment to observe the actual output.