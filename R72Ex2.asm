              ;2. Program for addition of two 8-digit decimal numbers
              ;Auther:Prof. A. A. Barbind.
              ;Class:SY_IT
              ;Roll no:72
              ;Department of IT, Sanjivani college of Engineering, Kopargaon
             
DISPSTR      MACRO STRADDR     
             MOV AH,09H
             MOV DX,OFFSET STRADDR
             INT 21H
             ENDM
             
              
DATASEG1     SEGMENT
      N1     DB '12345678','$'
      N2     DB '11111111','$'
      SUM    DB 9 DUP('0'),'$'
      S1     DB 10,13,'Addition is      : $'
      S2     DB 10,13,'First number is  : $'
      S3     DB 10,13,'Second number is : $'
DATASEG1     ENDS

CODESEG1     SEGMENT
              ASSUME DS:DATASEG1,CS:CODESEG1
       BEGIN: MOV AX,DATASEG1
              MOV DS,AX                           ;Initialize DS
              
              DISPSTR S2
              DISPSTR N1

              DISPSTR S3
              DISPSTR N2

              ;Add Numbers              
              MOV SI,OFFSET N1
              MOV DI,OFFSET N2
              MOV CX,0008H

              ;Convert numbers from ASCII to BCD
       BACK:  AND BYTE PTR[SI],0FH
              AND BYTE PTR[DI],0FH
              INC SI
              INC DI
              LOOP BACK

              DEC SI
              DEC DI
              MOV BX,OFFSET SUM+8
              MOV CX,0008H
       BACK1: MOV AL,[SI]
              ADD AL,[DI]
              ADD AL,30H
              MOV [BX],AL
              DEC SI
              DEC DI
              DEC BX
              LOOP BACK1

              DISPSTR S1
              DISPSTR SUM
              
              
              MOV AX,4C00H
              INT 21H                              ;Call OS to exit program
CODESEG1      ENDS
              END BEGIN
