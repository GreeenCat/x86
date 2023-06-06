
.model small
.data
a db 03H
b db 03H
.code
MOV ax,@data
MOV ds,ax
MOV al,a
MOV bl,b
ADD al,bl

MOV ch,02H
MOV cl,04H
MOV bh,al

I2: rol bh,cl
    MOV dl,bh
    and dl,0FH
    cmp dl,09
    jbe i4
    ADD dl,07
I4: add dl,30h
    mov ah ,02h
    int 21h
    dec ch
    jnz I2
    mov ah,4ch
    int 21h
    end
   
