; This assembly program determines whether a given number is even or odd using bitwise operations and displays the result.

section .text
   global _start            ; Must be declared for using GCC
	
_start:                     ; Tell linker entry point
   mov   ax, 8h             ; Load 8 into the ax register
   and   ax, 1              ; Perform bitwise AND with 1
   jz    evnn               ; Jump to 'evnn' if result is zero (even)
   mov   eax, 4             ; System call number (sys_write)
   mov   ebx, 1             ; File descriptor (stdout)
   mov   ecx, odd_msg       ; Message to write
   mov   edx, len2          ; Length of message
   int   0x80               ; Call kernel
   jmp   outprog            ; Jump to program exit

evnn:
   mov   ah, 09h            ; Set 'ah' register for displaying even message
   mov   eax, 4             ; System call number (sys_write)
   mov   ebx, 1             ; File descriptor (stdout)
   mov   ecx, even_msg      ; Message to write
   mov   edx, len1          ; Length of message
   int   0x80               ; Call kernel

outprog:
   mov   eax, 1             ; System call number (sys_exit)
   int   0x80               ; Call kernel

section .data
even_msg  db  'Even Number!' ; Message showing even number
len1  equ  $ - even_msg      ; Length of even_msg
   
odd_msg db  'Odd Number!'    ; Message showing odd number
len2  equ  $ - odd_msg       ; Length of odd_msg
