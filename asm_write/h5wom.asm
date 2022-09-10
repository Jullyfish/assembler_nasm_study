global _start

%macro PRINT 2
	push eax
	mov	eax, 4	; call "write"
	mov	ebx, 1	; stdout
	mov 	ecx, %1 ; message, type "string"
	mov	edx, %2	; lenght of message
	int 80h		; linux syscall
	pop eax 
%endmacro

;%macro PNUMBER 1
;	mov eax, %1
;%endmacro

section .data
nstr	db 0xA 

section .bss
array	resb 256
msg	resd 1		; resd 1 = 4 bytes = 4096 bits

section .text
_start	mov eax, 0 
again:	
	mov [msg], dword 'ABC' 
	PRINT msg, 4096	;it just works 
	PRINT nstr, 1
	inc eax
	cmp eax, 5
	jl again

;+call exit
	mov eax, 1	; call "_exit"
	mov ebx, 0	; halt(0)
	int 	80h
;-call exit
