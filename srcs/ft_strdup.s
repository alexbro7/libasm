section .text:
	global ft_strdup
	extern malloc
		extern ft_strlen
		extern ft_strcpy

ft_strdup:
	CMP	rdi, 0				;if (arg1 == 0)
	JE	error				;return
	CALL	ft_strlen		;rax = ft_strlen(arg1)
		PUSH	rdi			;save arg1(str)
		MOV	rdi, rax		;arg1 = len(arg1)
		INC	rdi				;arg1++
		CALL	malloc		;rax = malloc(len(arg1)+1)
		MOV	rdi, rax		;arg1 = rax;
		POP	rsi				;arg2 = str
		CALL	ft_strcpy	;rax = ft_strcpy(rax, str)
		RET

error:
	MOV	rax, 0				;rax = 0;
	RET						;return (rax);	
