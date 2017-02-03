# P1-2
# Student Name: Chris Turner
# Date:	2-20-15
#
#     I c o n   M a t c h
#
#
# This routine determines which of eight candidate icons matches a pattern icon.

.data
CandBase: 	.alloc 1152
PatternBase:	.alloc 144

.text
IconMatch:	addi	$1, $0, CandBase	# point to base of Candidates
		swi	584			# generate puzzle icons
	
# your code goes here
	
				
		addi	$4, $0, 144
		addi	$22, $1, 144
		addi	$23, $1, 4752		
		addi	$12, $0, 0		#multiplier for word selection
		addi	$13, $1, 432		#word increase value, and comparison value for matching patterns
		
InLoop:		addi	$22, $22, 12
		lw	$10, 0($22)
		addi	$23, $23, 12
		lw	$20, 0($23)
		bne	$10, $20, OutLoop
		beq	$22, $13, End
		beq	$0, $0, InLoop

OutLoop:	addi	$12, $12, 1		#increment answer value
		addi	$4, $4, 576		#increment starting value of candidate image
		add	$22, $4, $1		#set pointer register to the next candidate value
		addi	$13, $13, 576		#increment end register value by one full image value
		addi	$23, $1, 4752		#reset pattern image to initial value to compare
		beq	$0, $0, InLoop

End:		addi	$2, $12, 0
				

                #addi    $2, $0, 0              temp: guess the first icon
		swi	544			# submit answer and check
		jr	$31			# return to caller
