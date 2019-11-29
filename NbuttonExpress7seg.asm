sw0	equ	p2.0
sw1	equ	p2.1
sw2	equ	p2.2
sw3	equ	p2.3
sw4	equ	p2.4
sw5	equ	p2.5
sw6	equ	p2.6
sw7	equ	p2.7
START:	SETB P3.4
	MOV A,#0
	MOV R1, #100
	N0:	JB	SW0,N1					;SW값 받기
		INC	A					;SW눌린 경우 A 증가
	N1:	JB	SW1,N2
		INC	A
	N2:	JB	SW2,N3
		INC	A
	N3:	JB	SW3,N4
		INC	A
	N4:	JB	SW4,N5
		INC	A
	N5:	JB	SW5,N6
		INC	A
	N6:	JB	SW6,N7
		INC	A
	N7:	JB	SW7,CMP
		INC	A

	CMP:CJNE A,#0,NN1					;눌린 SW 개수[A] 비교하기
		SJMP	ZE
		NN1:CJNE A,#1,NN2				
			SJMP	on			       ;눌린 SW 개수[A]=1이면 1출력
		NN2:CJNE A,#2,NN3
			SJMP	tw
		NN3:CJNE A,#3,NN4
			SJMP	th
		NN4:CJNE A,#4,NN5
			SJMP	fo
		NN5:CJNE A,#5,NN6
			SJMP	fi
		NN6:CJNE A,#6,NN7
			SJMP	si
		NN7:CJNE A,#7,NN8
			SJMP	se
		NN8:CJNE A,#8,CMP
			SJMP	ei

ze:	MOV P1, #10000000B			   ;눌린 SW 개수[A]=0이면 7세그먼트에 0출력
	CALL delay
	JMP	start
on:	MOV P1, #11111001B	 
	CALL delay
	JMP	start
tw:	MOV P1, #10100100B	
	JMP	start
th:	MOV P1, #10110000B	
	CALL delay
	JMP	start
fo:	MOV P1, #10011001B	
	CALL delay
	JMP	start
fi:	MOV P1, #10010010B  
	CALL delay
	JMP	start	
si:	MOV P1, #10000010B	
	CALL delay
	JMP	start
se:	MOV P1, #11011000B	
	CALL delay
	JMP	start
ei:	MOV P1, #10000000B	
	CALL delay
	JMP start	

delay: DJNZ R1, DELAY		                        ;7세그먼트 출력 관찰을 위해 DELAY
      RET
