; Int2String.asm (64-bit)
; Programmed by Emmett Boudureau
;
; This software is MIT-licensed. The creator
; has chosen for this software to be free.
;
; Written Jun 5, 2021

string_to_int:
  xor rbx,rbx    ; clear rbx
.next_digit:
  movzx rax,byte[rsi]
  inc rsi
  sub al,'0'    ; convert from ASCII to number
  imul rbx,10
  add rbx,rax   ; rbx = rbx*10 + rax
  loop .next_digit  ; while (--rcx)
  mov rax,rbx
  ret

int_to_string:
  add rsi,9
  mov byte [rsi],STRING_TERMINATOR

  mov rbx,10
.next_digit:
  xor rdx,rdx         ; Clear rdx prior to dividing rdx:rax by rbx
  div rbx             ; rax /= 10
  add dl,'0'          ; Convert the remainder to ASCII
  dec rsi             ; store characters in reverse order
  mov [rsi],dl
  test rax,rax
  jnz .next_digit     ; Repeat until rax==0
  mov rax,rsi
  ret
