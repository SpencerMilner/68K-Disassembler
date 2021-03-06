*-----------------------------------------------------------
* Title      : Main Driver Program
* Written by : Arsany Azmy, Connor McGwire
* Date       :
* Description:
*-----------------------------------------------------------
CR      EQU     $0D
LF      EQU     $0A


*** Common strings for printing
pr_space    DC.B    ' ',0
pr_space2   DC.B    '  ',0
pr_space3   DC.B    '   ',0
pr_space4   DC.B    '    ',0
pr_space5   DC.B    '     ',0
pr_comma    DC.B    ',',0
pr_BYTE     DC.B    '.B',0
pr_WORD     DC.B    '.W',0
pr_LONG     DC.B    '.L',0
pr_hash     DC.B    '#',0
pr_hextag   DC.B    '#$',0
pr_hyphen   DC.B    '-',0
pr_slash    DC.B    '/',0


** Command strings constants
pr_NOP      DC.B    'NOP',0
pr_MOVE     DC.B    'MOVE',0
pr_MOVEA    DC.B    'MOVEA',0
pr_MOVEM    DC.B    'MOVEM',0
pr_ADDA     DC.B    'ADDA',0
pr_MULS     DC.B    'MULS',0
pr_CLR      DC.B    'CLR',0
pr_RTS      DC.B    'RTS',0
pr_CMP      DC.B    'CMP',0
pr_JSR      DC.B    'JSR',0
pr_AND      DC.B    'AND',0
pr_OR       DC.B    'OR',0
pr_LEA      DC.B    'LEA',0
pr_MOVEQ    DC.B    'MOVEQ',0
pr_ADD      DC.B    'ADD',0
pr_ADDI     DC.B    'ADDI',0
pr_ADDQ     DC.B    'ADDQ',0
pr_SUB      DC.B    'SUB',0
pr_DIVU     DC.B    'DIVU',0

pr_reg      DC.B    'D',0

pr_SHIFT_RO   DC.B  'RO',0
pr_SHIFT_AS   DC.B  'AS',0
pr_SHIFT_LS   DC.B  'LS',0
pr_SHIFT_L    DC.B  'L',0
pr_SHIFT_R    DC.B  'R',0

pr_ERROR    DC.B    'ERROR',0

pr_BCC_CC   DC.B    'BCC',0
pr_BCC_CS   DC.B    'BCS',0
pr_BCC_EQ   DC.B    'BEQ',0
pr_BCC_GE   DC.B    'BGE',0
pr_BCC_GT   DC.B    'BGT',0
pr_BCC_HI   DC.B    'BHI',0
pr_BCC_LE   DC.B    'BLE',0
pr_BCC_LS   DC.B    'BLS',0
pr_BCC_LT   DC.B    'BLT',0
pr_BCC_MI   DC.B    'BMI',0
pr_BCC_NE   DC.B    'BNE',0
pr_BCC_PL   DC.B    'BPL',0
pr_BCC_VC   DC.B    'BVC',0
pr_BCC_VS   DC.B    'BVS',0

** Register constants
pr_d0       DC.B    'D0',0
pr_d1       DC.B    'D1',0
pr_d2       DC.B    'D2',0
pr_d3       DC.B    'D3',0
pr_d4       DC.B    'D4',0
pr_d5       DC.B    'D5',0
pr_d6       DC.B    'D6',0
pr_d7       DC.B    'D7',0

pr_a0       DC.B    'A0',0
pr_a1       DC.B    'A1',0
pr_a2       DC.B    'A2',0
pr_a3       DC.B    'A3',0
pr_a4       DC.B    'A4',0
pr_a5       DC.B    'A5',0
pr_a6       DC.B    'A6',0
pr_a7       DC.B    'A7',0

** Messages
MESSAGE     DC.B    'Enter the address of compiled code: ',0
MESSAGE2    DC.B    CR,LF,'Please hit enter',0
ERROR_MSG   DC.B    'Invalid input, please rerun',0
DONE_MSG    DC.B    'End of program found!',0

start   ORG     $1000

program_start

*------Code for input-------

        LEA     MESSAGE,A1      *Code block for first message
        MOVE.B  #14,D0
        TRAP    #15

        MOVEA.L #$4000, A1
        MOVE.B  #2,D0           *Code block for reading input
        TRAP    #15
        MOVE.W  D1,D0

        MOVEA.L A1,A0           *Move the contents of A1 to A0 for the conversion
        JSR     A2H             *Branch to Connor's conversion code

        MOVEA.L D0,A0

        CMPI.W  #$FFFF,(A0)
        BEQ     input_error

loop_start

        MOVE.L  A0,D1           *Print out the address we're working on
        MOVE.L  #16,D2
        MOVE.L  #15,D0
        TRAP    #15

        MOVE.L  #14,D0
        LEA     pr_space4,A1
        TRAP    #15

        MOVE.W  (A0)+,D2
        CMPI.W  #$FFFF,D2
        BEQ     Done

        JSR     OpDecoder

        MOVE.L  #13,D0
        TRAP    #15
        
        ADD     #1,D5       *Increment d5 by 1
        CMP     #31,D5      *Check if theres 31 lines of output
        BEQ     clr_scrn    *If theres 20 lines, clear the screen and prompt

        BRA     loop_start

input_error
        MOVE.L  #13,D0
        LEA     ERROR_MSG,A1
        TRAP    #15
        BRA     Done
clr_scrn
        LEA     MESSAGE2,A1     *Print out initial message
        MOVE.B  #14,D0
        TRAP    #15
        
        MOVE.B  #2,D0           *Get user input
        TRAP    #15
        MOVE.B  #0,D5
        BRA     loop_start
        
        MOVE.B  #9,D0           *halt the simulator
        TRAP    #15
        
Done
        MOVE.L  #14,D0
        LEA     DONE_MSG,A1
        TRAP    #15
        SIMHALT

        INCLUDE 'ASCII_HEX_Conversions.x68'
		INCLUDE	'opcodes.x68'

        END     start


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
