 led 	equ	p1.0
      sw0	equ	p2.0
      sw1	equ p2.1
       
START:	mov	r1,#9
 		MOV R2, #5
		mov	c,sw0
 		jnc	right
 		mov	c,sw1
 		jnc	left
		call	stop
 ret
off:	mov a,#0ffh							;모두 OFF
 		mov	led,a						;LED 1개만 사용
		call start
		ret
       
left:	mov	c,sw0				        		;왼쪽 회전
 		jnc	off
		mov a,#0feh						
lightl:	mov	led,a				 ;1회 클릭 오른쪽 1번째 칸까지 왼쪽으로 회전
		rl	a
   		call DELAY	
		DJNZ R1,lightl
		call	start
right:	mov	c,sw1							;오른쪽 회전
 		jnc	off
 		mov a,#0feh
lightr:	mov led,a			      ;1회 클릭 오른쪽 1번째 칸까지 오른쪽으로 회전
		rr	a
   		call DELAY	
		DJNZ R1,lightr
		call	start
stop:	call	delay						        ;빛 정지
		call	delay
		call	delay
		call	start
DELAY : DJNZ R2, DELAY
 ret
 sjmp	START
