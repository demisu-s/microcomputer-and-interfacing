
 ; Initialize the counter 
    mov cx, 5
    mov di, 1
    
    ; Read characters from the keyboard
    read_char:
    mov ah, 01h    ; Function to read character from keyboard
    int 21h        ; Read character from keyboard
    
    ; Check if the character is a carriage return or the bf is full
    cmp al, 6h    ; Check if the character is a carriage return
    je done        ; If yes, exit the loop
    
    cmp di, 5     ; Check if the buffer is full
    je done        ; If yes, exit the loop
    
    ; Store the character in the bf and increment the counter
    mov [bf + di], al
    inc di
    
    ; Loop back to read the next character
    jmp read_char
    
    done:
    ret
    
    bf db 5  ;




