section.text:
	global ft_write
	extern __errno_location

ft_write:
	MOV	rax,1				;write
	SYSCALL
	CMP	rax, 0				;if (rax < 0)
	JL	error				;call error
	RET						;return(write return)

error:
	NEG		rax				;rax *= -1 (retour write negatif)
	MOV		rdi, rax		;save rax dans arg1
	CALL	__errno_location;rax = errno_location(rdi):(renvoie un pointeur sur errno dans rax)
	MOV		[rax], rdi		;converti la valeur de errno
	MOV		rax, -1			;rax = -1;
	RET						;return(rax)	
