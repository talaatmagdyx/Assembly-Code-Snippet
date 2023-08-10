section	.text
   global _start        ; Entry point for the program

_start:	                ; Start of the program
   sub     ah, ah       ; Clear AH register (AH = 0)
   mov     al, '9'      ; Load ASCII value of '9' into AL
   sub     al, '3'      ; Convert ASCII to decimal using ASCII adjustment
   aas                   ; ASCII Adjust for Subtraction (correct BCD result)
   or      al, 30h      ; Convert result back to ASCII
   mov     [res], ax    ; Store the result in memory location 'res'

   mov	edx,len	        ; Message length
   mov	ecx,msg	        ; Message to write
   mov	ebx,1	        ; File descriptor (stdout)
   mov	eax,4	        ; System call number (sys_write)
   int	0x80	        ; Call kernel to display message

   mov	edx,1	        ; Message length
   mov	ecx,res	        ; Message to write
   mov	ebx,1	        ; File descriptor (stdout)
   mov	eax,4	        ; System call number (sys_write)
   int	0x80	        ; Call kernel to display result

   mov	eax,1	        ; System call number (sys_exit)
   int	0x80	        ; Call kernel to exit program
	
section	.data
msg db 'The Result is:',0xa ; Message to display
len equ $ - msg             ; Calculate length of message
section .bss
res resb 1                   ; Storage for the result
