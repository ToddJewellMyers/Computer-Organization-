	.ORIG x3000

	;ask user for input 
	LEA R0, ASK1
	PUTS

	; gets the startign address 
	AND R0, R0, R0
	TRAP x40
	ST R0, START

	;that prints new line 
	LD R0, ENTER
	PUTc

	;ask user for 2nd input 
	LEA R0, ASK2
	PUTS
	
	;get the end address
	AND R0, R0, R0
	TRAP x40
	ST R0, END

	;new line 	
	LD R0, ENTER
	PUTc

	;prints memory conents message
	LEA R0, MEM
	PUTS

	;new line 
	LD R0, ENTER
	PUTc

	;loop compares addresses
	LD R0, START
LOOP
	TRAP x41

	LD R0, START
	LD R1, END
	ADD R0, R0, #1
	ST R0, START
	NOT R0, R0
	ADD R1, R0, R1
	BRZ FINAL
	BR LOOP
FINAL	
	HALT
START	.FILL 0
END	.FILL 0
ASK1	.Stringz "Enter Starting memory address: "
ASK2	.Stringz "Enter ending memory address: "
MEM	.Stringz "Memory contents: "
ENTER	.FILL x0A

	.END