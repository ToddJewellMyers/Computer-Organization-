	.ORIG x3000


	; primts prompt 
	LEA R0, Prompt 
	PUTS 

	;Read input and store in result 
	TRAP x40 
	ST R0, Result 

	HALT 

	Result .FILL 0 
	Prompt .Stringz "Enter 4 hex digits:" 

	.END 