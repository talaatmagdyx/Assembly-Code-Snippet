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
