	.ORIG x3000

	;Prints out entire string QUE using PUTS 
	LEA R0, QUE
	PUTS
	

DONE	HALT
QUE	.STRINGZ "Enter string to echo: "
ARR	.BLKW 12
	.END