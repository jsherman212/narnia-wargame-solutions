; x86 assembly to print hello to stdout

section .text:
    global _start

_start:
    push 4                  ; push 32 bit write syscall number onto stack
    pop eax                 ; pop 4 from the stack and put it into eax
    xor ebx, ebx            ; clear ebx for stdout (0)
    xor esi, esi            ; clear esi for NULL byte
    push esi                ; push NULL byte
    push 0x0a6f6c6c         ; push "\noll"
    push 0x65680101         ; push "eh" and two SOH chars to prevent NULL bytes
    mov ecx, esp            ; put the address of our string into ecx
    push 12                 ; push the length of our string onto the stack
    pop edx                 ; pop the length of our string and put it into edx
    int 0x80                ; perform write syscall
