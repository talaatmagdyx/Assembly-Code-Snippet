section .text

global _start   ; Entry point for the linker (gcc)

_start:

    ; Storing a 4-byte value (0x12345678) in memory
    mov dword [a], 0x12345678

    ; Loading the least significant byte of 'a' into register 'cl'
    mov cl, byte [a]

    ; Comparing the least significant byte with 0x78
    cmp cl, 0x78
    je little    ; Jump if equal to 'little' section

    ; Comparing the least significant byte with 0x12
    jne ext      ; Jump if not equal to 'ext' section

    ; Display 'big' message for big endian architecture
    mov ecx, big
    mov edx, lbig
    mov eax, 4
    mov ebx, 1    ; File descriptor (stdout)
    int 0x80      ; Invoke sys_write syscall

    jmp ext       ; Jump to 'ext' section

little:

    ; Display 'lit' message for little endian architecture
    mov ecx, lit
    mov edx, llit
    mov eax, 4
    mov ebx, 1    ; File descriptor (stdout)
    int 0x80      ; Invoke sys_write syscall

ext:

    ; Exit the program
    mov eax, 1    ; sys_exit syscall number
    mov ebx, 0    ; Return code
    int 0x80      ; Invoke sys_exit syscall

section .data

a dd 30h          ; Memory location to store the value
big db "BIG ENDIAN        -      GODLY", 10 ; Message for big endian
lbig equ $ - big  ; Length of the big endian message
lit db "LITTLE ENDIAN        -       GODLY", 10 ; Message for little endian
llit equ $ - lit  ; Length of the little endian message
