
.model	small
.stack 64

.data 
	fname db 'first.txt', 0
	fhandle dw ?
    msg db 13,10,'Enter the data $'
    buffer db 100 dup('$')
   
       hr db 13,10,' -----------------------------------------$'   


    welcomeScreen db ' -----------------------------------------$'
    welcomeScreen2 db 13,10,'| WELCOME TO THE ENTREPRENEURSHIP SOCIETY |$'
    welcomeScreen3 db 13,10,' -----------------------------------------$'   
    menu db 13,10,'| 1.REGISTER                              |$'
    menu2 db 13,10,'| 2.LOGIN                                 |$' 
    menu3 db 13,10,' -----------------------------------------$'
    menu4 db 13,10,'PLEASE ENTER YOUR CHOICE:$'
    
    mainMenu db ' -----------------------------------------$'
    mainMenu2 db 13,10,'| LOGIN SUCCESSFUL!                       |$'
    mainMenu3 db 13,10,' -----------------------------------------$'
    mainMenu4 db 13,10,'| 0.EXIT                                  |$'
    mainMenu5 db 13,10,'| 2.BUY SOCIETY SHIRT                     |$' 
    mainMenu6 db 13,10,' -----------------------------------------$'
    mainMenu7 db 13,10,'PLEASE ENTER YOUR CHOICE:$'
    choice db ? , "$"
        
    donateMsg db 13,10,'YOU WILL EARN 1 POINT FOR EVERY RM5 OF DONATION$'
    donateMsg2 db 13,10,'PLEASE ENTER YOUR AMOUNT OF DONATION (RM):$'
    donation db ?,"$"
    points db ?,"$" 

    donateMsg3 db 13,10,'THANKS FOR DONATING! YOU HAVE DONATED A TOTAL OF RM$'
    donateMsg4 db ' AND YOU WILL EARN $'
    donateMsg5 db ' POINTS!$'

    valuePerPoint db 5
    
    errorMsg db 13,10,'INVALID CHOICE! PLEASE TYPE AGAIN!$'
    exitMsg db 13,10,'BYE!$'

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
lea dx, welcomeScreen2
int 21h
; DISPLAY STRING
mov ah, 09h
lea dx, hr
int 21h

; DISPLAY STRING
mov ah, 09h
lea dx, menu
int 21h
; DISPLAY STRING
mov ah, 09h
lea dx, menu2
int 21h
; DISPLAY STRING
mov ah, 09h
lea dx, menu3
int 21h
; DISPLAY STRING
mov ah, 09h
lea dx, menu4
int 21h

; input
mov ah, 01h
int 21h
; NEW LINE
mov ah, 02h
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h
page2:
; DISPLAY STRING
mov ah, 09h
lea dx, mainMenu
int 21h
; DISPLAY STRING
mov ah, 09h
lea dx, mainMenu2
int 21h

; DISPLAY STRING
mov ah, 09h
lea dx, hr
int 21h
; DISPLAY STRING
mov ah, 09h
lea dx, mainMenu4
int 21h
; DISPLAY STRING
mov ah, 09h
lea dx, mainMenu5
int 21h
; DISPLAY STRING
mov ah, 09h
lea dx, hr
int 21h
; DISPLAY STRING
mov ah, 09h
lea dx, mainMenu7
int 21h


; input
mov ah, 01h
int 21h

mov choice, al

; convert to decimal    
sub choice, 30h

cmp choice, 2
je donatePage

cmp choice, 0
je exit
jne errorpage

;;;;;;;;;;;;;;;;;;;;;;;
; DISPLAY STRING
;mov ah, 09h
;lea dx, menu
;int 21h


; CREATE A NEW FILE

;mov ah,3ch
;lea dx,fname
;mov cl, 0 ; attribute value 0 for readonly
;int 21h
;;jc if_error
;mov fhandle, ax

; Open an existing file
;mov ah, 3dh
;lea dx, fname
;mov al, 2 ;(0 for readonly, 1 for writing, 2 for read and write)
;int 21h
;mov fhandle, ax



; READ

  ;  mov ah, 3fh
  ;  lea dx, buffer
  ;  mov cx, 400 ; number of characters to read
  ;  mov bx, fhandle
   ; int 21h
    ; display string
    ;lea dx, buffer
   ; mov ah, 09h
    ;int 21h
    ; DISPLAY BYTE
    ;mov ah, 02h 
    ;mov dl, buffer[102]
    ;int 21h
;lea dx, [msg]
;mov ah, 09h
;int 21h
;mov si, 0
;mov cx,0

; input
;input:
;mov ah, 01h
;int 21h
;cmp al, 13
;jc exit
;mov buffer[si], al
;inc si
;inc cx
;jmp input

;exit:
; Write text
;mov ah, 40h
;mov bx, fhandle
;lea dx, buffer
; mov cx ; 
;int 21h

errorPage:
    ; DISPLAY STRING
    mov ah, 09h
    lea dx, [errormsg]
    int 21h
    
; NEW LINE
mov ah, 02h
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h
    jmp page2

donatePage:
; DISPLAY STRING
mov ah, 09h
lea dx, donateMsg
int 21h
; DISPLAY STRING
mov ah, 09h
lea dx, donateMsg2
int 21h
; input
mov ah, 01h
int 21h

mov donation, al

; convert to decimal
sub donation, 30h

; division
mov ax, 0
mov al, donation
div valuePerPoint
mov points, al

; convert to hexadecimal
add donation, 30h
add points, 30h

; DISPLAY STRING
mov ah, 09h
lea dx, donateMsg3
int 21h
   ; DISPLAY BYTE
    mov ah, 02h 
    mov dl, donation
    int 21h
; DISPLAY STRING
mov ah, 09h
lea dx, donateMsg4
int 21h

; DISPLAY BYTE
    mov ah, 02h 
    mov dl, points
    int 21h

; DISPLAY STRING
mov ah, 09h
lea dx, donateMsg5
int 21h
jmp page2;

exit:
    ; DISPLAY STRING
mov ah, 09h
lea dx, exitMsg
int 21h

; close file
;mov ah, 3eh
;mov bx, fhandle
;int 21h

; EXIT
mov ah, 4ch
int 21h

main ENDP
END main