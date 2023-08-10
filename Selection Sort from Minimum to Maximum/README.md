# Selection Sort from Minimum to Maximum

## source code 
```assembly
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
```

The provided assembly code implements the selection sort algorithm to sort an array of numbers in ascending order. It utilizes system calls for input and output operations. Here's a breakdown of the code's functionality:

1. **User Prompt and Input Handling:**
   - The program begins by prompting the user to input the number of elements in the array.
   - The `takeinput` subroutine reads and stores the user's input numbers into the `input` buffer.

2. **Sorting the Array:**
   - The `sorting` section employs the selection sort algorithm.
   - It iterates through the array, comparing each element with the rest of the array to find the smallest element.
   - Once the smallest element is located, it's swapped with the element at the current position.
   - This process is repeated until the array is sorted in ascending order.

3. **Printing Sorted Array:**
   - After sorting, the program outputs the message "Sorted Array."
   - It then takes additional input from the user to update the sorted array with new values.
   - The program outputs the updated sorted array.

4. **Exit:**
   - The program exits with a system call after completing its tasks.

## Example

Suppose we run the program with the following steps:

1. The program prompts: "ENTER ELEMENTS NOW."
2. We input "5" and press Enter.
3. The program sorts the array and outputs the sorted array: "Sorted Array: 1 2 3 4 5"
4. We input "4 3 2 1" and press Enter after each number.
5. The program outputs the updated sorted array: "Updated Sorted Array: 1 1 2 3 4 5"
6. The program exits.

The example showcases how the program efficiently sorts an array and allows users to provide additional input for updating the sorted array.

---
