; This assembly code finds the largest of three numbers and displays the result.

section .text
global _start       ; Declare _start as the entry point for the linker

_start:             ; Start of the program
   mov   ecx, [num1]
   cmp   ecx, [num2]
   jg    check_third_num
   mov   ecx, [num2]

check_third_num:
   cmp   ecx, [num3]
   jg    _exit
   mov   ecx, [num3]

_exit:
   mov   [largest], ecx    ; Store the largest number in 'largest'
   mov   ecx, msg
   mov   edx, len
   mov   ebx, 1             ; File descriptor (stdout)
   mov   eax, 4             ; System call number (sys_write)
   int   0x80               ; Call kernel to print the message

   mov   ecx, largest
   mov   edx, 2
   mov   ebx, 1             ; File descriptor (stdout)
   mov   eax, 4             ; System call number (sys_write)
   int   0x80               ; Call kernel to print the largest number
    
   mov   eax, 1             ; System call number (sys_exit)
   int   80h                ; Call kernel to exit

section .data
msg db "The largest digit is: ", 0xA, 0xD   ; Message to be displayed
len equ $ - msg            ; Length of the message
num1 dd '47'               ; First number (ASCII representation)
num2 dd '22'               ; Second number (ASCII representation)
num3 dd '31'               ; Third number (ASCII representation)

segment .bss
largest resb 2             ; Storage for the largest number (ASCII representation)
