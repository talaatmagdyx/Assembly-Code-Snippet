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
