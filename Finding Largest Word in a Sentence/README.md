# Assembly Program: Finding and Printing the Largest Word in a Sentence

This assembly program reads a sentence from the user, identifies words, and finds the largest word within it. It utilizes Linux syscalls for I/O operations and program termination.

## Code Explanation

The provided assembly code performs the following steps:

1. **Input Procedure** (`input`):
   - Invokes syscall 3 (`sys_read`) to read input from the user.

2. **Output Procedure** (`output`):
   - Invokes syscall 4 (`sys_write`) to display output to the user.

3. **Main Procedure** (`_start`):
   - Prompts the user to enter a sentence.
   - Reads the input sentence from the user.
   - Iterates through the sentence to find the largest word.
   - Prints the entered sentence and the largest word.

4. **Finding Largest Word** (`finding_large`):
   - Identifies words by detecting spaces or newline characters.
   - Compares word lengths and updates the largest word.

5. **Printing the Largest Word** (`printsen`, `printdoc`):
   - Prints the entered sentence.
   - Prints the label "LARGEST WORD - " followed by the largest word.

6. **Program Termination**:
   - Uses syscall 1 (`sys_exit`) to exit the program.

## Example

Suppose you run the program and provide the following input:

```
ENTER THE SENTENCE : The quick brown fox jumps over the lazy dog.
```

Output:
```
Entered: The quick brown fox jumps over the lazy dog.
LARGEST WORD - jumps
```

In this example, the program finds and displays the largest word "jumps" from the given sentence.

## Usage

1. Ensure you are running this code on a Linux environment or emulator that supports the syscalls used in the code.
2. Assemble the code using an appropriate assembler (e.g., NASM) and linker (e.g., LD).
3. Run the assembled binary to execute the program.
4. Follow the prompt to enter a sentence.
5. Observe the output, which displays the entered sentence and the largest word.

**Note**: Assembly language can interact with system components. Make sure you understand the code before running it, especially when it involves system calls.

---