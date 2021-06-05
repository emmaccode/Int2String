; Int2String.asm (32-bit)
; Programmed by Emmett Boudureau
;
; This software is MIT-licensed. The creator
; has chosen for this software to be free.
;
; Written Jun 5, 2021
string_to_int:
  xor ebx,ebx    ; clear ebx
.next_digit:
  movzx eax,byte[esi]
  inc esi
  sub al,'0'    ; convert from ASCII to number
  imul ebx,10
  add ebx,eax   ; ebx = ebx*10 + eax
  loop .next_digit  ; while (--ecx)
  mov eax,ebx
  ret

int_to_string:
  add esi,9
  mov byte [esi],STRING_TERMINATOR

  mov ebx,10
.next_digit:
  xor edx,edx         ; Clear edx prior to dividing edx:eax by ebx
  div ebx             ; eax /= 10
  add dl,'0'          ; Convert the remainder to ASCII
  dec esi             ; store characters in reverse order
  mov [esi],dl
  test eax,eax
  jnz .next_digit     ; Repeat until eax==0
  mov eax,esi
  ret
