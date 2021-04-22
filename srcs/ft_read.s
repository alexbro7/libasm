global	ft_read
extern	__errno_location

ft_read:
	MOV		rax, 0		;prepar read
	SYSCALL				;call read
	CMP		rax, 0		;if (rax < 0)
	JL		error		;	call error
		RET				;return(rax(read return))

error:
	NEG		rax			;rax *= -1 (retour read negatif)
	MOV		rdi, rax	;save rax dans arg1
	CALL		__errno_location	; rax = errno_location(rdi):(renvoie un pointeur sur errno dans rax)
	MOV		[rax], rdi	;converti la valeur de errno
	MOV		rax, -1		;rax = -1
	RET					;return(rax)
