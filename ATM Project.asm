.model small
.stack 100h 
.data 
;Passswoed Property
a db 10,13,"Enter Your Password:$" 
b db 10,13,"Invalid Password$" 
pass db "towheed$" 
pass1 dw 7

;Option Property
wel db 10,13,"                   Welcome to Your Account $"
bal db 10,13,10,13,"1. Balance Inquiry $" 
with db 10,13,"2. Money Withdraw $" 
trans db 10,13,"3. Transfer Money $" 
ex db 10,13,"4. Exit $"
bac db 10,13,"1. Back$" 
ext db 10,13,"2. Exit$"

;Message Property 
thank db 10,13,10,13,"                   Thank You For Banking With Us. $"
inval db 10,13,"Invalid Input$"
new db 10,13,"$"

totalbal db 10,13,"Your Total Balance is: 25,000 USD $" 
availablebal db 10,13,"Your Available Balance is: 24,900 USD $"  

;Money Withdrow Option
fivehun db 10,13,"1. 500 USD$" 
one db 10,13,"2. 1,000 USD$"
three db 10,13,"3. 3,000 USD$"
five db 10,13,"4. 5,000 USD$"
ten db 10,13,"5. 10,000 USD$"
fiften db 10,13,"6. 15,000 USD$"
tweenty db 10,13,"7. 20,000 USD$"

;Balance info
t1 db 10,13,"Your Total Balance is: 24,500 USD $" 
av1 db 10,13,"Your Available Balance is: 24,400 USD $"

t2 db 10,13,"Your Total Balance is: 24,000 USD $" 
av2 db 10,13,"Your Available Balance is: 23,900 USD $"

t3 db 10,13,"Your Total Balance is: 22,000 USD $" 
av3 db 10,13,"Your Available Balance is: 21,900 USD $"

t4 db 10,13,"Your Total Balance is: 20,000 USD $" 
av4 db 10,13,"Your Available Balance is: 19,900 USD $"

t5 db 10,13,"Your Total Balance is: 15,000 USD $" 
av5 db 10,13,"Your Available Balance is: 14,900 USD $"

t6 db 10,13,"Your Total Balance is: 10,000 USD $" 
av6 db 10,13,"Your Available Balance is: 9,900 USD $"

t7 db 10,13,"Your Total Balance is: 5,000 USD $" 
av7 db 10,13,"Your Available Balance is: 4,900 USD $" 


;Amount Property
wdamount db 10,13,"Enter Your Withdrow Amount$" 
tranamount db 10,13,"Enter Your Transaction Amount$"  
success db 10,13,"Your Transaction is Successfull...$" 
accountnum db 10,13,"Enter Account Number: $"

.code
main proc
    mov ax,@data
    mov ds,ax 
    
    
    ;Password Cheek Level
    mov cx,pass1
    mov bx,offset pass
    
    mov ah,9
    lea dx,a
    int 21h
    
    cheekpass:
    mov ah,8
    int 21h
    
    cmp al,[bx] 
    jne worng
    mov ah,2
    mov dl,42
    int 21h
    inc bx
    loop cheekpass
    mov ah,0x00
    mov al,0x03
    int 0x10
    jmp mainpross
    
    
    ;Worng Password Level
    worng:
    mov ah,0x00
    mov al,0x03
    int 0x10 
    mov ah,9
    lea dx,b
    int 21h
    mov ah,4ch
    int 21h
    
    
    
    ;Account Option
    mainpross:
    mov ah,9
    lea dx,wel
    int 21h 
    mov ah,9
    lea dx,bal
    int 21h
    mov ah,9
    lea dx,with
    int 21h
    mov ah,9
    lea dx,trans
    int 21h 
    mov ah,9
    lea dx,ex
    int 21h 
    mov ah,9
    lea dx,new
    int 21h
    mov ah,1
    int 21h
    mov bl,al
    
    
    ;Input Cheek 
    cheek:
    cmp bl,49 
    je blance
    cmp bl,50 
    je withdraw
    cmp bl,51 
    je Transfer
    cmp bl,52 
    je exit
    jmp err
    
    
    ;Account Balance Cheek Level
    blance:
    mov ah,0x00
    mov al,0x03
    int 0x10 
    mov ah,9
    lea dx,totalbal
    int 21h 
    mov ah,9
    lea dx,availablebal
    int 21h
    jmp option
    
     
     
    
     
     
    ;Money Withdrow Level
    withdraw:
    mov ah,0x00
    mov al,0x03
    int 0x10
    mov ah,9
    lea dx,new
    int 21h
    mov ah,9
    lea dx,wdamount
    int 21h  
    
    ;Money Withdrow Option Display
    mov ah,9
    lea dx,fivehun
    int 21h
    
    mov ah,9
    lea dx,one
    int 21h 
    
    mov ah,9
    lea dx,three
    int 21h
    
    mov ah,9
    lea dx,five
    int 21h
    
    mov ah,9
    lea dx,ten
    int 21h
    
    mov ah,9
    lea dx,fiften
    int 21h
    
    mov ah,9
    lea dx,tweenty
    int 21h
    
    mov ah,9
    lea dx,new
    int 21h
    mov ah,1
    int 21h
    mov bl,al 
    
    ;Input Condition Cheek
    cmp bl,49 
    je pross1 
    
    cmp bl,50 
    je pross2
    
    cmp bl,51 
    je pross3
    
    cmp bl,52
    je pross4  
    
    cmp bl,53
    je pross5
    
    cmp bl,54
    je pross6
    
    cmp bl,55
    je pross7
    jmp err
    
    
    ;Option 1
    pross1:
    mov ah,0x00
    mov al,0x03
    int 0x10 
    mov ah,9
    lea dx,success
    int 21h 
    mov ah,9
    lea dx,new
    int 21h
    mov ah,9
    lea dx,new
    int 21h
    
    mov ah,9
    lea dx,t1
    int 21h 
    mov ah,9
    lea dx,av1
    int 21h 
    mov ah,9
    lea dx,new
    int 21h
    jmp option
    
    ;Option 2
    pross2:
    mov ah,0x00
    mov al,0x03
    int 0x10
    mov ah,9
    lea dx,success
    int 21h 
    mov ah,9
    lea dx,new
    int 21h
    mov ah,9
    lea dx,new
    int 21h 
    
    mov ah,9
    lea dx,t2
    int 21h 
    mov ah,9
    lea dx,av2
    int 21h 
    mov ah,9
    lea dx,new
    int 21h
    jmp option
    
    ;Option 3
    pross3:
    mov ah,0x00
    mov al,0x03
    int 0x10
    mov ah,9
    lea dx,success
    int 21h 
    mov ah,9
    lea dx,new
    int 21h
    mov ah,9
    lea dx,new
    int 21h 
    
    mov ah,9
    lea dx,t3
    int 21h 
    mov ah,9
    lea dx,av3
    int 21h 
    mov ah,9
    lea dx,new
    int 21h
    jmp option
    
    ;Option 4
    pross4:
    mov ah,0x00
    mov al,0x03
    int 0x10
    mov ah,9
    lea dx,success
    int 21h 
    mov ah,9
    lea dx,new
    int 21h
    mov ah,9
    lea dx,new
    int 21h 
    
    mov ah,9
    lea dx,t4
    int 21h 
    mov ah,9
    lea dx,av4
    int 21h 
    mov ah,9
    lea dx,new
    int 21h
    jmp option
    
    ;Option 5
    pross5:
    mov ah,0x00
    mov al,0x03
    int 0x10 
    mov ah,9
    lea dx,success
    int 21h 
    mov ah,9
    lea dx,new
    int 21h
    mov ah,9
    lea dx,new
    int 21h 
    
    mov ah,9
    lea dx,t5
    int 21h 
    mov ah,9
    lea dx,av5
    int 21h 
    mov ah,9
    lea dx,new
    int 21h
    jmp option
    
    ;Option 6
    pross6:
    mov ah,0x00
    mov al,0x03
    int 0x10 
    mov ah,9
    lea dx,success
    int 21h 
    mov ah,9
    lea dx,new
    int 21h
    mov ah,9
    lea dx,new
    int 21h  
    
    mov ah,9
    lea dx,t6
    int 21h 
    mov ah,9
    lea dx,av6
    int 21h 
    mov ah,9
    lea dx,new
    int 21h
    jmp option 
    
    ;Option 7
    pross7:
    mov ah,0x00
    mov al,0x03
    int 0x10
    mov ah,9
    lea dx,success
    int 21h 
    mov ah,9
    lea dx,new
    int 21h
    mov ah,9
    lea dx,new
    int 21h
    
    mov ah,9
    lea dx,t7
    int 21h 
    mov ah,9
    lea dx,av7
    int 21h 
    mov ah,9
    lea dx,new
    int 21h
    jmp option
    
    
    
 
    
    
    ;Balance Transfer Level
    Transfer:
    mov ah,0x00
    mov al,0x03
    int 0x10
    mov ah,9
    lea dx,accountnum
    int 21h
    
    mov ah,1
    acco:  
    int 21h 
    cmp al,13
    jne acco   
    
    mov ah,9
    lea dx,new
    int 21h 
    
    
    ;Again Password Cheek
    mov ah,9
    lea dx,a
    int 21h   
    
    mov cx,pass1
    mov bx,offset pass
    
    again:
    mov ah,8
    int 21h
    
    cmp al,[bx] 
    jne worng
    mov ah,2
    mov dl,42
    int 21h
    inc bx
    loop again
    mov ah,0x00
    mov al,0x03
    int 0x10 
    jmp transferpross
    
    
    ;Money Transfer Proccess
    transferpross:
    mov ah,9
    lea dx,tranamount
    int 21h  
    ;Transfer Amount Display
    mov ah,9
    lea dx,fivehun
    int 21h
    
    mov ah,9
    lea dx,one
    int 21h 
    
    mov ah,9
    lea dx,three
    int 21h
    
    mov ah,9
    lea dx,five
    int 21h
    
    mov ah,9
    lea dx,ten
    int 21h
    
    mov ah,9
    lea dx,fiften
    int 21h
    
    mov ah,9
    lea dx,tweenty
    int 21h
    
    mov ah,9
    lea dx,new
    int 21h
    mov ah,1
    int 21h
    mov bl,al 
    
    ;Input Condition Cheek
    cmp bl,49 
    je pross1 
    
    cmp bl,50 
    je pross2
    
    cmp bl,51 
    je pross3
    
    cmp bl,52
    je pross4  
    
    cmp bl,53
    je pross5
    
    cmp bl,54
    je pross6
    
    cmp bl,55
    je pross7
    jmp err
     
    
    
    
    
    ;Back And Exit Option Level
    option: 
    mov ah,9
    lea dx,new
    int 21h
    mov ah,9
    lea dx,bac
    int 21h
    mov ah,9
    lea dx,ext
    int 21h
    mov ah,9
    lea dx,new
    int 21h
    mov ah,1
    int 21h
    cmp al,49
    je back
    cmp al,50
    je exit
    jmp err
    
      
    
    ;back Option Level
    back:
    mov ah,0x00
    mov al,0x03
    int 0x10
    call mainpross
    
    
    ;Input Error Level
    err:
    mov ah,0x00
    mov al,0x03
    int 0x10 
    mov ah,9
    lea dx,inval
    int 21h 
    mov ah,9
    lea dx,new
    int 21h  
    call mainpross
  
    
    ;DOS Exit Level
    exit:
    mov ah,0x00
    mov al,0x03
    int 0x10
    mov ah,9
    lea dx,thank
    int 21h 
    mov ah,4ch
    int 21h
    main endp
end main 
  