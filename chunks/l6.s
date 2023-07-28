/* listing 6. Memory cells */
.data				# data segment
nm1:
	.quad 0xfedcba987654321
nm2:
	.long 0x12345678
nm3:
	.short 0xfedc
nm4:
	.byte 0x12
	.byte 0x00

.text				# text segment
.globl _start
_start:
movq nm1, %rax	# fedcba987654321 -> rax
movl nm1, %ebx	# 76543210 -> ebx
movw nm1, %cx	# 3210 -> cx
movb nm1, %dl	# 10 -> dl
movq nm2, %rsi	# 0012fedc12345678 -> rsi

#------------------------------------------------

mov $60, %rax
xor %rdi, %rdi	# return code
syscall
ret


