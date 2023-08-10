# Input and Display User Name in Linux Assembly

This assembly program demonstrates how to interact with the user, read their input, and display it using Linux syscalls. It prompts the user to enter a name, reads the input, and then displays the entered name on the console. The provided code is intended to be assembled and executed on a Linux environment.

## source code 
```assembly
section .data         ; Data segment
   userMsg db 'Please enter a name: ' ; Ask the user to enter a name
   lenUserMsg equ $-userMsg             ; The length of the message
   dispMsg db 'You have entered: '
   lenDispMsg equ $-dispMsg

section .bss          ; Uninitialized data
   name resb 5        ; Reserve 5 bytes for the name

section .text         ; Code Segment
   global _start      ; Declare entry point

_start:               ; Main program
   ; Display user prompt
   mov eax, 4         ; sys_write syscall number
   mov ebx, 1         ; file descriptor (stdout)
   mov ecx, userMsg
   mov edx, lenUserMsg
   int 80h

   ; Read and store the user input
   mov eax, 3         ; sys_read syscall number
   mov ebx, 2         ; file descriptor (stdin)
   mov ecx, name
   mov edx, 5         ; Read up to 5 bytes
   int 80h
	
   ; Output the message 'You have entered: '
   mov eax, 4         ; sys_write syscall number
   mov ebx, 1         ; file descriptor (stdout)
   mov ecx, dispMsg
   mov edx, lenDispMsg
   int 80h  

   ; Output the entered name
   mov eax, 4         ; sys_write syscall number
   mov ebx, 1         ; file descriptor (stdout)
   mov ecx, name
   mov edx, 5         ; Output up to 5 bytes
   int 80h  
    
   ; Exit the program
   mov eax, 1         ; sys_exit syscall number
   mov ebx, 0         ; Exit code 0
   int 80h
```

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