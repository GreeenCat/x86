.model small
.data
a dw 0002H
b dw 0004H

.code
mov ax,@data
mov ds,ax
mov ax,a
mov bx,b
add ax,bx

mov ch,04H
mov cl,04H
mov bx,ax
I2:rol bx,cl
mov dx,bx
and dx,0fH
cmp dx,09
jbe I4
add dx,07
I4:add dx,30H
mov ah,02H
int 21H
dec ch
jnz I2
mov ah,4ch
int 21H
END
