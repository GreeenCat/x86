.model small 
.data
a db 01H,02H,03H,04H,05H
.code
mov ax,@data
mov ds ,ax
lea si,a
mov dh,04h
mov al,[si]
back:add al,[si+1]
     inc si
     dec dh
     jnz back
     mov ch,02h
     mov cl,04h
     mov bh,al
i2: rol bh,cl
    mov dl,bh
    and dl,0fh
    cmp dl,09
    jbe i4
    add dl,07h
i4: add dl,30H
    mov ah,02h
    int 21h
    dec ch
    jnz i2
    mov ah,4ch
    int 21h
end 
