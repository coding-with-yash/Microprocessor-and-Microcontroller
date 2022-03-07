  ; PROGRAM FOR ADDITION OF TWO 8 -BIT NUMBER
        
        DISPSTR MACRO STRADDR
                MOV AH,09H
                MOV DX,OFFSET STRADDR
                INT 21H
        ENDM
        
        DATASEG1 SEGMENT
                S1 DB 31H,32H,33H,34H,"$"
                S2 DB 31H,31H,31H,31H,"$"
                S3 DB 5 DUP('0'),"$"
        
                STR1 DB 10,13,"FIRST 8-BIT NUMBER=   $"
                STR2 DB 10,13,"SECOND 8-BIT NUMBER=  $"
                STR3 DB 10,13,"ADDITION OF THE NUMBER=  $"
        
        DATASEG1 ENDS
        
        CODESE1 SEGEMENT
               ASSUME: CS:CODE,DS:DATA
               START:  MOV AX,DATA
                       MOV DS:AX
        
                       DISPSTR STR1
                       DISPSTR S1
        
                       DISPSTR STR2
                       DISPSTR S2
        
                       ;CONVERT ASCII TO BCD
                       MOV SI,OFFSET S1
                       MOV DI,OFFSET S2
                       MOV CX,0008H
        
                 BACK: AND BYTE PTR[SI],OFH
                       AND BYTE PTR[DI],0FH
                       INC SI
                       INC DI
                       LOOP BACK
                       DEC SI
                       DEC DI
                       MOV BX,OFFSET S3+8
                       MOV CX,0008
        
                BACK1: MOV AL,[SI]
                       ADD AL,[DI]
                       ADD AL,30H
                       MOV [BX],AL
                       DEC SI
                       DEC DI
                       DEC BX
                       LOOP BACK1
        
                       DISPSTR STR3
                       DISPSTR SUM
                   
        
               MOV AX,4C00H
               INT 21H
        CODESEG1 ENDS
               END START

