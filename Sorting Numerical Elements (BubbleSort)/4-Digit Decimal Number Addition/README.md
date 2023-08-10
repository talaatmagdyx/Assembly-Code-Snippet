# Assembly Program: Sorting Numerical Elements

This assembly program takes multiple numerical inputs, sorts them, and displays the sorted list using ASCII characters. The program is designed for a Linux environment and utilizes Linux syscalls for I/O operations and program termination.

## Code Explanation

The provided assembly code performs the following steps:

1. **Display Newline Function** (`startnew`):
   - Displays a newline character using a Linux syscall.

2. **Conversion Function** (`convert`):
   - Converts ASCII characters to numerical digits.
   - Supports conversion of numbers up to 99 (two digits).

3. **Input and Conversion Function** (`takeinput` and `convert`):
   - Displays a message prompting the user to enter an element.
   - Reads user input, converts it to its numerical form, and stores it in the `input` array.

4. **Sorting the Input Array** (`sort`):
   - Implements a basic bubble sort algorithm to arrange the elements in ascending order.

5. **Displaying the Sorted Output** (`output`):
   - Converts sorted numerical values back to ASCII and displays them with spaces between elements.

6. **Program Termination**:
   - The program terminates after displaying the sorted list.

## Example

Suppose you run the program and input the following elements:
```
5
9
1
3
7
```

The program will sort these elements in ascending order and display the sorted list:
```
1 3 5 7 9
```

After displaying the sorted list, the program will terminate.

## Usage

1. Make sure you are running this code on a Linux environment or emulator that supports the syscalls used in the code.
2. Assemble the code using an appropriate assembler (e.g., NASM) and linker (e.g., LD).
3. Run the assembled binary to execute the program.
4. Follow the instructions to input the number of elements and then enter the elements one by one.
5. The program will sort the elements and display the sorted list.

**Note**: Assembly language is platform-specific and can interact with system components. Make sure you understand the code before running it, especially when it involves system calls.

---