	.ORIG x3000

	;prints out entire string QUE using PUTS
	LEA R0, QUE
	PUTS

	;clears and loads address 
	AND R1, R1, #0
	LD R1, ADDR

	;beginning of loop to store users input 
LOOP	TRAP X20
	TRAP x21

	;checks if value is enter 
	LD R3, ENTER2
	NOT R3, R3
	AND R3, R3, R0
	BRZ SKIP

	;gets the second input 
	ADD R2, R0, #0
	TRAP x20
	TRAP x21
	
	;checks if the second value is enter
	LD R3, ENTER2
	NOT R3, R3
	AND R3, R3, R0
	BRZ SKIP
	
	;bit shift loop that creates the pack string 
	AND R5, R5, #0
	LD R5, EIGHT
SLOOP	ADD R0, R0, R0
	ADD R5, R5, #-1
	BRNP SLOOP
	
	;stores the value 
	ADD R0, R0, R2
	STR R0, R1, #0
	ADD R1, R1, #1

	;checks is entered value is enter 
	LD R2, ENTER
	NOT R2, R2
	AND R2, R2, R0
	BRNP LOOP

	;loading a null in R0 and storing it 
SKIP	AND R0, R0, #0
	STR R0, R1, #0

	;printing out users input back to screen 
	LD R0, ADDR
	PUTSP

	HALT
QUE 	.STRINGZ "Enter string to echo: "
ENTER2	.Fill x0A
ENTER	.Fill x0A0A
EIGHT 	.Fill x08
GETC	.Fill x20
OUT	.Fill x21
ADDR	.Fill x3100
	.END