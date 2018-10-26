; Name: Yost
; Title: Lab 10
; Date: 22 Oct 2018

bits 64

global first_func, second_func, third_func

first_func:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    Using the rdtsc instruction,
;  1.) Obtain the current timestamp
;  2.) Combine the low 32 bits (from RAX)
;     and the high 32 bits (RDX), and
;     return them.
;
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
xor rax, rax                ;clear registers
xor rdx, rdx

rdtsc                       ;get time stamp, puts low bits in eax and high bits in edx

shl rdx, 32                 ;shift rdx left 32 bits
add rax, rdx                 ;combine high and low bits
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ret

second_func:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   Using CPUID, get the vendor
;  string, and copy each chunk
;  returned into the buffer
;  passed to your function.
;  The buffer should be the
;  first (and only) argument.
; 
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
xor eax, eax                ;clear registers
xor ebx, ebx
xor ecx, ecx
xor edx, edx

mov eax, 0x0                ;set eax to 0, cpuid returns vendor ID string in this order: ebx, edx, ecx

cpuid                       ;puts vendor ID string into rbx/rdx/rcx
mov eax, ebx                ;copy first chunk of vendor ID into eax
stosd                       ;stores double word (16 bit) from eax to rdi/buffer
mov eax, edx                ;put second chunk into eax
stosd                       ;put second cnunk into buffer
mov eax, ecx                ;put third chunk into eax
stosd                       ;put third chunk into buffer

;this works too (replace code after "mov eax, 0x0"):
;mov [rdi], ebx
;mov [rdi+4], edx
;mov [rdi+8], ecx
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ret


