global _start

%macro PRINT
	push eax
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	pop eax
%endmacro

section .data

section .text
