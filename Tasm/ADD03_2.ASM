.model small
.data
a db 14H
b db 02H
.code
        mov ax,@data
        mov ds,ax
        mov al,a
        mov bl,b
        add al,bl

        mov ch,02H
        mov cl,04H
        mov bh,al
    I2: rol bh,cl
        mov dl,bh
        and dl,0fH
        cmp dl,09
        jbe I4
        add dl,07
    I4: add dl,30H
        mov ah,02H
        int 21H
        dec ch
        jnz I2
        mov ah,4CH
        int 21H
END
