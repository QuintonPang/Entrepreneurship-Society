;;;;;;;;;;;;;MUST CREATE access.log FILE IN THE SAME DIRECTORY BEFORE RUNNING;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;running on jsdos TASM is recommeded for best experience;;;;;;;;;;;;;;;;;;;;;


.model	small
.stack 64
;;;TODO:3. buy shirt wrong calculation
.data 
	fname db 'access.log$'
	fhandle dw ?,'$'
    msg db 13,10,'Enter the data $'
    buffer db 50 dup('$')
   ; username db 100 dup('$')

    hr db 13,10,' 		-----------------------------------------$'   

    inputPwd db 6 dup('$')
    correctPwd db '123456$'

    welcomeScreen db			' 		 -----------------------------------------$'
    welcomeScreen2 db 13,10,	'		| WELCOME TO THE ENTREPRENEURSHIP SOCIETY |$'
    welcomeScreen3 db 13,10,	' 	 	 -----------------------------------------$'   
    menu0 db 13,10,				'		| 0.EXIT                                  |$'
    menu db 13,10,				'		| 1.REGISTER AS GUEST                     |$'
    menu2 db 13,10,				'		| 2.LOGIN AS ADMIN                        |$' 
    menu3 db 13,10,				' 		 -----------------------------------------$'
    namePrompt db 13,10,		'PLEASE ENTER YOUR NAME:$'
    passwordPrompt db 13,10,	'PLEASE ENTER PASSWORD (OBTAINED FROM ADMINISTRATOR):$'
    firstChoice db ? , "$"


    mainMenu db 			' 		 -----------------------------------------$'
    mainMenu2 db 13,10,		'			WELCOME, $'
    mainMenu3 db 			'!$'
    mainMenu4 db 13,10, 	'		| 0.LOGOUT                                |$'
    mainMenu5 db 13,10, 	'		| 1.DONATION                              |$' 
    mainMenu6 db 13,10, 	'		| 2.BUY SOCIETY SHIRT                     |$' 
    mainMenu7 db 13,10, 	'		| 3.PROFIT CALCULATOR                     |$' 
    choicePrompt db 13,10,13,10,	'PLEASE ENTER YOUR CHOICE:$'
    choice db ? , 			"$"

	loginMessage1 db 13,10,"		LOGGED IN SUCCESSFULLY AT $"
	;loginMessage2 db 13,10," by$"
        
    donateMsg db 13,10,'YOU WILL EARN 1 POINT FOR EVERY RM5 OF DONATION$'
    donateMsg2 db 13,10,'PLEASE ENTER YOUR AMOUNT OF DONATION (RM):$'
	donateMsg3 db 13,10,'	THANKS FOR DONATING! YOU HAVE DONATED A TOTAL OF RM$'
    donateMsg4 db 13,10,'			YOU WILL EARN $'
    donateMsg5 db ' POINTS!$'
		valuePerPoint db 5
		don1 db 0
		don2 db 0
		don3 db 0
		don4 db 0
		point1 db 0
		point2 db 0
		point3 db 0
		point4 db 0
		pQu1 db 0
		pRe1 db 0
		pQu2 db 0
		pRe2 db 0
		r1 db 0
		r2 db 0
		r3 db 0
		don_digit db 0
		
		DDDDDDDD	label 	byte
		dmax		db		5
		dact		db		?
		ddata		db		5 dup ("$")



    

    
    shirtTotal dw ?
	pricePerShirt db 90,'$'
	buyMsg1 db 13,10,'EVERY SHIRT COSTS RM$'
	buyMsg2 db 13,10,'PLEASE ENTER QUANTITY (MAX 99):$'
	buyMsg3 db 13,10,'COST OF SHIRT: RM$'
    buyMsg4 db 'PROCESSING FEE ($'
    buyMsg5 db '%): RM$'
    buyMsg6 db 13,10,13,10,'	THANKS FOR BUYING! IT WILL COST YOU RM$'
    buyMsg7 db ' IN TOTAL!'
			db 13,10,'		PLEASE PAY THIS AMOUNT TO THE BURSARY.$'
		processingFeePercentage dw 6
		PFPDigit db "6"
		processingFee dw 0
		processingFeeFP dw 0
		shirtQuantity db ?,"$" 
		shirtTotalWithPF dw 0
			sq1 db 0
			sr1 dw 0
			sq2 db 0
			sr2 db 0
			sq3 db 0
			sr3 db 0
			sq4 db 0
			sr4 db 0
			rPPS db 0
			qPPS db 0
	
			;; for total		
			stq1 db 0
			str1 dw 0
			stq2 db 0
			str2 db 0
			stq3 db 0
			str3 db 0
			stq4 db 0
			str4 db 0

			shirt		label	byte
			shirtMax	db		3
			shirtAct	db		0
			shirtData	db		3 dup ("$")
	 
    roiMsg1 db 13,10,'ENTER YOUR INVESTMENT GAIN (RM0 - RM10000):$'
    roiMsg2 db 13,10,'ENTER YOUR INVESTMENT COST (RM0 - RM10000):$'
    roiGain db 10 dup(0)
    roiCost db  10 dup(0)

    wrongPasswordErrorMessage db 13,10,'WRONG PASSWORD!$'
    errorMsg db 13,10,'INVALID CHOICE! PLEASE TYPE AGAIN!$'
    exitMsg db 13,10,'BYE!$'
    hundred db 100
    hundredDw dw 100
    roi db ?

    array LABEL BYTE
    nameArrayMax db 50
    nameArrayAct db ?
    nameArrayData db 50 dup('$')

	MSG1 db 13,10,"ENTER QUANTITY (UNIT)--> $"
	MSG2 db 13,10,"ENTER COST PER UNIT --> RM$"
	MSG3 db 13,10,"ENTER RETAIL PRICE PER UNIT --> RM$"
	MSG4 db 13,10,13,10,"THE TOTAL COST = RM$"
	MSG5 db 13,10,"THE TOTAL RETAIL PRICE = RM$"
	MSG6 db 13,10,13,10,"THE PROFIT = RM$"
	MSG7 db 13,10,13,10,"THE TOTAL LOST = -RM$"
	ERROR db 13,10,"INVALID INPUT! PLEASE ENTER A NUMBER..$"
    
	quantity	label	byte
	max			db		3
	act			db		0
	qtydata		db		3 dup ("$")

	

shirt_digit db 0
	shirt1 db 0
	shirt2 db 0

	digit db 0
	QTY db 0
	cost db 0
	price db 0
	TTL_cost dw 0
	TTL_price dw 0
	PROFIT dw 0
	LOST dw 0
	TEN db 10
	cQ1 db 0
	cR1 db 0
	cQ2 db 0
	cRe2 db 0
	QTY1 db 0
	QTY2 db 0
	pQ1 db 0
	pR1 db 0
	pQ2 db 0
	pR2 db 0
	nQ1 db 0
	nR1 db 0
	nQ2 db 0
	nR2 db 0
	lQ1 db 0
	lR1 db 0
	lQ2 db 0
	lR2 db 0
	thousand dw 1000
	
	pfq1 db 0
	pfr1 dw 0
	pfq2 db 0
	pfr2 db 0 
	pfq3 db 0
	pfr3 db 0 

.code
main PROC
	
	mov ax, @data
	mov ds, ax



	; Set the video mode to 03h (text mode, 80x25)
    MOV AH, 00h
    MOV AL, 03h
    INT 10h
	
    ; Set the cursor position (row = 0, column = 0)
    MOV AH, 02h
    MOV BH, 00h ; Page number
    MOV DH, 00h ; Row
    MOV DL, 0h ; Column
    INT 10h

    ; Set the background color for the entire screen
    MOV AH, 09h
    MOV AL, ' ' ; Space character
    MOV CX, 2000 ; Number of characters (80 columns * 25 rows)
    MOV BX, 000EH; pageNumber | Color
    INT 10h

welcomePage:

mov ax, 0
mov bx, 0
mov cx, 0
xor dx, dx

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
 ; INPUT STRING
mov ah, 0ah
lea dx, array
int 21h
jmp displaylogindatetime

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

    mov cx,5
    emptyNameArr:
    mov di, 0
    mov di, cx
    sub di,1
    mov [namearrayData][di], "$"
    loop emptyNameArr

    mov [namearraydata][0],"a"
    mov [namearraydata][1],"d"
    mov [namearraydata][2],"m"
    mov [namearraydata][3],"i"
    mov [namearraydata][4],"n"
        mov [namearraydata][5],13
	mov [[nameArrayAct]], 5
    jmp displaylogindatetime

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
   

displayLoginDateTime:
; NEW LINE
mov ah, 02h
mov dl, 0dh
int 21h

mov dl, 0ah
int 21h

  mov ah, 09h
    lea dx, [[loginmessage1]]
    int 21h
;Day Part
DAY:
MOV AH,2AH    ; To get System Date
INT 21H

MOV AL,DL     ; Day is in DL
AAM
MOV BX,AX
CALL DISP

MOV DL,'/'
MOV AH,02H    ; To Print / in DOS
INT 21H

;Month Part
MONTH:
MOV AH,2AH    ; To get System Date
INT 21H
MOV AL,DH     ; Month is in DH
AAM
MOV BX,AX
CALL DISP

MOV DL,'/'    ; To Print / in DOS
MOV AH,02H
INT 21H

;Year Part
YEAR:
MOV AH,2AH    ; To get System Date
INT 21H
ADD CX,0F830H ; To negate the effects of 16bit value,
MOV AX,CX     ; since AAM is applicable only for AL (YYYY -> YY)
AAM
MOV BX,AX
CALL DISP

MOV AH,02H
MOV DL," "
INT 21H
;Hour Part
HOUR:
MOV AH,2CH    ; To get System Time
INT 21H
MOV AL,CH     ; Hour is in CH
AAM
MOV BX,AX
CALL DISP

MOV DL,':'
MOV AH,02H    ; To Print : in DOS
INT 21H

;Minutes Part
MINUTES:
MOV AH,2CH    ; To get System Time
INT 21H
MOV AL,CL     ; Minutes is in CL
AAM
MOV BX,AX
CALL DISP

MOV DL,':'    ; To Print : in DOS
MOV AH,02H
INT 21H

;Seconds Part
Seconds:
MOV AH,2CH    ; To get System Time
INT 21H
MOV AL,DH     ; Seconds is in DH
AAM
MOV BX,AX
CALL DISP

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

;READ

  mov ah, 3fh
    lea dx, buffer
    mov cx, 50 ; number of characters to read
    mov bx, fhandle
    int 21h
	; display string
   ; lea dx, [loginmessage1]
   ; mov ah, 09h
 ;   int 21h
    ; display string
 ;   lea dx, buffer
   ; mov ah, 09h
    ;int 21h
; input
mov si, 0
mov cx, 0
inputFile:
;mov ah, 01h    
;int 21h
mov al, [[namearrayact]]
cmp cx, ax
je writeFile


mov al, [namearraydata][si]
  
mov buffer[si], al

    
inc si
inc cx
jmp inputFile

writeFile:
mov ax,0
mov al, namearrayact
mov si,ax
mov al, 13
mov buffer[si], al
inc cx
  ; DISPLAY BYTE
   ; mov ah, 02h 
    ;mov dl, buffer[0]
    ;int 21h
; Write text
;mov ah, 40h
;mov bx, fhandle
;lea dx, buffer
;int 21h
; close file
;mov ah, 3eh
;mov bx, fhandle
;int 21h

; DISPLAY STRING
mov ah, 09h
lea dx, mainMenu2
int 21h
; DISPLAY STRING

mov si,0
displayName:
;mov al, [namearrayact]
cmp [namearraydata][si], 13
je afterdisplayname
 ; DISPLAY BYTE
mov ah, 02h
mov dl, [namearraydata][si]
int 21h

inc si
jmp displayName

; DISPLAY BYTE
;mov ah, 09h
;lea dx, [namearraydata]
;int 21h

afterDisplayName:
; DISPLAY STRING
mov ah, 09h
lea dx, mainMenu3
int 21h
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
je jumptocalprofitpage



cmp choice, 0
je jumptowelcomepage
cmp choice, 2
je jumpbuyShirtPage
jne errorpage

    

;;;;;;;;;;;;;;;;;;;;;;;
; DISPLAY STRING
;mov ah, 09h1
;lea dx, menu
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
jumptocalprofitpage:
    jmp calc_profit_start
jumpbuyshirtpage:
	jmp buyShirtPage


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
mov ah, 0AH
LEA DX, DDDDDDDD
int 21h

MOV AX,0 
MOV don_digit,0   
MOV point1,0
MOV point2,0
MOV point3,0
MOV point4,0

MOV AL, ddata[0]
mov don1, AL
MOV AL, ddata[1]
mov don2, AL
mov AL, ddata[2]
mov don3, AL
mov AL, ddata[3]
mov don4, AL

	CMP don1,'0'
	JL donation_error_msg
	CMP don1,'9'
	JG donation_error_msg
	inc don_digit
	sub don1,30h

	cmp ddata[1],13
	je bypassvalidation

	CMP don2,'0'
	JL donation_error_msg
	CMP don2,'9'
	JG donation_error_msg
	inc don_digit
	sub don2,30h

	cmp ddata[2],13
	je bypassvalidation

	CMP don3,'0'
	JL donation_error_msg
	CMP don3,'9'
	JG donation_error_msg
	inc don_digit
	sub don3,30h

	cmp ddata[3],13
	je bypassvalidation

	CMP don4,'0'
	JL donation_error_msg
	CMP don4,'9'
	JG donation_error_msg
	inc don_digit
	sub don4,30h
	JMP bypassvalidation



	donation_error_msg:
	MOV AH,09H
	LEA DX,ERROR
	INT 21H

	;New Line
	MOV AH,02H
	MOV DL,13
	INT 21H
	MOV DL,10
	INT 21H
	JMP donatePage

bypassvalidation:
	;New Line
	MOV AH,02H
	MOV DL,13
	INT 21H
	MOV DL,10
	INT 21H

checkDonationDigit: 
 XOR AX,AX
 
 CMP don_digit,1
 JE ones
 CMP don_digit,2
 JE tenth
 CMP don_digit,3
 JE hundreds
 CMP don_digit,4
 JE donateDivision

 ones:
 MOV AL,don1
 XCHG don4,AL
 MOV don1,0
 MOV don2,0  
 MOV don3,0
 JMP donateDivision

 tenth:
 MOV AL,don2
 XCHG don4,AL
 MOV don2,AL
 
 MOV AL,don1
 XCHG don3,AL
 MOV don1,0
 MOV don2,0
 JMP donateDivision

 hundreds:  
 MOV AL,don3
 XCHG don4,AL
 MOV don3,AL
              
              
 MOV AL,don2
 XCHG don3,AL
 MOV don2,AL
 
 MOV AL,don1
 XCHG don2,AL
 MOV don1,0

donateDivision:
MOV AX,0
MOV AL,don1		
DIV valuePerPoint	;1.8
MOV point1, AL		;1
mov r1, ah			;4

MOV AX,0        
mov al, r1
mul ten  			
add al, don2		;49
DIV valuePerPoint	;9
mov point2, al		;9
mov	r2, ah			;4

MOV AX,0        
mov al, r2
mul ten  
add al, don3		;49
DIV valuePerPoint	
mov point3, al		
mov	r3, ah
             
            
MOV AX,0        
mov al, r3			
mul ten  
add al, don4		;49
DIV valuePerPoint
mov point4, al		;9





;display sequence pQu1 pRe1 pQu2 pRe2

add point1,30H
add point2,30H
add point3,30H
add point4,30H


; DISPLAY STRING
mov ah, 09h
lea dx, donateMsg3
int 21h
   ; DISPLAY BYTE

MOV AH,02H
MOV DL,ddata[0]
INT 21H
MOV AH,02H
MOV DL,ddata[1]
INT 21H
MOV AH,02H
MOV DL,ddata[2]
INT 21H
MOV AH,02H
MOV DL,ddata[3]
INT 21H

; DISPLAY STRING
mov ah, 09h
lea dx, donateMsg4
int 21h

; DISPLAY BYTE
MOV AH,02h
MOV DL,point1
INT 21H
MOV AH,02h
MOV DL,point2
INT 21H
MOV AH,02h
MOV DL,point3
INT 21H
MOV AH,02h
MOV DL,point4
INT 21H

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
;add pricePerShirt, 30h

; DISPLAY BYTE
    
	XOR AX,AX
	MOV AL,pricePerShirt ;90
	DIV TEN
	MOV rPPS, AH ;0
	MOV qPPS, AL ;9
	
    add rPPS,30H
	add qPPS,30H
	
	MOV AH,02h
	MOV DL,qPPS
	INT 21H
	MOV AH,02h
	MOV DL,rPPS
	INT 21H

; convert to decimal
;sub pricePerShirt, 30h

mov shirt_digit,0
; DISPLAY STRING
mov ah, 09h
lea dx, buyMsg2
int 21h
 ;input quantity
	MOV AH,0AH
	LEA DX,shirt
	INT 21H

MOV AL,shirtData[0]
	MOV shirt1,AL
	MOV AL,shirtData[1]
	MOV shirt2,AL
mov shirtQuantity, al
	CMP shirt1,'0'
	JL error_msg_shirt
	CMP shirt1,'9'
	JG error_msg_shirt
	INC shirt_digit
	SUB shirt1,30H
		
	cmp shirt1[1], 13
	je bypassValidateSecondNumShirt
	SHIRT_VALIDATE_SECOND_NUM:
	CMP shirt2,'0'
	JL error_msg_shirt
	CMP shirt2,'9'
	JG error_msg_shirt
	INC shirt_digit
	SUB shirt2,30H	

	bypassValidateSecondNumShirt:
;New Line
		MOV AH,02H
		MOV DL,13
		INT 21H
		MOV DL,10
		INT 21H

	
;-----either one or two digit-----
	
 checkForShirt:
	CMP shirt_digit,1
	JE one_digit_shirt
	CMP shirt_digit,2
	JE two_digit_shirt


	
	; Invalid input
	error_msg_shirt:
		MOV AH,09H
		LEA DX,ERROR
		INT 21H

		;New Line
		MOV AH,02H
		MOV DL,13
		INT 21H
		MOV DL,10
		INT 21H

		JMP buyshirtpage
	
	
	one_digit_shirt:
		MOV AL,shirt1
		MOV [shirtquantity],AL
		JMP calcShirt


	two_digit_shirt:
		MOV AL,shirt1		
		MUL TEN			;multiply QTY1	
		ADD	AL,shirt2		;add QTY2 to QTY1
		MOV shirtquantity,AL		;move final value to QTY
		JMP calcShirt


; convert to decimal
sub shirtQuantity, 30h

calcShirt:
; multplication
mov ax, 0
mov al, shirtQuantity
mul pricePerShirt
mov shirtTotal, ax

; calculation for processing fee
mul [[processingFeePercentage]]
div	hundredDw
mov [processingfee], ax
mov processingFeeFP, dx

;-------COST CALCULATION-------
	
	shirtTotalCalculation:
		xor dx,dx
		
		MOV AX,0 		;clear AX
			
		MOV AX,[shirtTotal]	;dividend divede by divisor to find quotient and remainder
		DIV THOUSAND			;reverse byte sequence : R1(AH) Q1(AL)
		
		MOV [sr1],dx		;store remainder to R1
		MOV sq1,al		;store quotient to Q1
		
	
		MOV AX,0		;clear AX
				xor dx,dx

		MOV ax,sr1		;dividend divede by divisor to find quotient and remainder
		DIV HUNDRED			;reverse byte sequence : R2(AH) Q2(AL)
		
		MOV sr2,AH		;store remainder to R2
		MOV sq2,AL		;store quotient to Q2
			
		MOV AX,0		;clear AX
				xor dx,dx

		MOV AL,sr2		;dividend divede by divisor to find quotient and remainder
		DIV TEN			;reverse byte sequence : R2(AH) Q2(AL)
		
		
			
		MOV sr3,AH		;store remainder to R3
		MOV sq3,AL		;store quotient to Q3
			
			
			;;;; for displaying processing fee
			mov ax,0
			mov ax, [processingfee]
			div [[hundredDw]]
			mov pfq1, al
			mov pfr1, dx
			
			mov ax,0
			mov ax, pfr1
			div [ten]
			mov pfq2, al
			mov pfr2, ah
		
			mov ax, 0
			mov ax, [processingfeefp]
			div [ten]
			mov pfq3, al	
			mov pfr3, ah
			
			;;;;;;;;;;;;;;
			;;;;;;;;;;;;;;; total
			mov ax, [processingfee]
			add ax, [shirttotal]
			mov [shirttotalwithpf], ax
			xor dx,dx
		
		MOV AX,0 		;clear AX
			
		MOV AX,[shirttotalwithpf]	;dividend divede by divisor to find quotient and remainder
		DIV THOUSAND			;reverse byte sequence : R1(AH) Q1(AL)
		
		MOV [str1],dx		;store remainder to R1
		MOV stq1,al		;store quotient to Q1
		
	
		MOV AX,0		;clear AX
				xor dx,dx

		MOV ax,str1		;dividend divede by divisor to find quotient and remainder
		DIV HUNDRED			;reverse byte sequence : R2(AH) Q2(AL)
		
		MOV str2,AH		;store remainder to R2
		MOV stq2,AL		;store quotient to Q2
			
		MOV AX,0		;clear AX
				xor dx,dx

		MOV AL,str2		;dividend divede by divisor to find quotient and remainder
		DIV TEN			;reverse byte sequence : R2(AH) Q2(AL)
		
		
			
		MOV str3,AH		;store remainder to R3
		MOV stq3,AL		;store quotient to Q3
			

			;;;;;;;;;;;;;;;;;;;
		

		ADD sq1,30H		;convert dec to hex
		ADD sq2,30H
		ADD sq3,30H
		ADD sr3,30H

		ADD stq1,30H		;convert dec to hex
		ADD stq2,30H
		ADD stq3,30H
		ADD str3,30H
		ADD pfq1, 30h
		ADD pfq2, 30h
		ADD pfr2, 30h
		ADD pfq3, 30h
		ADD pfr3, 30h
		;ADD [pfpdigit] , 30h
; DISPLAY STRING
mov ah, 09h
lea dx, [buymsg3]
int 21h


		MOV AH,02H
		MOV DL,sq1
		INT 21H
		
		MOV AH,02H
		MOV DL,sq2
		INT 21H
		
		MOV AH,02H
		MOV DL,sq3
		INT 21H
		MOV AH,02H
		MOV DL,sr3
		INT 21H

; NEW LINE
mov ah, 02h
mov dl, 0dh
int 21h
mov dl, 0ah
int 21h
; DISPLAY STRING
mov ah, 09h
lea dx, [buymsg4]
int 21h
; DISPLAY BYTE
mov ah, 02h
mov dl, [pfpdigit]
int 21h
; DISPLAY STRING
mov ah, 09h
lea dx, [[buymsg5]]
int 21h
; display processing fee
		MOV AH,02H	
		MOV DL,pfq1
		INT 21H
		
		MOV AH,02H
		MOV DL,pfq2
		INT 21H
		MOV AH,02H
		MOV DL,pfr2
		INT 21H
		MOV AH,02H
		MOV DL, "."
		INT 21H
		MOV AH,02H
		MOV DL, pfq3
		INT 21H
		MOV AH,02H
		MOV DL, pfr3
		INT 21H
		
; DISPLAY STRING
mov ah, 09h
lea dx, [[buymsg6]]
int 21h

; display total
		
		MOV AH,02H
		MOV DL,stq1
		INT 21H
		
		MOV AH,02H
		MOV DL,stq2
		INT 21H
		
		MOV AH,02H
		MOV DL,stq3
		INT 21H
		MOV AH,02H
		MOV DL,str3
		INT 21H
		MOV DL, "."
		INT 21H
		MOV AH,02H
		MOV DL, pfq3
		INT 21H
		MOV AH,02H
		MOV DL, pfr3
		INT 21H	


; DISPLAY STRING
mov ah, 09h
lea dx, [buymsg7]
int 21h
			JMP page2



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

	
;-------QUANTITY-------

calc_profit_START:
		MOV digit,0		;reset digit

 ;output MSG1
	MOV AH,09H
	LEA DX,MSG1
	INT 21H	
	
 ;input quantity
	MOV AH,0AH
	LEA DX,quantity
	INT 21H

	MOV AL,qtydata[0]
	MOV QTY1,AL
	MOV AL,qtydata[1]
	MOV QTY2,AL

	CMP QTY1,'0'
	JL error_msg
	CMP QTY1,'9'
	JG error_msg
	INC digit
	SUB QTY1,30H	;convert hex to dec for later calculation(can't sub before CMP, it will effect comparison)

	cmp qtydata[1], 13
	je bypassvalidatesecondnum

	VALIDATE_SECOND_NUM:
	CMP QTY2,'0'
	JL error_msg
	CMP QTY2,'9'
	JG error_msg
	INC digit

	SUB QTY2,30H	;convert hex to dec for later calculation(can't sub before CMP, it will effect comparison)

bypassValidateSecondNum:
	;New Line
		MOV AH,02H
		MOV DL,13
		INT 21H
		MOV DL,10
		INT 21H


;-----either one or two digit-----
	
 check:
	CMP digit,1
	JE one_digit
	CMP digit,2
	JE two_digit


	
	; Invalid input
	error_msg:
		MOV AH,09H
		LEA DX,ERROR
		INT 21H

		;New Line
		MOV AH,02H
		MOV DL,13
		INT 21H
		MOV DL,10
		INT 21H

		JMP calc_profit_START
	
	
	one_digit:
		MOV AL,QTY1
		MOV QTY,AL
		JMP input_cost


	two_digit:
		MOV AL,QTY1		
		MUL TEN			;multiply QTY1	
		ADD	AL,QTY2		;add QTY2 to QTY1
		MOV QTY,AL		;move final value to QTY
		JMP input_cost


;--------COST---------
	
	input_cost:
	;output MSG2
		MOV AH,09H
		LEA DX,MSG2
		INT 21H

	;input cost
		MOV AH,01H
		INT 21H
		MOV cost,AL 	;move AL to cost

	;validation
		CMP cost,'0'
		JL error_msg
		CMP cost,'9'
		JG error_msg

		SUB cost,30H 	;convert hex to dec for later calculation


;------------RETAIL PRICE-------------
	input_price:
	;output MSG3
		MOV AH,09H
		LEA DX,MSG3
		INT 21H

	;input price
		MOV AH,01H
		INT 21H
		MOV price,AL	;move AL to price

	;validation
		CMP price,'0'
		JL error_msg
		CMP price,'9'
		JG error_msg

		SUB price,30H ;convert hex to dec for later calculation

		

;-------COST CALCULATION-------
	
	cost_calculation:

		MOV AX,0 		;clear AX
	
		
		MOV AL,QTY 		;move QTY to AL for arithmetic operation

		MUL cost		;multiply with cost to produce total
	
		MOV TTL_cost,AX	;move the total to TTL
		
		MOV AX,0		;clear AX 
		
		MOV AX,TTL_cost	;dividend divede by divisor to find quotient and remainder
		DIV TEN			;reverse byte sequence : R1(AH) Q1(AL)
		
		MOV cR1,AH		;store remainder to R1
		MOV cQ1,AL		;store quotient to Q1
		
		MOV AX,0		;clear AX
		
		MOV AL,cQ1		;dividend divede by divisor to find quotient and remainder
		DIV TEN			;reverse byte sequence : R2(AH) Q2(AL)
		
		MOV cRe2,AH		;store remainder to R2
		MOV cQ2,AL		;store quotient to Q2
			

		ADD cR1,30H		;convert dec to hex
		ADD cRe2,30H
		ADD cQ2,30H

	



 ;-------retail price Calculation----------


	retail_price_calculation:
		MOV AX,0 		;clear AX
	
		
		MOV AL,QTY 		;move QTY to AL for arithmetic operation

		MUL price		;multiply with cost to produce total
		
		MOV TTL_price,AX;move the gross profit to TTL_price
		
		MOV AX,0		;clear AX 
		
		MOV AX,TTL_price;dividend divede by divisor to find quotient and remainder
		DIV TEN			;reverse byte sequence : R1(AH) Q1(AL)
		
		MOV pR1,AH		;store remainder to R1
		MOV pQ1,AL		;store quotient to Q1
		
		MOV AX,0		;clear AX
		
		MOV AL,pQ1		;dividend divede by divisor to find quotient and remainder
		DIV TEN			;reverse byte sequence : R2(AH) Q2(AL)
		
		MOV pR2,AH		;store remainder to R2
		MOV pQ2,AL		;store quotient to Q2
			

		ADD pR1,30H		;convert dec to hex
		ADD pR2,30H
		ADD pQ2,30H


;-------------Compare Retail Price greater than Cost----------------------

	MOV AX,TTL_price
	CMP AX,TTL_cost
	JG profit_calculation
	JL lost_calculation

;----------NET PROFIT CALCULATION---------------

	profit_calculation:
		MOV AX,0			;clear AX

		MOV AX,TTL_price
		SUB AX,TTL_cost		;gross profit - cost
		MOV PROFIT,AX	;move AL into NET_PROFIT

		MOV AX,0  			;clear AX

		MOV AX,PROFIT	;dividend divede by divisor to find quotient and remainder
		DIV TEN

		MOV nR1,AH		;store remainder to R1
		MOV nQ1,AL		;store quotient to Q1

		MOV AX,0

		MOV AL,nQ1
		DIV TEN

		MOV nR2,AH		;store remainder to R2
		MOV nQ2,AL		;store quotient to Q2

		ADD nR1,30H		;convert dex to hex
		ADD nR2,30H
		ADD nQ2,30H

		JMP display_result


;----------TOTAL LOST CALCULAION---------------

	lost_calculation:
	MOV AX,0

	MOV AX,TTL_cost
	SUB AX,TTL_price
	MOV LOST,AX

	MOV AX,0

	MOV AX,LOST
	DIV TEN

	MOV lR1,AH		;store remainder to R1
	MOV lQ1,AL		;store quotient to Q1

	MOV AX,0

	MOV AL,lQ1
	DIV TEN

	MOV lR2,AH		;store remainder to R2
	MOV lQ2,AL		;store quotient to Q2

	ADD lR1,30H		;convert dex to hex
	ADD lR2,30H
	ADD lQ2,30H

 ;-------OUTPUT--------
 
 display_result:

 ;output MSG4 (Total Cost)
		MOV AH,09H		
		LEA DX,MSG4
		INT 21H
		
		MOV AH,02H
		MOV DL,cQ2
		INT 21H
		
		MOV AH,02H
		MOV DL,cRe2
		INT 21H
		
		MOV AH,02H
		MOV DL,cR1
		INT 21H

 ;output MSG5 (Total Gross Profit)
		MOV AH,09H		
		LEA DX,MSG5
		INT 21H
		
		MOV AH,02H
		MOV DL,pQ2
		INT 21H
		
		MOV AH,02H
		MOV DL,pR2
		INT 21H
		
		MOV AH,02H
		MOV DL,pR1
		INT 21H

	MOV AX,TTL_price
	CMP AX,TTL_cost
	JL lost_result

 ;output MSG6 (Net Profit)
	profit_result:
		MOV AH,09H
		LEA DX,MSG6
		INT 21H

		MOV AH,02H
		MOV DL,nQ2
		INT 21H
		
		MOV AH,02H
		MOV DL,nR2
		INT 21H
		
		MOV AH,02H
		MOV DL,nR1
		INT 21H

		JMP page2

 ;output MSG6 (Net Profit)
	lost_result:
		MOV AH,09H
		LEA DX,MSG7
		INT 21H

		MOV AH,02H
		MOV DL,lQ2
		INT 21H
		
		MOV AH,02H
		MOV DL,lR2
		INT 21H
		
		MOV AH,02H
		MOV DL,lR1
		INT 21H

		JMP page2

exit:
    ; DISPLAY STRING
mov ah, 09h
lea dx, exitMsg
int 21h



; EXIT
mov ah, 4ch
int 21h

main ENDP

;Display Part
DISP PROC
MOV DL,BH      ; Since the values are in BX, BH Part
ADD DL,30H     ; ASCII Adjustment
MOV AH,02H     ; To Print in DOS
INT 21H
MOV DL,BL      ; BL Part 
ADD DL,30H     ; ASCII Adjustment
MOV AH,02H     ; To Print in DOS
INT 21H
RET
DISP ENDP      ; End Disp Procedure
END main
