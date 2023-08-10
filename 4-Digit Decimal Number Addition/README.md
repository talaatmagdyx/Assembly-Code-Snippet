# Assembly Program: 4-Digit Decimal Number Addition

This assembly program takes two 4-digit decimal numbers as input, adds them, and displays the sum using ASCII characters. The program utilizes Linux syscalls for I/O operations and program termination.

## Code Explanation

The provided assembly code performs the following steps:

1. **Conversion Function**: The `convert` function is defined to convert ASCII characters to numerical digits.

2. **Program Initialization** (`_start`):
   - Displays a message asking the user to input the numbers.
   - Reads the first number, converts it to its numerical form, and stores it.
   - Reads the '+' character.
   - Reads the second number, converts it to its numerical form, and stores it.
   - Computes the sum of the two numbers.
   - Breaks down the sum into individual digits and displays them.

3. **Data Section** (`.data`):
   - Contains messages used in the program.
   - Defines variables to store input numbers, sum, count, and temporary data.

## Example

Suppose the user inputs the first number "1234" and the second number "5678".

1. Display:
   ```
   ENTER THE NUMBERS(4 DIGIT)
   ```

2. Input:
   ```
   1234
   ```

3. Display:
   ```
         +
   ```

4. Input:
   ```
   5678
   ```

5. Display:
   ```
   ______
   ```

6. Output:
   ```
   6912
   ```

7. Newline:
   ```
   
   ```

8. Program Exits.

## Usage

1. Make sure you are running this code on a Linux environment or emulator that supports the syscalls used in the code.
2. Assemble the code using an appropriate assembler (e.g., NASM) and linker (e.g., LD).
3. Run the assembled binary to execute the program.
4. Follow the instructions to input two 4-digit decimal numbers.
5. The program will display the sum of the numbers in ASCII form.

**Note**: Assembly language is highly architecture-specific. Ensure you are using the appropriate assembler and platform for this code.

---