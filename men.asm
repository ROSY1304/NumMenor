.model small
.stack 100h
.data
    num1 db ?
    num2 db ?
    msg1 db 'Ingrese el primer numero: $'
    msg2 db 'Ingrese el segundo numero: $'
    menorMsg db 'El numero menor es: $'
    menorNum db ?

.code
main:
    ; Inicializaci?n
    mov ax, @data
    mov ds, ax

    ; Pedir el primer n?mero
    mov dx, offset msg1
    mov ah, 09h
    int 21h

    ; Leer el primer n?mero
    mov ah, 01h
    int 21h
    sub al, '0'        ; Convertir de ASCII a n?mero
    mov num1, al

    ; Pedir el segundo n?mero
    mov dx, offset msg2
    mov ah, 09h
    int 21h

    ; Leer el segundo n?mero
    mov ah, 01h
    int 21h
    sub al, '0'        ; Convertir de ASCII a n?mero
    mov num2, al

    ; Comparar los n?meros
    mov al, num1
    cmp al, num2
    jle is_num1_less   ; Si num1 es menor o igual, salta a is_num1_less

    ; Si num2 es menor
    mov al, num2
    jmp display_result

is_num1_less:
    ; Si num1 es menor o igual
    mov al, num1

display_result:
    ; Mostrar el resultado
    mov menorNum, al
    mov dx, offset menorMsg
    mov ah, 09h
    int 21h

    ; Convertir el n?mero menor de nuevo a ASCII para mostrar
    add menorNum, '0'
    mov dl, menorNum
    mov ah, 02h
    int 21h

    ; Finalizar el programa
    mov ax, 4C00h
    int 21h
end main
