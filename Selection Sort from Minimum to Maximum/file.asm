; Selection Sort From Minimum to Maximum

section .text
global _start     ; Must be declared for linker (ld)

; Print a newline character
println:
   mov ecx, newline
   mov edx, 1
   mov eax, 4
   mov ebx, 1
   int 0x80
   ret

; Convert ASCII character to decimal value
convert:
   mov ecx, [inp]
   mov bl, 10
   mov al, cl
   sub al, 30h
   cmp bl, 10
   je converted

converted:
   mov byte[inp], al
   ret

; Take user input and convert to decimal
takeinput:
   mov ecx, number_count
   mov edx, length
   mov eax, 4
   mov ebx, 1
   int 0x80

tinput:
   mov ecx, inp
   mov edx, 3
   mov eax, 3
   mov ebx, 0
   int 0x80
   call convert
   ret

; Entry point of the program
global _start

_start:
   ; Ask the user to enter the number of elements
   mov ecx, number_of_elements
   mov edx, length_elements
   mov eax, 4
   mov ebx, 1
   int 0x80
   call tinput

   ; Initialize registers and variables
   mov eax, 0
   mov al, byte[inp]
   mov byte[n], al
   mov esi, 0

   ; Take user input for the array elements
taking:
   push ax
   call takeinput
   mov al, byte[inp]
   mov byte[input+esi], al
   add esi, 1
   mov eax, 0
   pop ax
   cmp eax, esi
   jne taking

   ; Sorting using selection sort algorithm
sorting:
   mov edx, esi
   mov al, byte[input+edx]
   mov byte[temp1], al

comparing:
   add edx, 1
   mov bl, byte[n]
   cmp dl, bl
   je aftercompare
   mov cl, byte[input+edx]
   cmp al, cl
   jle comparing
   mov byte[temp2], dl
   mov al, cl
   jmp comparing

aftercompare:
   cmp al, [temp1]
   je noswap
   mov byte[input+esi], al
   mov ecx, 0
   mov edx, 0
   mov cl, [temp1]
   mov dl, [temp2]
   mov byte[input+edx], cl

noswap:
   add esi, 1
   mov ebx, 0
   mov bl, byte[n]
   cmp esi, ebx
   jne sorting

   ; Display the sorted array
   mov ecx, sortmsg
   mov edx, lsortmsg
   mov eax, 4
   mov ebx, 1
   int 0x80

   mov ebp, 0
   movzx ebp, byte[n]
   mov esi, 0
   call println

output:
   mov eax, 0
   mov al, byte[input+esi]
   push 30h

break:
   mov bx, 10
   mov edx, 0
   div bx
   add dx, 30h
   push dx
   cmp al, 0
   jne break

   mov eax, 0
   pop ax

print:
   mov byte[printdata], al
   mov ecx, printdata
   mov edx, 1
   mov eax, 4
   mov ebx, 1
   int 0x80
   pop ax
   cmp al, 30h
   jne print

   ; Print a newline character
   mov ecx, newline
   mov edx, 1
   mov eax, 4
   mov ebx, 1
   int 0x80

   add esi, 1
   cmp ebp, esi
   jne output

   ; Exit program
   mov eax, 1
   mov ebx, 0
   int 0x80

section .bss
input resb 100

section .data
temp1 db 30h
temp2 db 30h
printdata db 30h
inp dd 30h
space db 32
newline db 10
n db 30h
number_count db "ENTER ELEMENTS Now", 32
length equ $-number_count
number_of_elements db "ENTER NUMBER OF ELEMENTS WHICH YOU WANT TO MAKE SORT FOR IT ", 32
length_elements equ $-number_of_elements
sortmsg db "SORTED ARRAY", 10, 7
lsortmsg equ $-sortmsg
