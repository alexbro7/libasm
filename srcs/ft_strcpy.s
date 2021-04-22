section .text
	global ft_strcpy;ft_strcpy(char* rdi, char *rsi) = rax

ft_strcpy:
	MOV	rcx, 0					;rcx = 0;
	MOV	rax, 0					;rax = 0;
	JMP	compare
			RET

copy:
	MOV	al, byte[rsi + rcx]		;al = rsi[rcx];
	MOV	byte[rdi + rcx], al		;rdi[rcx] = al;
	INC	rcx;

compare:
		CMP	byte[rsi + rcx], 0	;rsi[rcx] == 0?
		JNE	copy				;if != 0 call copy
	MOV	byte[rdi + rcx], 0		;rdi[rcx] = 0;
	MOV rax, rdi				;rax = rdi;
	RET

