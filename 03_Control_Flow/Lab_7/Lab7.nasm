; Author: Yost
; Title: Lab 7
; Date: 16 Oct 2018
bits 64

global first_func, second_func, third_func

first_func:
    push rbp
    mov rbp, rsp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Two values have been provided,
;  with the first stored in RDI,
;  and the second in RSI. If the 
;  first is greater than the second,
;  set RAX equal to 1, if the second
;  is greater than the first, set
;  RAX equal to -1. If they are
;  both equal, set RAX to 0.
;
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cmp rdi, rsi
je .zero ;if equal
ja .greater ;if rdi is greater
mov rax, -1 ;default case, if rsi is greater
jmp .end ;need to jump over .zero and .greater
.zero:
  mov rax, 0
  jmp .end ;need to jump over .greater
.greater:
  mov rax, 1
.end:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    pop rbp
    ret

second_func:
    push rbp
    mov rbp, rsp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   You have been provided with
;  a pointer to the start of an
;  array of numbers in RDI, and
;  the number of elements in the
;  array in RSI. Loop through the
;  array, adding all the numbers
;  together, and store the result
;  in RAX.
;
;  HINT:
;  NASM increments arrays by bytes, not bits
;  - ints are generally 4 bytes in size
;
;  Two ways to increment pointer:
;  1: Add 4 to pointer directly
;  2: Use incrementer and work within reference directly ex. 
;     add reg, [regb + regc*4]
;  Feel free to look this up more!
;  
;
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
xor rax, rax ;ensure rax is zero (only need lower register)
xor rcx, rcx ;set rcx to zero
.loop:
 add ax, [rdi+4*rcx] ;add value to ax (looks at next int based on iteration)
 cmp rcx, rsi ;have you looped rsi # of times?
 je .end ;get out of loop when they are equal
 add rcx, 1 ;increment
 jmp .loop ;go back to loop
.end:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    pop rbp
    ret

third_func:
    push rbp
    mov rbp, rsp
    xor rax, rax
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Find the length of the
;  provided, NULL-terminated 
;  string (a pointer to the 
;  beginning of which is 
;  currently stored in RDI),
;  and store the result in RAX.
;
;  BEGIN student code
;
;  HINT: 
;  Just like with second_func, except now we are dealing with chars
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
xor rax, rax ;zeroize rax
xor rcx, rcx
.loop:
  cmp [rdi+rax], rcx ;is the char null?
  je .end ; if yes go to end
  inc rax ;increment counter
  jmp .loop ; go back to loop
.end:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    pop rbp
    ret


