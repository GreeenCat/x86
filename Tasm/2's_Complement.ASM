
.model small
.data
a db 0AFH

.code
mov ax, @data
mov ds, ax
mov al, a
not al
ADD al,01H
mov ch, 02h
mov cl, 04h
mov bh, al
l2: rol bh, cl
    mov dl, bh
    and dl, 0fH
    cmp dl, 09
    jbe l4
    add dl, 07
l4: add dl, 30H
    mov ah, 02
    int 21H
    dec ch
    jnz l2
    mov ah, 4CH
    int 21H
end


