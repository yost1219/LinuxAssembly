bits 64

global first_func, second_func, third_func

extern printf
mystr  db "Success!", 0xa, 0x00

first_func:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  The function printf has been
;  externed in (above). Call it,
;  passing mystr (also defined
;  above), as its only argument.
;
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
xor rax, rax ;clear out any residual data
mov rdi, mystr ;put the string into rdi
call printf ;call the function to print rdi into rax
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ret

extern strlen

second_func:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   Your function will be called
;  with two arguments: a function
;  pointer (the first parameter),
;  and a string (the second). The
;  function pointer takes two
;  arguments: a string, and a length.
;  You will need to call strlen
;  (above), passing in the string,
;  and pass the results to the
;  function pointer (along with the
;  string). Return the string you get
;  back from the function. 
;
;  This lab requires a lot of instructions
;
;  It may be wise to seperate the instructions
;  into logical sections. 
;
;  -Very first thing you need to do is figure out calling convention
;  -You will first need to ensure you preserve values
;  -Then you will need to get the string length of the string provided via argument
;  -After which, you need to pass the string and string length to the 
;   function pointer and then call the function pointer.
;  
;  HINTS: 
;  - Preserve values, you will def need to preserve function pointer for call
;  - Some arguments will need to be preserved/reassigned to different registers
;    in order to be passed/called later. 
;
; 
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
xor rax, rax ;dump previous return ,mystr is already in rdi
push rdi ;move rdi onto the stack to preserve value
mov rdi, rsi 
call strlen ;get strlen of rdi, returning rax (strlen)
mov rsi, rax ;pass strlen to rsi
pop rdx ;pop return to rdx
xor rax, rax ;dump again
call rdx 
;.start:
;push rdi
;.get_strlen:
;mov rdi, rsi
;xor rax, rax
;call strlen
;.get_new_string:
;xor rcx, rcx
;pop rdi
;mov rcx, rdi
;push rcx
;push rsi
;mov rdi, rsi
;mov rsi, rax
;call rcx
;.end:
;pop rsi
;pop rdi
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ret

third_func:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   Calculate the Nth fibonacci
;  number (where N is the value
;  passed to your method as the
;  only parameter).
;
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
xor rax, rax ;dump rax
xor rcx, rcx ;clear count
xor rdx, rdx ;first value
mov rsi, 1
dec rdi
.loop:
  mov rax, rdx ;initialize rax for n=1
  add rax, rsi ;add next value (1 for n=1)
  mov rdx, rsi ;now first holder is second value
  mov rsi, rax ;second holder is next value
  inc rcx ;counter up
  cmp rcx, rdi ; have you gotten to n terms yet?
  jb .loop ;if not, restart loop

;mov rcx, rdi
;sub rcx, q
;mov r12, 0
;mov r13, 1
;.fib:
;xor rax, rax
;add rax, r12
;add rax, r13
;mov r12, r13
;mov r13, rax
;loop .fib

;mov rcx, rdi
;mov rax, 0
;mov rdx, 1
;fibloop:
;xadd rax, rdx ;xadd exchanges the values in its two operands, and then adds them together and writes the result into the de...
;loop fibloop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ret


