# Decimal Multiplication and Display in x86 Assembly

This assembly code demonstrates how to multiply two decimal digits and display the result as an ASCII character using the x86 architecture. The program takes two single-digit decimal numbers, performs multiplication, converts the result to ASCII, and then displays it on the screen.

### Explanation

1. **Loading and Converting Digits:** The code begins by loading two single-digit decimal values ('3' and '2') into the `AL` and `BL` registers. It then subtracts the ASCII value of '0' from each digit to convert them to their corresponding decimal values.

2. **Multiplication:** The program uses the `MUL` instruction to multiply the values in `AL` and `BL`, storing the 16-bit result in the `AX` register.

3. **Converting Result to ASCII:** After the multiplication, the result in `AX` is converted back to an ASCII character by adding the ASCII value of '0'.

4. **Displaying Messages:** The program displays a message ("The result is:") using the `sys_write` system call, and then displays the ASCII result using another `sys_write` call.

5. **Exiting the Program:** Finally, the program exits using the `sys_exit` system call.

### Example

```assembly
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
```

To run the program, you'll need an x86 assembly environment or emulator. This code snippet showcases the process of decimal multiplication and ASCII conversion within the context of x86 assembly programming.
