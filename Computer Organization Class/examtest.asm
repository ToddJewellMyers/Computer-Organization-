	.ORIG x3000
	
START AND R0, R0, #0
LEA R2, ARRAY
AGAIN LDR R1, R2, #0 
BRz DONE
ADD R0, R0, R1
ADD R2, R2, #1
BRnzp AGAIN
DONE ST R0, RESULT 
	HALT
RESULT .BLKW 3
ARRAY .FILL x10
	.FILL x03
.FILL x12
.FILL x1C
.FILL x00
	.END