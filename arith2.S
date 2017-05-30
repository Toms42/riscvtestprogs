/*
	Test: Arithmetic instructions
	Author: Sol

	Tries out the OP and OP-IMM classes of instuctions.  Leaves a 0 in $a0 on success.
*/

	.text
	addi  t0, zero, 1 # Set t0 to 1.
	add   t0, t0, t0  # Double t0 to 2.
	xori  t1, t0, -1  # NOT t0 into t1.
	sub   t2, t0, t1  # Subtract -3 from 2 into t2.

	xori  t2, t2, 5   # Check whether correct so far.
	sltiu a0, t2, 1   # SEQZ into a0.

