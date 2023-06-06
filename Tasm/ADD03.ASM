.model small
.data
a db 05H
b db 07H

.code
Mov ax,@data
Mov ds,ax

Mov al,a
Mov bl,b
Add al,bl

Mov dl,al
Add dl,37H
Mov ah,02H
Int 21H
Mov ah,4ch
Int 21H
END
