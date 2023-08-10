# ASCII Division and Display in x86 Assembly

This x86 assembly code showcases a simple division operation on ASCII-encoded digits. The program takes two ASCII digits as input, converts them to decimal equivalents, performs division, and then displays the result.

### source code

```assembly
section	.text
   global _start    ; Entry point for the program
	
_start:             ; Start of the program
   mov	ax,'8'      ; Load ASCII value of '8' into AX
   sub     ax, '0'   ; Convert ASCII to decimal
	
   mov 	bl, '2'    ; Load ASCII value of '2' into BL
   sub     bl, '0'   ; Convert ASCII to decimal
	
   div 	bl          ; Divide AX by BL, quotient in AL, remainder in AH
   add	ax, '0'     ; Convert result to ASCII
	
   mov 	[res], ax  ; Store the ASCII result in memory location 'res'
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
len equ $- msg   ; Calculate length of message
segment .bss
res resb 1         ; Storage for the calculated result
```

### How It Works

1. The program begins by loading the ASCII values of two digits into registers.

2. It converts the ASCII values to their corresponding decimal values by subtracting the ASCII value of '0'.

3. Division is performed on the decimal values by using the `div` instruction. The dividend is stored in AX, and the divisor is loaded into BL. The quotient will be in AL, and the remainder in AH.

4. The decimal quotient is then converted back to its ASCII representation by adding the ASCII value of '0'.

5. The result is displayed along with an appropriate message.

### Example

For example, let's consider the input '8' and '2':

1. The ASCII value of '8' (56) is converted to the decimal value 8.

2. The ASCII value of '2' (50) is converted to the decimal value 2.

3. Division of 8 by 2 results in a quotient of 4.

4. The decimal quotient 4 is then converted back to its ASCII representation (52).

5. The program will display: "The result is: 4".

### How to Run

To run this program:

1. Assemble the code using an assembler like NASM:
   ```
   nasm -f elf file.asm -o file.o
   ```

2. Link the object file to create an executable:
   ```
   ld -m elf_i386 file.o -o file
   ```

3. Run the executable:
   ```
   ./file
   ```

Ensure you have NASM and a compatible x86 assembler installed.
