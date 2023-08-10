section	.text
   global _start        ; Entry point for the program
	
_start:	                ; Start of the program
   mov     esi, 4       ; Pointing to the rightmost digit
   mov     ecx, 5       ; Number of digits
   clc                   ; Clear carry flag
   
add_loop:  
   mov     al, [num1 + esi]  ; Load BCD digit from num1
   adc     al, [num2 + esi]  ; Add BCD digit from num2 with carry
   aaa                        ; Adjust result for BCD addition
   pushf                      ; Push flags onto the stack
   or      al, 30h            ; Convert result back to ASCII
   popf                       ; Pop flags from the stack
	
   mov     [sum + esi], al    ; Store the ASCII result in memory location 'sum'
   dec     esi                 ; Move to the next digit
   loop    add_loop            ; Loop for remaining digits
	
   mov     edx,len	        ; Message length
   mov     ecx,msg	        ; Message to write
   mov     ebx,1	        ; File descriptor (stdout)
   mov     eax,4	        ; System call number (sys_write)
   int     0x80	        ; Call kernel to display message

   mov     edx,5	        ; Message length
   mov     ecx,sum	        ; Message to write
   mov     ebx,1	        ; File descriptor (stdout)
   mov     eax,4	        ; System call number (sys_write)
   int     0x80	        ; Call kernel to display result

   mov     eax,1	        ; System call number (sys_exit)
   int     0x80	        ; Call kernel to exit program
	
section	.data
msg db 'The Sum is:',0xa ; Message to display
len equ $ - msg             ; Calculate length of message
num1 db '12345'             ; First BCD number
num2 db '23456'             ; Second BCD number
sum db '     '              ; Storage for the sum (initialized with spaces)
