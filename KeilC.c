#include <reg51.h>
	sbit	SW_0=P2^0;				//SW0_RIGHTPASS 설정에 필요		
	sbit	SW_1=P2^1;				//SW1_LEFTPASS	설정에 필요
	sbit	SW_2=P2^2;				//SW2_STOP	설정에 필요
void main(){
	int	i,n;
	unsigned char led;				
	char	left=0x01;				//가장 왼쪽 LED ON
	char	right=0x80				//가장 오른쪽 LED ON	
	
while(1){
		start:
		if(SW_0==0)						//SW0_RIGHTPASS
			{
				led=0xfe;				//가장 오른쪽 LED ON
				for(i=0;i<16;i++)
				{
					led<<=1; 			//led=led<<1 이동
					led^=left;  			//xor
					P1=led;}				//출력
				P1=0x7f;					//완료후 DOT표시
				goto	start;
			}
			else	if(SW_1==0)				//SW1_LEFTPASS
			{
				led=0x7f;				//가장 왼쪽 LED ON
				for(i=0;i<16;i++)
				{
					led>>=1; 			//led=led>>1 이동
					led^=right; 			//xor
					P1=led;}				//출력
				P1=0x7f;					//완료후 DOT표시
				goto	start;
			}
			else						//SW2_STOP
				{	if(SW_0==0)			//누름[SW0=0] START로
					goto	start;
					if(SW_1==0)			//누름[SW1=0] START로
					goto	start;
			}
		}
	}
