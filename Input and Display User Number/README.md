# Input and Display User Number in Linux Assembly

This assembly program demonstrates how to interact with the user, read their input, and display it using Linux syscalls. It prompts the user to enter a number, reads the input, and then displays the entered number on the console. The provided code is intended to be assembled and executed on a Linux environment.

## source code 
```assembly
section .data                           ; Data segment
   userMsg db 'Please enter a number: ' ; Ask the user to enter a number
   lenUserMsg equ $-userMsg             ; The length of the message
   dispMsg db 'You have entered: '
   lenDispMsg equ $-dispMsg                 

section .bss           ; Uninitialized data
   num resb 5          ; Reserve space for the entered number (up to 5 bytes)
	
section .text          ; Code Segment
   global _start
	
_start:                ; Program entry point
   ; Display user prompt
   mov eax, 4
   mov ebx, 1
   mov ecx, userMsg
   mov edx, lenUserMsg
   int 80h              ; Invoke syscall to write message

   ; Read and store the user input
   mov eax, 3
   mov ebx, 2
   mov ecx, num  
   mov edx, 5          ; Read up to 5 bytes of numeric input
   int 80h              ; Invoke syscall to read input
	
   ; Output the message 'You have entered: '
   mov eax, 4
   mov ebx, 1
   mov ecx, dispMsg
   mov edx, lenDispMsg
   int 80h              ; Invoke syscall to write message

   ; Output the entered number
   mov eax, 4
   mov ebx, 1
   mov ecx, num
   mov edx, 5
   int 80h              ; Invoke syscall to write entered number
    
   ; Exit the program
   mov eax, 1
   mov ebx, 0
   int 80h              ; Invoke syscall to exit
```

## Code Explanation

The assembly code performs the following steps:

1. **Prompting the User** (`_start` section):
   - Uses the `SYS_WRITE` syscall to prompt the user to enter a number.

2. **Reading User Input**:
   - Uses the `SYS_READ` syscall to read up to 5 characters of user input (a number) and store it in the `num` buffer.

3. **Displaying Entered Number**:
   - Uses the `SYS_WRITE` syscall to display the message "You have entered: ".
   - Uses the same syscall to display the entered number.

4. **Exiting the Program**:
   - Uses the `SYS_EXIT` syscall to terminate the program.

## Example

Suppose you assemble and execute the provided assembly code on a Linux environment. The program will prompt you to enter a number. After you provide the input, it will display the entered number along with the message "You have entered: ".

Example Interaction:
```
Please enter a number: 42
You have entered: 42
```

In this example, the program successfully interacts with the user, reads their input, and displays the entered number using the `SYS_WRITE` and `SYS_READ` syscalls.

## Usage

1. Ensure you are running this code on a Linux environment or emulator that supports the syscalls used in the code.
2. Assemble the code using an appropriate assembler (e.g., NASM) and linker (e.g., LD).
3. Run the assembled binary to execute the program.
4. Follow the prompts to enter a number.
5. Observe the program displaying the entered number.

**Note**: Assembly language can interact with system components. Make sure you understand the code before running it, especially when it involves system calls.

---