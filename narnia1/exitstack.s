; An example of setting up parameters using the stack

section .text:
    global _start

_start:
    push 1          ; push 1 onto the stack
    pop rax         ; pop 1 from the stack into rax, exit syscall is 1
    push 4          ; push 4 onto the stack
    pop rbx         ; pop 4 from the stack into rbx, exit code
    int 0x80        ; perform syscall
