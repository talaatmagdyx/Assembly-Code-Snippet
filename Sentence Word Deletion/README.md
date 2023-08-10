# Assembly Program: Sentence Word Deletion

This assembly program reads a sentence and a word from the user, then removes the specified word from the sentence and displays the modified sentence. It utilizes Linux syscalls for I/O operations and program termination.

## Code Explanation

The provided assembly code performs the following steps:

1. **Input Reading** (`input`):
   - Uses syscall 3 (`sys_read`) to read input from the user.

2. **Output Printing** (`output`):
   - Utilizes syscall 4 (`sys_write`) to print output to the user.

3. **Main Procedure** (`_start`):
   - Reads the input sentence and the word to be deleted.
   - Iterates through the sentence and identifies occurrences of the word to be deleted.
   - Deletes the word from the sentence and stores the modified sentence.
   - Prints the modified sentence.

4. **Word Deletion** (`deleteword`):
   - Deletes the specified word from the sentence.

## Example

Suppose you run the program and provide the following inputs:

```
ENTER THE SENTENCE : This is an example sentence.
ENTER THE WORD TO BE DELETED : example
```

Output:
```
This is an sentence.
```

In this example, the program reads the input sentence "This is an example sentence." and the word "example" to be deleted. It then displays the modified sentence "This is an sentence." with the specified word removed.

## Usage

1. Ensure you are running this code on a Linux environment or emulator that supports the syscalls used in the code.
2. Assemble the code using an appropriate assembler (e.g., NASM) and linker (e.g., LD).
3. Run the assembled binary to execute the program.
4. Follow the prompts to enter a sentence and the word to be deleted.
5. Observe the output, which displays the modified sentence without the deleted word.

**Note**: Assembly language can interact with system components. Make sure you understand the code before running it, especially when it involves system calls.
