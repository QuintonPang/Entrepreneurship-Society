.model	small
.stack 64

.data 
	fname db 'access.log', 0
	fhandle dw ?,0
    msg db 13,10,'Enter the data $'
    buffer db 100 dup('$')
   ; username db 100 dup('$')

    hr db 13,10,' -----------------------------------------$'   

    inputPwd db 6 dup('$')
    correctPwd db '123456$'

    welcomeScreen db ' -----------------------------------------$'
    welcomeScreen2 db 13,10,'| WELCOME TO THE ENTREPRENEURSHIP SOCIETY |$'
    welcomeScreen3 db 13,10,' -----------------------------------------$'   
    menu0 db 13,10,'| 0.EXIT                                  |$'

    menu db 13,10,'| 1.REGISTER AS GUEST                     |$'
    menu2 db 13,10,'| 2.LOGIN AS ADMIN                        |$' 
    menu3 db 13,10,' -----------------------------------------$'
    namePrompt db 13,10,'PLEASE ENTER YOUR NAME:$'
    passwordPrompt db 13,10,'PLEASE ENTER PASSWORD (OBTAINED FROM ADMINISTRATOR):$'
        firstChoice db ? , "$"


    mainMenu db ' -----------------------------------------$'
    mainMenu2 db 13,10,'WELCOME, $'
    mainMenu3 db '!$'
    mainMenu4 db 13,10,'| 0.LOGOUT                                |$'
    mainMenu5 db 13,10,'| 1.DONATION                              |$' 
    mainMenu6 db 13,10,'| 2.BUY SOCIETY SHIRT                     |$' 
    mainMenu7 db 13,10,'| 3.CALCULATE RETURN ON INVESTMENT        |$' 
    choicePrompt db 13,10,'PLEASE ENTER YOUR CHOICE:$'
    choice db ? , "$"
        
    donateMsg db 13,10,'YOU WILL EARN 1 POINT FOR EVERY RM5 OF DONATION$'
    donateMsg2 db 13,10,'PLEASE ENTER YOUR AMOUNT OF DONATION (RM):$'
    donation db ?,"$"
        shirtTotal db ?,"$"

    points db ?,"$" 

    donateMsg3 db 13,10,'THANKS FOR DONATING! YOU HAVE DONATED A TOTAL OF RM$'
    donateMsg4 db ' AND YOU WILL EARN $'
    donateMsg5 db ' POINTS!$'

    valuePerPoint db 5
    
        buyMsg1 db 13,10,'EVERY SHIRT COSTS RM$'
        pricePerShirt db 9
    buyMsg2 db 13,10,'PLEASE ENTER QUANTITY (MAX 9):$'
    shirtQuantity db ?,"$" 

    buyMsg3 db 13,10,'THANKS FOR BUYING! IT WILL COST YOU RM$'
    buyMsg4 db '! PLEASE PAY THIS AMOUNT TO THE BURSARY.$'

   
    roiMsg1 db 13,10,'ENTER YOUR INVESTMENT GAIN (RM0 - RM10000):$'
    roiMsg2 db 13,10,'ENTER YOUR INVESTMENT COST (RM0 - RM10000):$'
    roiGain db 10 dup(0)
    roiCost db  10 dup(0)

    wrongPasswordErrorMessage db 13,10,'WRONG PASSWORD!$'
    errorMsg db 13,10,'INVALID CHOICE! PLEASE TYPE AGAIN!$'
    exitMsg db 13,10,'BYE!$'
    hundred db 100
    roi db ?
    array LABEL BYTE
    max db 50
    act db ?
    nameArrayData db 50 dup('$')

.code
main PROC
	
	mov ax, @data
	mov ds, ax

welcomePage:
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
lea dx, menu0
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


firstChoicePage:
; DISPLAY STRING
mov ah, 09h
lea dx, [choiceprompt]
int 21h

; input
mov ah, 01h
int 21h
mov firstChoice, al

; NEW LINE
mov ah, 02h
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h

; convert to decimal    
sub firstChoice, 30h

cmp firstChoice, 0
je jumptoexit2
cmp firstChoice, 1
je namePage
cmp firstChoice, 2

je adminPage
jne firstErrorPage


firstErrorPage:
    ; DISPLAY STRING
    mov ah, 09h
    lea dx, [errormsg]
    int 21h
    
    jmp firstChoicePage

jumpToExit2:
    jmp jumpToExit

namePage:
    ; DISPLAY STRING
    mov ah, 09h
    lea dx, namePrompt
    int 21h
    jmp input
; input
input:
 ; DISPLAY STRING
mov ah, 0ah
lea dx, array
int 21h
jmp page2

wrongPasswordPage:
      ; DISPLAY STRING
    mov ah, 09h
    lea dx, [wrongpassworderrormessage]
    int 21h
    ; NEW LINE
mov ah, 02h
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h 
; NEW LINE
mov ah, 02h
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h 
    jmp welcomepage
adminPage:
  ; DISPLAY STRING
    mov ah, 09h
    lea dx, [passwordprompt]
    int 21h
    mov cx, 6 
        mov si, 0

    enterPwd:
    inputPwdLoop:
        mov ah, 07h
        int 21h
        mov inputPwd[si], al
        inc si
        loop inputPwdLoop

    mov cx, 6
    mov si, 0

    validatePassword:
        mov al,  [inputPwd][si]
      
        cmp [correctpwd][si], al
        jne wrongpasswordpage
        inc si
        loop validatepassword

    mov cx,act
    emptyNameArr:
    mov di, 0
    mov di, cx
    sub di,1
    mov [namearrayData][di], 0
    loop emptyNameArr

 ;   mov [namearraydata][0],"a"
   ; mov [namearraydata][1],"d"
  ;  mov [namearraydata][2],"m"
    ;mov [namearraydata][3],"i"
    ;mov [namearraydata][4],"n"
    jmp page2

jumpToExit:
    jmp exit

; NEW LINE
mov ah, 02h
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h 
jumpToWelcomePage2:
    jmp welcomepage
   
    
page2:
;;;;;; FILE HANDLING;;;;;;;
; CREATE A NEW FILE

;mov ah,3ch
;lea dx,fname
;mov cl, 0 ; attribute value 0 for readonly
;int 21h
;jc if_error
;mov fhandle, ax

 ;Open an existing file
mov ah, 3dh
lea dx, fname
mov al, 2 ;(0 for readonly, 1 for writing, 2 for read and write)
int 21h
mov fhandle, ax
; input
mov si, 0
inputFile:
;mov ah, 01h
;int 21h
cmp [namearraydata][si], '$'
je writeFile

mov al, [namearraydata][si]
mov buffer[si], al
 
inc si
;inc cx
jmp inputFile

writeFile:
; Write text
mov dx,0
mov bx, 0
mov ax,0
mov ah, 40h
mov bx, fhandle
lea dx, buffer
int 21h
; close file
mov ah, 3eh
mov bx, fhandle
int 21h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; NEW LINE
mov ah, 02h
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h
; DISPLAY STRING
mov ah, 09h
lea dx, mainMenu2
int 21h
; DISPLAY STRING

 ; DISPLAY BYTE
;mov ah, 09h
;lea dx, [namearraydata]
;int 21h

; DISPLAY STRING
;mov ah, 09h
;lea dx, mainMenu3
;int 21h
 ; NEW LINE
mov ah, 02h
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h 
; DISPLAY STRING
mov ah, 09h
lea dx, mainMenu
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
lea dx, mainMenu6
int 21h
; DISPLAY STRING
mov ah, 09h
lea dx, mainMenu7
int 21h
; DISPLAY STRING
mov ah, 09h
lea dx, hr
int 21h
jmp page2choice


jumpToWelcomePage:
 ; NEW LINE
mov ah, 02h
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h 
    jmp jumpToWelcomePage2

page2Choice:
; DISPLAY STRING
mov ah, 09h
lea dx, [choiceprompt]
int 21h


; input
mov ah, 01h
int 21h

mov choice, al

; convert to decimal    
sub choice, 30h

cmp choice, 1
je donatePage

cmp choice, 3
je jumptoroipage



cmp choice, 0
je jumptowelcomepage
jne errorpage
cmp choice, 2
je buyShirtPage

    

;;;;;;;;;;;;;;;;;;;;;;;
; DISPLAY STRING
;mov ah, 09h
;lea dx, menu
;int 21h



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

jumptoroipage:
    jmp roipage1
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

beforeExit:
    jmp exit

buyShirtPage:
; DISPLAY STRING
mov ah, 09h
lea dx, buyMsg1
int 21h

; convert to hexa
add pricePerShirt, 30h

; DISPLAY BYTE
    mov ah, 02h 
    mov dl, pricePerShirt
    int 21h
    
; convert to decimal
sub pricePerShirt, 30h
; DISPLAY STRING
mov ah, 09h
lea dx, buyMsg2
int 21h
; input
mov ah, 01h
int 21h

mov shirtQuantity, al

; convert to decimal
sub shirtQuantity, 30h

; multplication
mov ax, 0
mov al, shirtQuantity
mul pricePerShirt
mov shirtTotal, al

; convert to hexadecimal
add shirtTotal, 30h

; DISPLAY STRING
mov ah, 09h
lea dx, [buymsg3]
int 21h
   ; DISPLAY BYTE
    mov ah, 02h 
    mov dl, shirtTotal
    int 21h
; DISPLAY STRING
mov ah, 09h
lea dx, [buymsg4]
int 21h
; NEW LINE
mov ah, 02h
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h
jmp page2


roiPage1:
; DISPLAY STRING
mov ah, 09h
lea dx, [roimsg1]
int 21h
; DISPLAY STRING
mov ah, 09h
lea dx, [roimsg2]
int 21h

; input
inputRoiGain:
mov ah, 01h
int 21h
cmp al, 13
jc roiPage2
mov [roigain][si], al
inc si
jmp inputRoiGain

roiPage2:
; DISPLAY STRING
mov ah, 09h
lea dx, [roimsg2]
int 21h

; input
inputRoiCost:
mov ah, 01h
int 21h
cmp al, 13
jc roiPage2
mov [roicost][si], al
inc si
jmp inputRoiCost

;;;; calculation
sub [roigain], 30h
sub [roicost], 30h
mov ax, 0
mov al, [roigain]
div [roicost]
mul [hundred]
mov roi, al

; DISPLAY STRING
mov ah, 09h
lea dx, [roi]
int 21h
jmp page2

exit:
    ; DISPLAY STRING
mov ah, 09h
lea dx, exitMsg
int 21h



; EXIT
mov ah, 4ch
int 21h

main ENDP
END main