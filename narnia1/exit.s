section .text
    global _start

_start:
    xor eax, eax
    mov al, 1		; syscall 1 for exit
    mov bl, 4		; exit code 4
    int 0x80		; perform syscall
