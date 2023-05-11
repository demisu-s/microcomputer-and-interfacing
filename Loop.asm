
org 100h

; add your code here
lea si,prompt1
mov ah,2
mov cx,18
disp1:
mov dl,[si]
int 21h
inc si
loop disp1

lea si,input
mov ah,1    ;read input
int 21h 
mov [si],al
 

mov al,1
mov bl,al


lea si,input
mov al,[si] 
sub al,30h

mov cl,al
 
mov al,bl
label:
mul cl
loop label:
mov cl,al 
       
       
       

mov dl,0Ah
mov ah,2
int 21h
mov dl,0Dh
int 21h  

mov al,cl
mov bl,100 
mov ah,0
cmp bl,al
jl div 
mov bl,10
div bl
add al,30h
lea si,result 
inc si
mov [si],al
inc si  
add ah,30h
mov [si],ah
jmp ending

div:
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
mov [si],2Eh 
inc si
mov al,ch
mov bl,10 
mul bl
mov bl,5
div bl
add al,30h
mov [si],al

ending:
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




ret

input db '0','0'
result db '0','0','0','.','0','0'  
prompt1 db   "Enter value of X: " 
promp  db "It's factorial is:"

                    
                    



