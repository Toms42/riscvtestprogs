	.text
	li    sp, 0xff0

	# addi  a0, zero, 1
	li    a0, 1
	# jal   ra, print_digit
	jal   print_digit

	# addi  a0, zero, 0
	mv    a0, zero
	jal   print_digit

	li    a0, 13
	jal   print_digit

	li    a0, 0xa # '\n'
	ecall

	li    a0, 0xdeadbeef # generates multiple instructions (lui and addi)
	jal   print_number
	.long 0x0

print_number:
	addi  sp, sp, -16
	sw    s0, 0(sp)
	sw    s1, 4(sp)
	sw    s2, 8(sp)
	sw    ra, 12(sp)

	li    s1, 8
	mv    s2, a0

	li    s0, 0 # or mv s0, zero
	ret
print_number_loop_:
	srl   a0, s2, 28
	jal   print_digit
	slli  s2, s2, 4
	addi  s0, s0, 1
	blt   s0, s1, print_number_loop_

	lw    s0, 0(sp)
	lw    s1, 4(sp)
	lw    s2, 8(sp)
	lw    ra, 12(sp)
	addi  sp, sp, 16
	ret

print_digit:
	li    t0, 0xa
	bge   a0, t0, print_digit_letter_
	addi  a0, a0, 0x30 # start from '0'
	# jal   zero, print_digit_endif_
	j     print_digit_endif_
print_digit_letter_:
	addi  a0, a0, 0x61 - 10
print_digit_endif_:

	ecall
	# jalr  zero, ra
	ret
