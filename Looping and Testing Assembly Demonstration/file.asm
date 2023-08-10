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
