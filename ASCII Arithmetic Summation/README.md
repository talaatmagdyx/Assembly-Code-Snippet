# ASCII Arithmetic Addition in x86 Assembly

This assembly code is designed to showcase a simple arithmetic addition operation on ASCII-encoded digits. The program will take two ASCII digits as input, convert them to their decimal equivalents, perform addition, and then display the result.

### How It Works

1. The program begins by loading the ASCII values of two digits into registers.

2. It converts the ASCII values to their corresponding decimal values by subtracting the ASCII value of '0'.

3. The decimal values are then added together to calculate the sum.

4. The sum is converted back to an ASCII value by adding the ASCII value of '0'.

5. The result is displayed along with an appropriate message.

### Example

For instance, let's consider the input '2' and '3':

1. The ASCII value of '2' (50) is converted to the decimal value 2.

2. The ASCII value of '3' (51) is converted to the decimal value 3.

3. The decimal values 2 and 3 are added to obtain the sum of 5.

4. The decimal value 5 is then converted back to its ASCII representation (53).

5. The program will display: "The sum is: 5".

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

Make sure you have NASM and a compatible x86 assembler installed.
