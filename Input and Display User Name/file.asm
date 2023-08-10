section .data         ; Data segment
   userMsg db 'Please enter a name: ' ; Ask the user to enter a name
   lenUserMsg equ $-userMsg             ; The length of the message
   dispMsg db 'You have entered: '
   lenDispMsg equ $-dispMsg

section .bss          ; Uninitialized data
   name resb 5        ; Reserve 5 bytes for the name

section .text         ; Code Segment
   global _start      ; Declare entry point

_start:               ; Main program
   ; Display user prompt
   mov eax, 4         ; sys_write syscall number
   mov ebx, 1         ; file descriptor (stdout)
   mov ecx, userMsg
   mov edx, lenUserMsg
   int 80h

   ; Read and store the user input
   mov eax, 3         ; sys_read syscall number
   mov ebx, 2         ; file descriptor (stdin)
   mov ecx, name
   mov edx, 5         ; Read up to 5 bytes
   int 80h
	
   ; Output the message 'You have entered: '
   mov eax, 4         ; sys_write syscall number
   mov ebx, 1         ; file descriptor (stdout)
   mov ecx, dispMsg
   mov edx, lenDispMsg
   int 80h  

   ; Output the entered name
   mov eax, 4         ; sys_write syscall number
   mov ebx, 1         ; file descriptor (stdout)
   mov ecx, name
   mov edx, 5         ; Output up to 5 bytes
   int 80h  
    
   ; Exit the program
   mov eax, 1         ; sys_exit syscall number
   mov ebx, 0         ; Exit code 0
   int 80h
