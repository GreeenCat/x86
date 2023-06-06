.model small
.data
a db 05h
b db 02h
ev db "number is even$"
od db "number is odd$"
.code

        mov ax,@data
        mov ds,ax
        mov al,a
        mov ah,00h
        mov bl,b
        div bl
        mov cl,ah
        mov cl,00h
        je even
odd:    mov dx,offset od
        mov ah,09h
        int 21h
        mov ah,4ch
        int 21h
even:   mov dx,offset ev
        mov ah,09h
        int 21h
        mov ah,4ch
        int 21h
        end
        
