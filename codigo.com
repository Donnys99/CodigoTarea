a
;pedimos el primer número
mov ah,01 
int 21
sub al,30 ;ajustes para decimal
mov bl,al
;pedimos el segundo número
mov ah,01 
int 21
sub al,30
add al,bl  ;realizamos la suma de los dos números
;Ajuste de la suma con acarreo 
aaa  
or  ax,3030 ;Ajusta la parte alta y la parte baja del registro ax
mov bx,ax
sub bh,01
;Impresión de carateres
mov ah,02
mov dl,bh ;Imprimimos la parte alta
int 21
mov ah,02
mov dl,bl ;Imprimimos la parte alta
int 21
int 20