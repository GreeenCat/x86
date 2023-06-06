.model small
.data
a db 1Ah
.code
mov ax,@data
mov ds,ax
mov al,a
and al,2Fh
mov ch,02h
mov cl,04h
mov bh,al
I2: rol bh,cl
mov dl,bh
and dl,0fh
cmp dl,09
jbe I4
add dl,07h
I4:add dl,30h
mov ah,02h
int 21h
dec ch
jnz I2
mov ah,4ch
int 21h
end
