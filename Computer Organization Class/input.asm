	.ORIG x4000
	
	;storing the return address and printing x 
	ST R7, SAVER7
	LEA R0, PRINTX
	PUTS
	
	;loop that geta character and determnes wether 0-9 A-f 
	LD R5, FOUR
LOOP	TRAP x20
	TRAP x21
	LD R1, ASCII1
	ADD R0, R1, R0
	AND R1, R1, #0
	ADD R1, R1, #10
	NOT R2, R1
	ADD R3, R2, R0
	BRN LSTHAN
	BRP GRTTHAN
	;for 0-9
LSTHAN	BRNZP END

	;for A-F
GRTTHAN	LD R1, ASCII2
	ADD R0, R1, R0
	BRNZP END

	;bit shift left and determines if more characters need added 
END	ADD R5, R5, #-1
	BRZ FINAL
	ADD R4, R4, R0
	ADD R4, R4, R4
	ADD R4, R4, R4
	ADD R4, R4, R4
	ADD R4, R4, R4
	BR LOOP
	
	;sotres the final hex value then exits trap 
FINAL	ADD R4, R4, R0
	AND R0, R0, #0
	ADD R0, R0, R4
	LD R7, SAVER7
	RET
SAVER7	.BLKW 1
PRINTX	.STRINGZ "x"
ASCII1	.FILL x-30
ASCII2	.FILL x-7
FOUR	.FILL x04
	.END