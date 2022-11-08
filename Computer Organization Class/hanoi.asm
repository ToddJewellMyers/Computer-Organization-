		.ORIG x3000

		
		; prints the name of the game 
MAIN 		LD R6, STACKBASE

		LEA R0, QUE
		PUTS

		LD R0, ENTER
		PUTc

		; prints the question how many disks 
		LEA R0, DISKS
		PUTS

		;ask user for how many disks 
		TRAP X20
		TRAP X21
		AND R1, R1, #0
		ADD R1, R0, R1

		LD R0, ENTER
		PUTc

		; Prints out first half of Instructions 
		LEA R0, GUIDE1
		PUTS

		AND R0, R0, #0
		ADD R0, R1, R0

		; Prints out the other half of the post to post 3 text 
		PUTc
		LEA R0, GUIDE2
		PUTS
		LD R0, ENTER
		PUTc

		;AND R1, R1, #0
		;ADD R6, R6, #-1 
		;STR R1, R6, #0  
		;ADD R1, R1, #1
		;ADD R6, R6, #-1
		;STR R1, R6, #0 
		;JSR MOVEDISK

		HALT

STACKBASE 	.FILL X5000
QUE 		.STRINGZ " --Towers of Hanoi-- "
DISKS 		.STRINGZ " How many disks? "
GUIDE1 		.STRINGZ " Instructions to move "
GUIDE2 		.STRINGZ " disks from post 1 to post 3: "
GUIDE3 		.STRINGZ " Move disk "
GUIDE4		.STRINGZ " From point "
GUIDE5		.STRINGZ " to point "
ENTER 		.FILL X0A


MOVEDISK 	ADD R6, R6, #-1
		ADD R6, R6, #-1
		STR R7, R6, #0
		ADD R6, R6, #-1
		STR R5, R6, #0
		ADD R5, R6, #-1
		ADD R6, R6, #-1
		AND R0, R0, #0 
		LDR R0, R5, #-3
		ADD R0, R0, #-1
		BRp MOVE

		LEA R0, GUIDE3
		TRAP x22
		.BLKW 1
		LEA R0, GUIDE4
		TRAP x22
		LDR R0, R5, #5
		TRAP x21
		LEA  R0, GUIDE5 
		TRAP x22
		LDR R0, R5, #6
		TRAP x21

		LD R0, ENTER
		PUTc

MOVE		ADD R6, R6, #-1
		LDR R0, R5, #6
		STR R0, R6, #0
		ADD R6, R6, #-1
		LDR R0, R5, #7
		STR R0, R6, #0
		ADD R6, R6, #-1
		LDR R0, R5, #4
		ADD R0, R0, #-1
		STR R0, R6, #0
		JSR MOVEDISK
		LEA R0, GUIDE3
		TRAP x22
		LDR R0, R5, #-4
		TRAP x21




		
		.END

