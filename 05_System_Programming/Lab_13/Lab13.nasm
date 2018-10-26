bits 64

; LABS
global ex_strlen, ex_memcpy, ex_memset, ex_memcmp, ex_memchr, ex_strchr, ex_strcmp, ex_strcpy, ex_atoi
global ex_strstr, find_largest, walk_list

; BONUS LABS
global ex_isort, ex_qsort


find_largest:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  This function takes two arguments:
;  - Arg1: A pointer to an array of integers - rdi
;  - Arg2: The number of integers in the array - rsi
; arg order: rdi, rsi, rdx, rcx, r8, r9
;  Find and return the largest element in the array.
;  
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
xor eax, eax                    ;largest, return
xor rcx, rcx                    ;counter
;rdi is array of integers
;rsi is size of array


.work:
  cmp rsi, rcx                  ;are you at the last item?
  je .end                       ;yes

  mov edx, [rdi+rcx*4]          ;store next value in rdx
 
  inc rcx
  cmp eax, edx                  ;compare current with next
  ja .work                      ;current is larger

  mov eax, edx                  ;next is larger
  jmp .work

.end:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ret

ex_strlen:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  size_t strlen(char*);  
;
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;pass one argument (string as rdi) and return the length (rax)

;Returns the length of the C string str.
;The length of a C string is determined by the terminating 
;null-character: A C string is as long as the number of characters 
;between the beginning of the string and the terminating null 
;character (without including the terminating null character 
;itself).

;xor rax, rax                ;string length

;.strlen:
;  mov rdx, [rdi+rax]        ;put next index in rdx
;  cmp rdx, 0x0              ;is char null?
;  je .end                   ;if null go to end
;  inc rax                   ;count
;  jmp .strlen

;.end:

xor ecx, ecx                ;clear dec
xor eax, eax                ;clear inc
not ecx                     ;flip all bits to 1
repne scasb                 ;scan from input until null, decrementing ecx
not ecx                     ;flip bits to get count
mov eax, ecx                ;put count into eax
dec eax                     ;minus one for null char

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ret

ex_memcpy:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  void memcpy(void* dst, void* src, int count);
;
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov rcx, rdx                ;move 3rd param to counter
rep movsb                   ;repeat rcx times: move source to dest
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ret


ex_memset:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	void memset(void* buf, unsigned char value, size_t length);
;
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov rax, rsi                ;move 2nd param to rax
mov rcx, rdx                ;move 3rd param to counter
rep stosb                   ;repeat rcx times: store rax into 1st param
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ret

ex_memchr:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	void* memchr(void* haystack, unsigned char needle, size_t length);
;
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov rax, rsi                ;move 2nd param to rax
mov rcx, rdx                ;move 3rd param to counter
mov rbx, rdx                ;move 3rd param to another var

repne scasb                 ;scan haystack until you find needle or null
jne .not_found              ;if you get to null then needle isn't in this haystack

lea rax, [rdi-1]            ;put address into rax
jmp .end

.not_found:
  xor rax, rax              ;return null if no needle found

.end:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ret

ex_memcmp:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	int memcmp(void*, void*, size_t length);
;
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov rax, rsi                ;put 2nd param into rax
mov rcx, rdx                ;put 3rd param into counter
mov rbx, rdx                ;put 3rd param to another var

repne cmpsb                 ;compare first and second params until they don't match, keep count
jne .match                  ;if you get to null and everything matches

xor rax, rax                ;return null if they don't match
jmp .end                        

.match:
  sub rdx, rbx              ;remove count from strlen for position
  mov rax, rdx              ;put position into return

.end:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ret

ex_strchr:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; search string for character and return position of first
; occurence of the character
;Arg1 - rdi is string (haystack)
;Arg2 - rsi is character (needle)
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;xor rax, rax                ;needle position

;.find_needle:
;  mov rdx, [rdi+rax]        ;look at char
;  cmp rdx, 0x0              ;is it null?
;  je .not_found             ;yes, needle not found
;  cmp rsi, rdx              ;is it the needle?
;  je .end                   ;yes, needle found
;  inc rax
;  jmp .find_needle

;.not_found:
;  mov rax, 0x0              ;if not found, return null pointer

;.end:

push rdi                    ;move haystack onto stack
mov rax, rdi                ;put haystack into rax
call ex_strlen              ;get string length or rax, putting into rax
mov rcx, rax                ;put strlen of rdi into rcx
pop rdi                     ;pop string back off stack               
mov rax, rsi                ;put needle into rax
repne scasb                 ;scan string until you find rax or null char
jne .set                    ;if you find null char first
mov rax, rdi                ;if you find needle first, put count into rax
dec rax                     ;sub 1 for null char
jmp .end                    
.set:
  mov rax, 0                  ;return null if needle not found
.end:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ret

ex_strcmp:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; compare two strings to see if they are identical
; ret 0 if strings are equal
; ret <0 if first non-matching value is lower in string 1
; ret >0 if first non-matching value is greater in string 1
;Arg1 - rdi is string 1
;Arg2 - rsi is string 2
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
xor rcx, rcx                ;counter

.compare:
  mov rbx, [rdi+rcx]        ;string 1
  mov rdx, [rsi+rcx]        ;string 2
  inc rcx                   ;count up
  cmp rbx, rdx              ;compare
  ja .first                 ;first value larger
  jb .second                ;second value larger
  cmp rbx, 0x0              ;all same, null term?
  je .same                  ;made it through both strings, all even
  jmp .compare

.first:
  mov rax, 1                ;ret 1 if first non-match is greater in string 1
  jmp .end

.second:
  mov rax, -1               ;ret -1 if first non-match is less in string 1
  jmp .end

.same:
  mov rax, 0                ;ret 0 if strings are equal

.end:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ret

ex_strcpy:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Copies the C string pointed by source into the array pointed 
;by destination, including the 
;terminating null character (and stopping at that point).
;Arg1 is destination - rdi, copy to
;Arg2 is source - rsi, copy from
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;xor rcx, rcx                ;counter
;xor rax, rax
;xor rdi, rdi

;.copy:
;  mov rbx, [rsi+rcx]        ;copy char of rsi
;  cmp rbx, 0x0              ;have you found null term?
;  jz .end                   ;yes, go to end
;  mov [rdi+rcx], rbx        ;no, copy into rdi
;  inc rcx
;  jmp .copy

;.end:

xor rax, rax                ;clear counter
xor rbx, rbx                
mov rbx, rdi                ;dest
xor rdi, rdi
mov rdi, rsi                ;move source to dest
call ex_strlen              ;get length of source string, put into rax
xor rcx, rcx                ;counter
mov rcx, rax                ;put strlen into counter
xor rdi, rdi                ;clear dest buffer
mov rdi, rbx                ;put original rdi back into rdi            
rep movsb                   ;mov bytes from rsi to rdi (strlen # of times)
xor rax, rax                
stosb                       ;store rax in rdi
mov rax, rbx                ;put rdi back into rax

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  |-- |      |--- |    |\     |    |   |   |-------
;  |   |      |    |    | \    |    |   |   |
;  |---- |    |    |    |  \   |    |   |   |_______
;  |     |    |    |    |   \  |    |   |           |
;  |     |    |    |    |    \ |    |   |           |
;  |____ |    |___ |    |     \|    |___|   ________|
;
;
;        |           |------ |   |------ |     |-------
;        |           |       |   |       |     |_______
;        |           |------ |   |-------- |           |
;        |           |       |   |         |           |
;        |_______    |       |   |_________|   ________|
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


ex_atoi:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ret


ex_strstr:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ret


struc Node
	.Next	resq	1
	.Data	resq	1
endstruc

 walk_list:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ret


ex_isort:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  insertion_sort.c is provided
;  to give an example implementation.
;
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ret


ex_qsort:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  BEGIN student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  END student code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ret
