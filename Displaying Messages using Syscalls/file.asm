; This assembly program displays messages using syscalls.

section .text
   global _start     ; Must be declared for linker (gcc)
	
_start:             ; Tell linker entry point
   mov edx, len      ; Message length
   mov ecx, msg      ; Message to write
   mov ebx, 1        ; File descriptor (stdout)
   mov eax, 4        ; System call number (sys_write)
   int 0x80          ; Call kernel to display message

   mov edx, 9        ; Message length
   mov ecx, s2       ; Message to write
   mov ebx, 1        ; File descriptor (stdout)
   mov eax, 4        ; System call number (sys_write)
   int 0x80          ; Call kernel to display message

   mov eax, 1        ; System call number (sys_exit)
   int 0x80          ; Call kernel to exit

section .data
msg db 'Displaying 9 stars', 0xa ; A message
len equ $ - msg    ; Length of the message
s2 times 6 db 'File'
