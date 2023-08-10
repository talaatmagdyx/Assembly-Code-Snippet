; This assembly code performs the addition of two 4-digit decimal numbers.

section .text

; Function to convert ASCII characters to numerical digits
convert:
    sub bl, 30h          ; Convert ASCII to numerical value
    mov eax, 0           ; Clear EAX
    mov ecx, 0           ; Clear ECX
    mov al, bl           ; Move the numerical value to AL
    mov byte [count], 3  ; Set count to 3
acon:
    mov edx, 0           ; Clear EDX
    mov ecx, 10          ; Set ECX to 10
    mul cx               ; Multiply EAX by CX
    sub bh, 30h          ; Convert ASCII to numerical value
    shr ebx, 8           ; Shift right to get the high byte
    mov edx, 0           ; Clear EDX
    mov dl, bl           ; Move the numerical value to DL
    add ax, dx           ; Add the contents of AL and DX
    sub byte [count], 1  ; Decrement count
    cmp byte [count], 0  ; Compare count with 0
    jne acon             ; Jump if not equal (loop)

    ret                  ; Return

global _start
_start:
    ; Display "ENTER THE NUMBERS(4 DIGIT)" message
    mov ecx, msg
    mov edx, lmsg
    mov eax, 4
    mov ebx, 1
    int 0x80

    ; Display a newline character
    mov ecx, space
    mov edx, 1
    mov eax, 4
    mov ebx, 1
    int 80h

    ; Read input for the first number
    mov ecx, inp1
    mov edx, 4
    mov eax, 3
    mov ebx, 0
    int 0x80

    ; Read a single character from input
    mov eax, 3
    mov ebx, 0
    mov ecx, temp
    mov edx, 1
    int 80h

    ; Display " + " message
    mov ecx, msgplus
    mov edx, lpl
    mov eax, 4
    mov ebx, 1
    int 80h

    ; Read input for the second number
    mov ebx, 0
    mov ebx, [inp1]
    call convert
    mov word [inp1], ax

    ; Display a space character
    mov ecx, space
    mov edx, 1
    mov eax, 4
    mov ebx, 1
    int 80h

    ; Read input for the second number
    mov ecx, inp2
    mov edx, 4
    mov eax, 3
    mov ebx, 0
    int 0x80

    ; Display "______" message
    mov ecx, msgend
    mov edx, lend
    mov eax, 4
    mov ebx, 1
    int 80h

    ; Convert and store the second input number
    mov ebx, 0
    mov ebx, [inp2]
    call convert
    mov word [inp2], ax

    ; Add the two converted numbers
    mov eax, 0
    mov edx, 0
    mov ax, [inp1]
    mov dx, [inp2]
    add ax, dx

    ; Push the hexadecimal value 29h onto the stack
    push 29h
    mov byte [count], 5

    ; Loop to break down the sum into individual digits
break:
    mov ebx, 10           ; Divide by 10
    mov edx, 0            ; Clear EDX
    div bx                ; Divide EAX by BX
    add dl, 30h           ; Convert remainder to ASCII
    push dx               ; Push ASCII digit onto the stack
    sub byte [count], 1   ; Decrement count
    cmp byte [count], 0   ; Compare count with 0
    jne break             ; Jump if not equal (loop)

    ; Pop digits from the stack and display them
    mov eax, 0
print:
    mov byte [temp], al  ; Store the ASCII digit
    mov ecx, temp
    mov edx, 1
    mov eax, 4
    mov ebx, 1
    int 80h

    ; Pop a digit from the stack
    mov eax, 0
    pop ax
    cmp al, 29h           ; Check if the end marker (ASCII 29h) is reached
    jne print             ; Jump if not equal

    ; Display a newline character
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 80h

    ; Exit the program
    mov eax, 1
    mov ebx, 0
    int 80h

section .data
msg db "ENTER THE NUMBERS(4 DIGIT)", 10
lmsg equ $-msg
newline db 0xa
space db " "
msgplus db "      +", 10
lpl equ $-msgplus
msgend db "______", 10
lend equ $-msgend
inp1 dw 30h
inp2 dw 30h
sum dw 30h
count db 30h
temp db 30h
