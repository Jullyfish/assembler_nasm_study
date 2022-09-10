global _start

%macro	P_CHAR	1	;print char
	push eax
	mov eax, 4	;call 'write'
	mov ebx, 1	;stdout
	mov ecx, %1	;parametr symbol
	mov edx, 1	;1 symbol
	int 80h		;linux syscall
	pop eax
%endmacro

%macro	PRINT	2	;print line
	push eax
	mov eax, 4	;call 'write'
	mov ebx, 1	;stdout
	mov ecx, %1	;parametr symbol
	mov edx, %2	;length of message
	int 80h		;linux syscall
	pop eax
%endmacro

;%macro R_CHAR	1	;read char
;	push eax
;	mov eax, 3	;call 'read'
;	mov ebx 
;%endmacro

%macro 	EXIT	 0	;
	mov eax, 1	;call 'exit'
	mov ebx, 0	;halt(0)
	int 80h		;linux syscall
%endmacro

section .data
n_sym 	db 0xA

section .bss
msg	resd 1

section .text
_start	mov [msg], dword 'ABC'
	PRINT msg, 4096 
	P_CHAR n_sym
	EXIT	
