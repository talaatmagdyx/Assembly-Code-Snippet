section .text
   global _start   ; Declare entry point for linker (ld)
   
_start:	
   
   mov  eax,3      ; Number of bytes to be summed (counter)
   mov  ebx,0      ; EBX will store the sum
   mov  ecx, x     ; ECX will point to the current element to be summed

top:
   add  ebx, [ecx] ; Add the current element to the sum

   add  ecx,1      ; Move pointer to next element
   dec  eax        ; Decrement counter
   jnz  top        ; If counter not 0, then loop again

done:
   add   ebx, '0'  ; Convert sum to ASCII character
   mov  [sum], ebx ; Store result in "sum"

display:
   mov  edx,1      ; Message length
   mov  ecx, sum   ; Message to write
   mov  ebx, 1     ; File descriptor (stdout)
   mov  eax, 4     ; System call number (sys_write)
   int  0x80       ; Call kernel
	
   mov  eax, 1     ; System call number (sys_exit)
   int  0x80       ; Call kernel

section .data
global x
x:    
   db  2
   db  4
   db  3

sum: 
   db  0
