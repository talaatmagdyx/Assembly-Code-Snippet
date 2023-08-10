# ASCII Division and Display in x86 Assembly

This x86 assembly code showcases a simple division operation on ASCII-encoded digits. The program takes two ASCII digits as input, converts them to decimal equivalents, performs division, and then displays the result.

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
