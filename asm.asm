
.model	small
.stack 64

.data 
	fname db 'first.txt', 0
	fhandle dw ?
    msg db 13,10,'Enter the data $'
    buffer db 100 dup('$')
   
    welcomeScreen db ' -------------------------------------',13,10,'| WELCOME TO THE ENTREPRENEUR SOCIETY |',13,10,' -------------------------------------$'
    menu db 13,10,'| 1.REGISTER                          |',13,10,'| 2.LOGIN                             |',13,10,' -------------------------------------',13,10,'PLEASE ENTER YOUR CHOICE:$'

.code
main PROC
	
	mov ax, @data
	mov ds, ax
    
; DISPLAY STRING
mov ah, 09h
lea dx, welcomeScreen
int 21h
; DISPLAY STRING
mov ah, 09h
lea dx, menu
int 21h


; CREATE A NEW FILE

;mov ah,3ch
;lea dx,fname
;mov cl, 0 ; attribute value 0 for readonly
;int 21h
;;jc if_error
;mov fhandle, ax

; Open an existing file
mov ah, 3dh
lea dx, fname
mov al, 2 ;(0 for readonly, 1 for writing, 2 for read and write)
int 21h
mov fhandle, ax



; READ

    mov ah, 3fh
    lea dx, buffer
    mov cx, 100
    mov bx, fhandle
    int 21h
    ;lea dx, buffer
    ;mov ah, 09h
    ;int 21h
    
;lea dx, [msg]
;mov ah, 09h
;int 21h
;mov si, 0
;mov cx,0

; input
input:
mov ah, 01h
int 21h
cmp al, 13
jc exit
mov buffer[si], al
inc si
inc cx
jmp input

exit:
; Write text
mov ah, 40h
mov bx, fhandle
lea dx, buffer
; mov cx ; 
int 21h




; close file
mov ah, 3eh
mov bx, fhandle
int 21h

; EXIT
mov ah, 4ch
int 21h

main ENDP
END main