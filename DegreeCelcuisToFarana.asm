
   ;this code is used to convert degree celcius to degree faranues
org 100h


lea si,prompt ;to display the input instruction
mov ah,2
mov cx,24 ;since the character is 24 including space
prompt_disp:      ;display the message input the temp
mov dl,[si]
int 21h
inc si
loop prompt_disp

        ;this part is used to take input from user
lea si,input      
mov ah,1
mov cx,2
           ;to display the input
input_disp: 
int 21h 
mov [si],al
inc si
loop input_disp

lea si,input
mov al,[si] 
sub al,30h
inc si     
mov ah, [si]
sub ah,30h  
mov dl,ah
mov ah,0  ;make the ah registor clear
mov bl,10
mul bl
add al,dl 

mov bl,9
mul bl
mov bl,5
div bl
add al,32 ;this is the resul of 9*Tc/5 +32 which is stored on al without decimal poit

mov ch,ah
mov ah,0 


mov bl,100
cmp al,bl
jae div      ;if al is above or equal 100  jump

mov bl,10
div bl
add al,30h
add ah,30h
lea si,result
inc si
mov [si],al
inc si
mov [si],ah
jmp ending

div:         ;this done when result is above 100
mov bl,100
div bl
add al,30h
lea si,result
mov [si],al
mov al,ah
mov ah,0
mov bl,10
div bl
add ah,30h
add al,30h
inc si
mov [si],al
inc si
mov [si],ah  
inc si

inc si
mov al,ch
mov bl,10 
mul bl
mov bl,5
div bl
add al,30h
mov [si],al

ending: 
mov dl,0Ah
mov ah,2
int 21h
mov dl,0Dh
int 21h
          
mov dl,0Ah
mov ah,2
int 21h
mov dl,0Dh
int 21h
mov dl,09h
int 21h

lea si,input
mov dl,[si]
int 21h
inc si
mov dl,[si]
int 21h
mov dl,43h
int 21h

mov dl,3Dh
int 21h

lea si,result
mov al,[si]
mov ah,0
mov bl,30h
cmp al,bl
jg isplay:
inc si
mov dl,[si]
mov ah,2
int 21h
inc si
mov dl,[si]
int 21h
jmp finish
isplay:
mov dl,[si]
mov ah,2
int 21h
inc si
mov dl,[si]
int 21h
inc si
mov dl,[si]
int 21h
finish: 
inc si

mov dl,[si]
int 21h
inc si
mov dl,[si]
int 21h
mov dl,46h
int 21h

ret

input db '0','0'
result db '0','0','0','.','0','0'  
prompt db   "Enter Temprature in 0C: "






                                          