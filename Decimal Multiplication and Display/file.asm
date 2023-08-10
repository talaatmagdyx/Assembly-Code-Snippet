section .text
   global _start    ; Entry point for the program
	
_start:             ; Start of the program
	
   mov	al,'3'       ; Load ASCII value of '3' into AL
   sub     al, '0'    ; Convert ASCII to decimal
	
   mov 	bl, '2'    ; Load ASCII value of '2' into BL
   sub     bl, '0'    ; Convert ASCII to decimal
	
   mul 	bl          ; Multiply AL by BL, result in AX
   add	al, '0'     ; Convert result to ASCII
	
   mov 	[res], al  ; Store the ASCII result in memory location 'res'
   mov	ecx,msg	    ; Load address of message into ECX
   mov	edx, len    ; Load length of message into EDX
   mov	ebx,1	    ; File descriptor (stdout)
   mov	eax,4	    ; System call number (sys_write)
   int	0x80	    ; Call kernel to display message
	
   mov	ecx,res     ; Load address of ASCII result into ECX
   mov	edx, 1      ; Set length to 1 (single character)
   mov	ebx,1	    ; File descriptor (stdout)
   mov	eax,4	    ; System call number (sys_write)
   int	0x80	    ; Call kernel to display result
	
   mov	eax,1	    ; System call number (sys_exit)
   int	0x80	    ; Call kernel to exit program

section .data
msg db "The result is:", 0xA,0xD ; Message to display
len equ $ - msg   ; Calculate length of message
segment .bss
res resb 1         ; Storage for the calculated result
