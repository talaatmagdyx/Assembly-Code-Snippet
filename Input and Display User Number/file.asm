section .data                           ; Data segment
   userMsg db 'Please enter a number: ' ; Ask the user to enter a number
   lenUserMsg equ $-userMsg             ; The length of the message
   dispMsg db 'You have entered: '
   lenDispMsg equ $-dispMsg                 

section .bss           ; Uninitialized data
   num resb 5          ; Reserve space for the entered number (up to 5 bytes)
	
section .text          ; Code Segment
   global _start
	
_start:                ; Program entry point
   ; Display user prompt
   mov eax, 4
   mov ebx, 1
   mov ecx, userMsg
   mov edx, lenUserMsg
   int 80h              ; Invoke syscall to write message

   ; Read and store the user input
   mov eax, 3
   mov ebx, 2
   mov ecx, num  
   mov edx, 5          ; Read up to 5 bytes of numeric input
   int 80h              ; Invoke syscall to read input
	
   ; Output the message 'You have entered: '
   mov eax, 4
   mov ebx, 1
   mov ecx, dispMsg
   mov edx, lenDispMsg
   int 80h              ; Invoke syscall to write message

   ; Output the entered number
   mov eax, 4
   mov ebx, 1
   mov ecx, num
   mov edx, 5
   int 80h              ; Invoke syscall to write entered number
    
   ; Exit the program
   mov eax, 1
   mov ebx, 0
   int 80h              ; Invoke syscall to exit
