SYS_EXIT  equ 1
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section .text
   global _start    ; Must be declared for linker (gcc)
   
_start:             ; Tell linker entry point
   ; Display "Hello, programmers!" message
   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg1         
   mov edx, len1 
   int 0x80                
   
   ; Display "Welcome to the world of," message
   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg2         
   mov edx, len2 
   int 0x80 
   
   ; Display "Linux assembly programming!" message
   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg3         
   mov edx, len3 
   int 0x80
   
   ; Exit the program
   mov eax, SYS_EXIT    ; System call number (sys_exit)
   int 0x80             ; Call kernel

section .data
msg1 db  'Hello, programmers!', 0xA, 0xD    ; First message
len1 equ $ - msg1       

msg2 db 'Welcome to the world of,', 0xA, 0xD ; Second message
len2 equ $ - msg2 

msg3 db 'Linux assembly programming! '        ; Third message
len3 equ $ - msg3
