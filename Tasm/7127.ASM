.model small
.data
a db 08H,01H,02H,07H,09H
.code
mov ax,@data
mov ds,ax
mov ax,0000H
mov dl,04H
i1:mov dh,04H
lea si,a
back:mov al,[si]
     mov bl,[si+1]
     cmp al,bl
     jbe i3
     xchg al,bl
i3:mov[si],al
   mov[si+1],bl
   inc si
   dec dh
   jnz back
   dec dl
   jnz i1
   mov dh,05H
   lea si,a
print:mov al,[si]
      inc si
      mov dl,al
      mov ch,02H
      mov cl,04H
      mov bh,al
i2:rol bh,cl
   mov dl,bh
   and dl,0FH
   cmp dl,09H
   jbe i4
   add dl,07H
i4:add dl,30H
   mov ah,02H
   int 21H
   dec ch
   jnz i2
   mov dl,''
   mov ah,02H
   int 21H
   dec dh
   jnz print
   mov ah,4ch
   int 21H
end 

