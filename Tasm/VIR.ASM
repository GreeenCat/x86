.model small
.data
        arr db 08,02,03,09,01h
.code
        mov ax,@data
        mov ds,ax
        mov ax,0000h
        mov dl,04h

i1:     mov dh,04h
        lea si,arr

back:   mov al,[si]
        mov bl,[si+1]
        cmp al,bl
        jbe i3
        xchg al,bl

i3:     mov [si],al
        mov [si+1],bl
        inc si
        dec dh
        jnz back
        dec dl
        jnz i1
        mov dh,05h
        lea si,arr

print:  mov al,[si]
        inc si
        mov dl,al
        mov ch,02h
        mov cl,04h
        mov bh,al

i2:     rol bh,cl
        mov dl,bh
        and dl,0fh
        cmp dl,09
        jbe i4
        add dl,07h

i4:     add dl,30h
        mov ah,02h
        int 21h
        dec ch
        jnz i2
        mov dl,' '
        mov ah,02h
        int 21h
        dec dh
        jnz print
        mov ah,4ch
        int 21h
end
