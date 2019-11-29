RESET	EQU	P2.0
	MOV R1, #00H
	MOV R2, #00H
	MOV R4, #00H
	MOV R6, #00H	
JMP	START

START:		MOV R0, #100
		MOV DPTR,#300H
		LCALL	COUNT1
COUNT1:	MOV	P1,#11111111B        ;10의 자리//1의 자리 값이 들어오지 않게 설정
		MOV	C,RESET	
		JNC	INT
		SETB P3.3	
		MOV A, R1		
		MOVC A,@A+DPTR
		MOV P1, A
		LCALL	COUNT
	   RET
COUNT:	MOV	P1,#11111111B               ;1의 자리//10의 자리 값이 들어오지 않게 설정
		MOV	C,RESET	
		JNC	INT		
		CLR P3.3
		INC	R2			   
	  	MOV A,R2	
	  	MOVC	A,@A+DPTR
	  	MOV P1, A
	  	CJNE  A,#10010000B,COUNT1
	  	INC	R1		      ;1의 자리[R2]가 9까지 증가하고 10의 자리 증가
		MOV	R2,#0FFH		     ;R2가 COUNT의 INC R2때문에 –1로 설정
	  	JMP	COUNT1

INT:SETB P3.3                                               ;초기화문
	MOV R1, #00H
	MOV R2, #0FFH		        ;R2가 COUNT에서 증가되기 때문에 –1로 설정
	MOV R4, #00H
	MOV R6, #00H
	JMP start
ORG	300H	
TABLE:DB 11000000B,11111001B,10100100B,10110000B,10011001B,10010010B,10000010B,11011000B,10000000B,10010000B
END