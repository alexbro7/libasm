section .text
	global ft_strcmp

ft_strcmp:
	MOV	rax, 0			;rax = 0;
	JMP	compar			;call compar

compar:
	MOV	al, BYTE[rdi]	;al = *(arg1);
	MOV	bl, BYTE[rsi]	;bl = *(arg2);
	CMP	al, 0
	JE	exit			;if al == 0 call exit
		CMP	bl, 0
		JE	exit		;if bl == 0 call exit
	CMP	al, bl
	JNE	exit			;if al != bl call exit
		INC	rdi			;arg1++;
		INC	rsi			;arg2++;
		JMP	compar		;call compar

exit:
	MOVZX	 rax, al	;conv 8bits>16bits
	MOVZX	rbx, bl		;conv 8bits>16bits
	SUB		rax, rbx	;rax -= rbx;
	RET					;return(rax);
