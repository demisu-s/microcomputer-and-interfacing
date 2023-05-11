
org 100h
.code
main proc
    
    ;take the value of x from user 
    ;or displaying the instruction i.e enter x:
    
    lea si, input_X
    mov ah, 2
    mov cx, 8
    prompt_X:
    mov dl , [si]
    int 21h
    inc si 
    loop prompt_X
    
    
    
    mov ah,01h ;input for x
    int 21h    
    sub al,30h ;convert ASCIITO binary
    mov bl,al  ;put the value of X on bl 
    
    
    ;to provide space  
    
    mov dl, 0ah
    mov ah, 2
    int 21h
    int 21h
    mov dl, 0dh
    int 21h 
    
    ;take the value of y from user to display the instruction i.e enter y:
    lea si, input_Y
    mov ah, 2
    mov cx, 8 
    
    prompt_Y:
    mov dl , [si]
    int 21h
    inc si 
    loop prompt_Y
    
    mov ah,01h ; input for y
    int 21h
    sub al,30h 
    mov cl,al  ;put the value of Y on cl
    
    
    cmp bl,cl       ; to compare x and y 
    jle increment_X ;if x<=y,jump to increment_x
    decrement_Y:
    sub cl,1 ;y=y-1 derease by 1 by one
   jmp result ;jump to print result
    increment_X:
    add bl,1 ;x=x+1  increase the value of x by 1
    result:
   
   ;to give space
    
    mov dl, 0ah
    mov ah, 2
    int 21h
    int 21h
    mov dl, 0dh
    int 21h 
    
     mov ah,02h 
    mov dl,0
    mov dl,bl
    add dl,30h
    int 21h
    
    ; this gives the space          
    mov dl, 0ah
    mov ah, 2
    int 21h
    int 21h
    mov dl, 0dh
    int 21h 
    
    
    mov ah,02h
    mov dl,0
    mov dl,cl 
    add dl,30h ;convert binary to ASCII
    int 21h
    
    ;end
    mov ah,4ch
    int 21h
    main endp
 
input_X DB 'Enter X:'
input_Y DB 'Enter Y:' 
io DB 'updated value of X:'
iu DB 'Updated value of Y:'
