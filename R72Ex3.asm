 	      ;3. Program for converting 8-bit binary number to Hex numbers
              ;Auther:Prof. A. A. Barbind
              ;Class:SY_IT
              ;Roll no:72
              ;Department of IT, Sanjivani college of Engineering, Kopargaon

INPUTSTR     MACRO BUFFADDR     
             MOV AH,0AH
             MOV DX,OFFSET BUFFADDR
             INT 21H
             ENDM
             
DISPSTR      MACRO STRADDR     
             MOV AH,09H
             MOV DX,OFFSET STRADDR
             INT 21H
             ENDM
             
              
DATASEG1     SEGMENT
	BINBUF DB 9,0
	BINARY DB 9 DUP(0),'$'
	HEX DB '00','$'

	STR1 DB 10,13,'ENTER 8-BIT BINARY NUMBER:  $'      
	STR2 DB 10,13,'EQUIVALENT HEXADECIMAL NUMBER:  $'

DATASEG1     ENDS


CODESEG1     SEGMENT
              ASSUME DS:DATASEG1,CS:CODESEG1
       BEGIN: MOV AX,DATASEG1
              MOV DS,AX                           ;Initialize DS
              
              DISPSTR STR1
              INPUTSTR BINBUF

		; CONVERT BINARY TO HEX


              DISPSTR STR2
              DISPSTR HEX

             
              MOV AX,4C00H
              INT 21H                              ;Call OS to exit program
CODESEG1      ENDS
              END BEGIN
