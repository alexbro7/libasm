section .text
	global	ft_strlen

ft_strlen:
	MOV	rax, 0				; rax = 0;
	CMP	rdi, 0				; $ = (arg1 == 0)?
	JE	done				; if $ is equal call done
		JMP	compare			; call compare

increment:
	INC	rax					; rax++;

compare:
	CMP	BYTE [rdi + rax],0	; $ = (arg1[rax] == 0)?
	JNE	increment			; if $ is unequal call increment

done:
	RET						; return (rax);
