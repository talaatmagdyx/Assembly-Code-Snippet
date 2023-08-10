; This assembly code reads a sentence and a word from the user, and then deletes the given word from the sentence.

section .text

; Function to read input
input:
    mov eax, 3    ; sys_read call
    mov ebx, 0    ; File descriptor (stdin)
    int 0x80      ; Call kernel
    ret

; Function to print output
output:
    mov eax, 4    ; sys_write call
    mov ebx, 1    ; File descriptor (stdout)
    int 0x80      ; Call kernel
    ret

global _start
_start:

    ; Print message asking for input sentence
    mov ecx, inpmsg
    mov edx, linp
    call output

    ; Read input sentence
    mov ecx, inpsen
    mov edx, 1000
    call input

    ; Print message asking for word to be deleted
    mov ecx, inpwrdmsg
    mov edx, linpwrd
    call output

    ; Read word to be deleted
    mov ecx, inpwrd
    mov edx, 100
    call input

    mov ebp, 0   ; Counter for iterating through the sentence
    mov esi, 0   ; Counter for iterating through the word

sencheck:
    mov cl, byte[inpwrd + esi]
    mov dl, byte[inpsen + ebp]
    cmp cl, dl
    jne continue

    ; Found a matching character, continue comparing
comparing:
    add esi, 1
    cmp byte[inpwrd + esi], 10
    jne cont
    ; Reached the end of the word, mark the end position
    mov dword[ptrstop], ebp
    call deleteword
    mov ecx, dword[ptrstrt]
    mov edx, dword[ptrstop]
    sub edx, ecx
    add edx, 1
    sub ebp, edx

cont:
    add ebp, 1
    cmp byte[inpsen + ebp], 10
    je printsen
    jmp sencheck

; Printing the modified sentence
printsen:
    mov ecx, 10
    mov edx, 1
    call output

    mov ecx, omsg
    mov edx, lomsg
    call output

    mov ebp, 0

printing:
    mov al, byte[inpsen + ebp]
    cmp al, 10
    je exit
    mov byte[printdata], al

    mov ecx, printdata
    mov edx, 1
    call output
    add ebp, 1
    jmp printing

; Exit the program
exit:
    mov ecx, 10
    mov edx, 1
    call output

    mov eax, 1    ; sys_exit call
    mov ebx, 0    ; Exit status
    int 0x80       ; Call kernel

; Function to delete the word from the sentence
deleteword:
    mov edx, 0
    mov eax, dword[ptrstrt]
    mov ebx, dword[ptrstop]
    add ebx, 1
deleting:
    mov cl, byte[inpsen + ebx + edx]
    mov byte[inpsen + eax + edx], cl
    add edx, 1
    mov cl, byte[inpsen + ebx + edx - 1]
    cmp cl, 10
    jne deleting
    ret

section .bss
inpsen resb 1000   ; Storage for input sentence
inpwrd resb 100    ; Storage for word to be deleted

section .data
ptrstop dd 0       ; Pointer to the end of word
ptrstrt dd 0       ; Pointer to the start of word
inpmsg db "ENTER THE SENTENCE : ", 32
linp equ $ - inpmsg
inpwrdmsg db "ENTER THE WORD TO BE DELETED : ", 32
linpwrd equ $ - inpwrdmsg
omsg db "MODIFIED SENTENCE", 10
lomsg equ $ - omsg
printdata db 30h   ; Storage for printing character
