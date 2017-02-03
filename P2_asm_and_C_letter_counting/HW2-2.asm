# HW2-2
# Student Name: Chris Turner
# Date: 1-24-2015
#
# 			Letter Histogram
#
# This program computes the letter histogram of the characters encoded as
# packed ascii codes, starting at label Text.  The histogram contains the
# number of times the ascii code for each letter of the alphabet
# (upper/lower case) occurs in the Text.  The histogram is computed and
# stored beginning at the label Letters w/ the frequency count for the
# letter 'A', then 'B', etc.
#

.data
Letters: .word   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

# These are the ascii codes for the first 256 characters in address.txt,
# packed into 64 four-byte (32-bit) words.  To view the ascii codes more
# easily, select the hexadecimal display base under Options in MiSaSiM.
Text:	.word	543516756, 1953785159, 1969386361, 1092642674, 1701995620,  168457075, 1310734641, 1835365999
	.word	 544367970,  859191345, 1866861066, 1668510325,  543519343,  543452769, 1702258035, 1702436974
	.word	 544436833,  544171873,  544372079, 1752457574,  544436837, 1970238050,  544499815, 1953656678
	.word	1965042792,  544108400, 1936287860, 1852793632, 1701734772,  170685550, 1701716065, 1634607223
	.word	1852795252, 1868767276, 1768252270,  543450486, 1814064745, 1919246953, 1629518196, 1679844462
	.word	1667851365, 1684370529,  544175136,  543516788, 1886351984, 1953067887,  544108393, 1952540788
	.word	1818305056, 1701644908, 1918967918, 1919098981, 1702125925, 1902452836,  778854773, 1309280802
	.word	1998616431, 1918967909, 1852121189, 1701273959, 1852383332, 1730175264, 1952540018, 1986618144
End:	.word	0

.text
		# write your code here...
		addi $5, $0, Text 	#register 5 is the original address for text
		addi $6, $0, Letters 	#register 6 is original letter array
		lw $15, 0($6) 		#reg 15 holds added arrays
		addi $10, $0, 65 	#reg 10 is current letter being checked for in ascii
		addi $13, $0, 97	#reg 13 holds lower case of same letter
		
		addi $20, $0, 0 	#reg 20 is count value
		addi $21, $0, 64 	#reg 21 loop exit value for word crunch
		addi $22, $0, 4		#exit value for next byte
		addi $7, $5, 0		#address value to change in first loop
		lbu $11, 0($7) 		#reg 11 is the word to be compared against changes in loop
		addi $23, $0, 90	#end of alphabet value
		
loop:		addi $20, $20, 1 	#add 1 to current count
		bne $13, $11, 1 	#dont add if not equal
		addi $15, $15, 1
		bne $10, $11, 1 	#dont add if not equal
		addi $15, $15, 1
		lb $11, 1($7) 
		bne $13, $11, 1 	#dont add if not equal
		addi $15, $15, 1
		bne $10, $11, 1 	#dont add if not equal
		addi $15, $15, 1
		lb $11, 2($7) 
		bne $13, $11, 1 	#dont add if not equal
		addi $15, $15, 1
		bne $10, $11, 1 	#dont add if not equal
		addi $15, $15, 1
		lb $11, 3($7) 
		bne $13, $11, 1 	#dont add if not equal
		addi $15, $15, 1
		bne $10, $11, 1 	#dont add if not equal
		addi $15, $15, 1
		addi $7, $7, 4 		#next word letter to be checked
		lbu $11, 0($7)		#back to first byte in word
		bne $20, $21, loop 	#jump back to loop
outloop:	sw $15, 0($6)
		beq $10, $23, done	#branch to done
		addi $10, $10, 1
		addi $13, $13, 1
		addi $7, $5, 0		#reset reg 7
		lbu $11, 0($7)		#back to first byte in word
		addi $20, $0, 0		#reset count
		addi $6, $6, 4		#next word value in letter array
		lw $15, 0($6)
		beq $0, $0, loop
		
		
		
		
	

done:	jr      $31			# return to operating system
	

