#!/bin/sh
#	Compile *.asm files. Takes 1 arg

suffix=.asm
#if [ $1 < $suffix ] ; then
#	echo Yes
#else
#	echo No
#fi

if [ $# -lt 1 ] ; then
	echo No args. Input *.asm file to compile.
else
	if [ -f $1 ] ; then
		`nasm -f elf $1` 
		file=${1%'.asm'}
		o_file=${file}.o
		`ld -m elf_i386  $o_file -o $file`
	else
		echo No file from arg.
	fi
fi
