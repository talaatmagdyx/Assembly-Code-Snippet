section	.text
   global _start    ; Entry point for the program
	
_start:             ; Start of the program
   mov	eax,'2'      ; Load ASCII value of '2' into EAX
   sub     eax, '0'   ; Convert ASCII to decimal
	
   mov 	ebx, '3'    ; Load ASCII value of '3' into EBX
   sub     ebx, '0'   ; Convert ASCII to decimal
	
   add 	eax, ebx    ; Calculate the sum
   add	eax, '0'     ; Convert sum to ASCII
	
   mov 	[sum], eax  ; Store the ASCII sum in memory location 'sum'
   mov	ecx,msg	    ; Load address of message into ECX
   mov	edx, len    ; Load length of message into EDX
   mov	ebx,1	    ; File descriptor (stdout)
   mov	eax,4	    ; System call number (sys_write)
   int	0x80	    ; Call kernel to display message
	
   mov	ecx,sum     ; Load address of ASCII sum into ECX
   mov	edx, 1      ; Set length to 1 (single character)
   mov	ebx,1	    ; File descriptor (stdout)
   mov	eax,4	    ; System call number (sys_write)
   int	0x80	    ; Call kernel to display sum
	
   mov	eax,1	    ; System call number (sys_exit)
   int	0x80	    ; Call kernel to exit program
	
section .data
   msg db "The sum is:", 0xA,0xD ; Message to display
   len equ $ - msg   ; Calculate length of message
   segment .bss
   sum resb 1         ; Storage for the calculated sum
