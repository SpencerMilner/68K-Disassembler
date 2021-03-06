*****************************
*
* demo_test.X68
*
* Created 06/02/2016
*
* Test program for CSS 422 Disassembler Project Demo
*
*****************************

start		EQU	$00007000	* ORG and END address

* ORG the program so that it straddles the address boundary $00007FFF to $00008000

		ORG	start

* NOP and similar instructions. Should clearly differentiate NOP and RTS from others.
                
		*NOP			*Required
		*RTS			*Required


* This is a group of ADD instructions
add_start	
                ROL.B   D2,D3
                ROL.W   D3,D4
                ROL.L   D4,D5
                ROR.B   D2,D3
                ROR.W   D3,D4
                ROR.L   D4,D5
                ASL.B   D1,D3
                ASL.W   D2,D4
                ASL.L   D3,D5
                ASR.B   D1,D3
                ASR.W   D2,D4
                ASR.L   D3,D5
                LSL.B   #5,D3
                LSL.W   #4,D4
                LSL.L   #3,D5
                LSR.B   #5,D3
                LSR.W   #4,D4
                LSR.L   #3,D5
               
                
                *JSR	(A3)		* Address register indirect
		*BCC	clear		
		*BGT	compares		
		*BLE	multiply
                *CMP.B	(A3),D5
		*CMP.L	$ABC0FF00,D2
                *DIVU	(A3)+,D5
           *     MOVE.B  #$45,D2
                *MOVE.W  D1,D2
                *MOVE.L  D1,D2
                *MOVEA.W D1,A5
                *MOVEA.L D1,A5
                
               * MOVEM.W     D2, -(SP)
                *MOVEM.L     D2, -(SP)
                *MOVEM.W     (SP)+,D2
                *MOVEM.L     (SP)+,D2
*
*                ADD.W   D1,D2
*                ADD.B   D1,D2
*                ADD.L   D1,D2
*                ADDI.W	#$4E71,D1
*		ADDQ.L	#07,D7		
*		ADDA.W	(A6)+,A3
*		ADDA.L	#$3000AAAA,A6
*		ADDI.L	#$D50000AA,D5
*		ADDI.W	#$5555,D6
*		ADDI.B	#$FE,D0
*                *SUB.W   D1,D2
*                *AND.L	$8000A000,D3
*                *MULS	D0,D3
*
** Move instructions
*moves		MOVE.B	D0,D1
*		MOVE.W	A6,$F30045BB
*		MOVE.L	D0,D0
*		MOVE.L	D7,(A6)+
*		MOVE.W	#$FFD0,(A3)
*		MOVE.L	$C00022AA,$3000A0F8
*		MOVE.L	A0,-(A5)
*		MOVEA.W	(A6),A0
*		MOVEM.W	A0/A1/A2/D5/D6/D7,-(SP)
*		MOVEM.L	(A0)+,D0/D1/D2/A4/A3/A0/A1
*		MOVEQ	#1,D2
*		
** Divide and multiple optional instructions
**		ANDI.B	#$01,$4568
*ands		AND.L	$8000A000,D3
*shifts		LSL.B	D0,D0
*		LSR.W	#4,D0
*		LSL.W	(A2)+
*		ASR.B	D6,D7
*		ASL.B   D5,D7
*rolls		ROL.L	D2,D3
*		ROR.L	#4,D6
*
*clear		CLR.B	D4
*load_addr	LEA	$DC00FF00,A2
*		LEA	(A5),A4
**		LEA	(ands,PC),A3
**		LEA	-$20(A2,D7),A2
*
*compares	CMP.B	(A3),D5
*		CMP.L	$ABC0FF00,D2
*		CMPA.W	D2,A4
** Branches	
*		
*
** Jump and branch instructions
*
*jmplabel        JSR	(A3)		* Address register indirect
*		BCC	clear		
*		BGT	compares		
*		BLE	multiply
*		
**These are not required instructions
*multiply	MULS	D0,D3		*Optional instruction
*		MULS	(A6),D0		*Optional instruction
*		MULS	#$4567,D1	*Optional instruction
*		DIVU	(A3)+,D5	*Optional instruction
*		NOP
*		NOP
*		SUB.L	D2,D4
*		SUB.L	(A3),D7
	

		END	start

































*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
