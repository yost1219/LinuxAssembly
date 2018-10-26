; Author: Yost
; Title: Lab 6
; Date: 15 Oct 2018
bits 64

global first_func, second_func, third_func

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; INSTRUCTIONS
; -Set the flags via by arithmetic operation
; -Then set the flags manually*
; *You will need to comment out the previous solution 


first_func:
    push rbp
    mov rbp, rsp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Set the carry flag.
;  Carry is 9th bit
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
pushf ;push flags to stack
pop rax ;pop flags into rax
or rax, 0x01 ;set first bit of rax to 1
push rax ;push rax onto stack
popf ;take value of rax and put it into flags (first bit on)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    pop rbp
    ret

second_func:
    push rbp
    mov rbp, rsp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Set the overflow flag.
;  Overflow is 20th bit
;  BEGIN student code
pushf ;push flags to stack
pop rax ;pop flags into rax
or rax, 0x800 ;set 12th bit of rax to 1
push rax ;push rax onto stack
popf ;take value of rax and put it into flags (12th bit on)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    pop rbp
    ret

third_func:
    push rbp
    mov rbp, rsp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Set both the carry and overflow
;  flags.
;  Carry is 9th bit, overflow is 20th bit
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
pushf ;push flags to stack
pop rax ;pop flags into rax
or rax, 0x801 ;set 12th and first bit of rax to 1
push rax ;push rax onto stack
popf ;take value of rax and put it into flags (12th and first bit on)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    pop rbp
    ret


