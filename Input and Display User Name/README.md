# Input and Display User Name in Linux Assembly

This assembly program demonstrates how to interact with the user, read their input, and display it using Linux syscalls. It prompts the user to enter a name, reads the input, and then displays the entered name on the console. The provided code is intended to be assembled and executed on a Linux environment.

## Code Explanation

The assembly code performs the following steps:

1. **Prompting the User** (`_start` section):
   - Uses the `SYS_WRITE` syscall to prompt the user to enter a name.

2. **Reading User Input**:
   - Uses the `SYS_READ` syscall to read up to 5 characters of user input (a name) and store it in the `name` buffer.

3. **Displaying Entered Name**:
   - Uses the `SYS_WRITE` syscall to display the message "You have entered: ".
   - Uses the same syscall to display the entered name.

4. **Exiting the Program**:
   - Uses the `SYS_EXIT` syscall to terminate the program.

## Example

Suppose you assemble and execute the provided assembly code on a Linux environment. The program will prompt you to enter a name. After you provide the input, it will display the entered name along with the message "You have entered: ".

Example Interaction:
```
Please enter a name: John
You have entered: John
```

In this example, the program successfully interacts with the user, reads their input, and displays the entered name using the `SYS_WRITE` and `SYS_READ` syscalls.

## Usage

1. Ensure you are running this code on a Linux environment or emulator that supports the syscalls used in the code.
2. Assemble the code using an appropriate assembler (e.g., NASM) and linker (e.g., LD).
3. Run the assembled binary to execute the program.
4. Follow the prompts to enter a name.
5. Observe the program displaying the entered name.

**Note**: Assembly language can interact with system components. Make sure you understand the code before running it, especially when it involves system calls.

---