	.ORIG x3000

	;prints out entire string QUE using PUTS 
	LEA R0, QUE 
	PUTS

	;clears and loads address 
	AND R1, R1, #0
	LD R1, ADDR

	;beginning of loop to store users input
LOOP	TRAP x20
	TRAP x21
	STR R0, R1, #0
	ADD R1, R1, #1

	;checks is entered value is enter 
	LD R2, ENTER
	NOT R2, R2
	AND R2, R2, R0
	BRNP LOOP

	;loading a null in R0 and storing it 
	AND R0, R0, #0
	STR R0, R1, #0

	;printing out users input back to screen 
	LD R0, ADDR
	PUTS

 	HALT 
QUE 	.STRINGZ "Enter string to echo: "
ENTER	.Fill x0A
GETC	.Fill x20
OUT	.Fill x21
ADDR	.Fill x3100

TEST	.STRINGZ "Loop exited"
	.END
