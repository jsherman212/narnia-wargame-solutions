; Print "hello" to the screen using the stack for some arguments.

section .text:
    global _start

_start:
    push 1                  ; push 64 bit write syscall number onto stack
    pop rax                 ; pop 4 from the stack and put it into rax
    xor rdi, rdi            ; clear rdi for stdout (0)
    xor rdx, rdx            ; clear rdx for NULL byte
    push rdx                ; push NULL byte
    push 0x0a6f6c6c         ; push "\noll"
    push 0x65680101         ; push "eh" and two SOH chars to prevent NULL bytes
    mov rsi, rsp            ; put the address of our string into rsi
    push 12                 ; push the length of our string onto the stack
    pop rdx                 ; pop the length of our string and put it into rdx
    syscall                 ; perform write syscall
