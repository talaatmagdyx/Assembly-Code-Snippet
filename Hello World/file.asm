section     .text

extern printf
global      _start                              ; Entry point for the program

_start:                                         ; Start of the program
	
    mov     edx,len                             ; Calculate message length
    mov     ecx,msg                             ; Load address of message
    mov     ebx,1                               ; File descriptor (stdout)
    mov     eax,4                               ; System call number (sys_write)
    int     0x80                                ; Call kernel to display message

    mov     eax,1                               ; System call number (sys_exit)
    int     0x80                                ; Call kernel to exit program

section     .data

msg     db  'Hello World!',10                    ; Our message with a newline
len     equ $ - msg                             ; Calculate length of message
