.model small
.data 
arr db 01,02,03,04,05H
a db 03H
string db "number found", "$"
string1 db "number not found","$"
.code 
mov ax,@data 
mov ds,ax
lea s1,arr
mov dh,05H
mov al,00H
mov cl,a
back:mov bl,[si]
cmp dl,bl
jz down 
inc si
inc al
dec dl
jnz back
cmp dh,00H
jz down3
down : lea dx,string 
mov dh,09H
int 21H
mov ch,-2H
mov bh 