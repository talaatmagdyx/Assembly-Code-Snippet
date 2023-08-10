section .text
   global _start    ; Declare global entry point _start
_start:             ; Program entry point
   
   ; Writing the name 'AAA BBB'
   mov   edx, 9     ; Message length
   mov   ecx, name  ; Message to write
   mov   ebx, 1     ; File descriptor (stdout)
   mov   eax, 4     ; System call number (sys_write)
   int   0x80       ; Call kernel
   
   mov   [name], DWORD 'CCC'  ; Change the name to CCC BBB
   
   ; Writing the name 'CCC BBB'
   mov   edx, 8     ; Message length
   mov   ecx, name  ; Message to write
   mov   ebx, 1     ; File descriptor (stdout)
   mov   eax, 4     ; System call number (sys_write)
   int   0x80       ; Call kernel
   
   mov   eax, 1     ; System call number (sys_exit)
   int   0x80       ; Call kernel

section .data
name db 'AAA BBB'   ; Initial name 'AAA BBB'
