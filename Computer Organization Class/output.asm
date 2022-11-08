		.ORIG x5000

		;stores the return address and prints x
		ST R7, SAVER7
		ST R0, SAVER0
		LEA R0, PRINTX
		PUTS

		; right shift loop
		LD R0, SAVER0
	
RIGHTLOOP	ADD R0, R0, #-16
		BRn END
		ADD R1, R1, #1
		BR RIGHTLOOP	
END

		; ASCII conversion 
		ST R1, SHIFT
		LD R0, SHIFT
		LD R1, ASCII
		ADD R0, R1, R0
		OUT
		
		LD R7, SAVER7
		RET

PRINTX .STRINGZ "x"
SAVER7 .BLKW 1
SAVER0 .BLKW 1
SHIFT  .BLKW 1
ASCII  .FILL x30
.END