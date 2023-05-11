;the code us use to check whether the character that from user and  
;the character that inside the memory is the same

org 100h



.DATA
  PASSWORD DB 'demis' ; 5-character password stored in ds memory
  INPUT DB 5 DUP ('$') ; to store input password string

.CODE   ;code segment
  MAIN PROC
    MOV AX, @DATA 
    MOV DS, AX 
    
    LEA SI, PROMPT
    MOV AH, 2
    MOV CX, 15
    DISPLAY:
    MOV DL , [SI]
    INT 21h
    INC SI 
    LOOP DISPLAY
    
    CALL READ ; to read password from keyboard

    ; compare input password with password in memory
    MOV CX, 5 ; set loop counter to 5
    MOV SI, OFFSET INPUT ; set SI to point to input password buffer
    MOV DI, OFFSET PASSWORD ; set DI to point to password in memory
    MOV BX, 0 ; initialize BX to track number of characters matched
    COMP_LOOP:
      MOV AL, [SI] ; load character from input password
      CMP AL, [DI] ; compare with corresponding character in memory
      JNE COMP_DONE ; if characters do not match, exit loop
      INC SI ; increment input password pointer
      INC DI ; increment memory password pointer
      INC BX ; increment match counter
      LOOP COMP_LOOP ; continue comparing remaining characters
    COMP_DONE:
      CMP BX, 5 ; check if all characters matched 
      
      
      mov dl, 0ah
    mov ah, 2
    int 21h
    int 21h
    mov dl, 0dh
    int 21h 
      
      
      JNE ACCESS_DENIED ; if not, access is denied

    ; if control reaches here, password is correct
    MOV AH, 09H ; print "access granted" message
    LEA DX, GRANTED_MSG
    INT 21H
    JMP END_PROGRAM

  ACCESS_DENIED:
    MOV AH, 09H ; print "access denied" message
    LEA DX, DENIED_MSG
    INT 21H

  END_PROGRAM:
    MOV AH, 4CH ; terminate program
    INT 21H

  READ PROC
    MOV CX, 5 ; set maximum number of characters to read
    MOV AH, 01 ; function code to read character
    MOV DX, 0 ; clear DX register to store input character
    MOV BX, 0 ; initialize BX to store number of characters read
    MOV DI, OFFSET INPUT ; set DI to point to input password buffer
    READ_LOOP:
      INT 21h ; read character from keyboard
      CMP AL, 0Dh ; check if carriage return was entered
      JE READ_DONE ; if so, exit loop
      MOV [DI+BX], AL ; store character in array at offset BX
      INC BX ; increment number of characters read
      CMP BX, CX ; check if maximum number of characters has been reached
      JE READ_DONE ; if so, exit loop
      JMP READ_LOOP ; otherwise, continue reading
    READ_DONE:
      RET ; return from procedure
  ENDP READ

  GRANTED_MSG DB 'ACCESS GRANTED!!', 0DH, 0AH, '$' ; message to print if access is granted
  DENIED_MSG DB 'ACCESS DENIED!!', 0DH, 0AH, '$' ; message to print if access is denied  
  PROMPT DB 'enter password:'

  END MAIN



