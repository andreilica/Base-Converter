%include "io.inc"

section .data
    %include "input.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp
    mov edx, nums_array ;stocare vector cu numerele de transformat
    mov ebx, base_array ;stocare vector cu bazele de numeratie
    mov ecx, [nums] ;stocare dimensiune vectori

parcurgere:        
    
    push edx ;pastrare edx(primul vector)
    push ecx ;pastrare ecx(dimensiune vectori)
    xor ecx, ecx            
    mov eax, [edx] 
    ;Verificare validitate a bazei
    cmp dword [ebx], 2
    jb notvalid
    cmp dword [ebx], 16
    ja notvalid
    
    
base: 
    ; impartire numar la baza pana cand catul devine 0 si pastrare resturi pe stiva
    xor edx, edx
    div dword [ebx]
    push edx
    inc ecx
    cmp eax, 0
    jnz base

stack_pop:
    ;scoaterea resturilor de pe stiva si printarea acestora corespunzator
    pop edx
    
    ;afisare caractere pentru resturi >= 10
    cmp edx, 10
    je printA
    cmp edx, 11
    je printB
    cmp edx, 12
    je printC
    cmp edx, 13
    je printD
    cmp edx, 14
    je printE
    cmp edx, 15
    je printF
    
    PRINT_DEC 4, edx
    dec ecx
    jnz stack_pop
    NEWLINE

increment:
    ;trecerea la urmatorul element din ambii vectori
    pop ecx
    pop edx
    add edx, 4
    add ebx, 4
    dec ecx
    jnz parcurgere
    
    jmp finish

;printare caractere corespunzatoare
printA:
    PRINT_CHAR 'a'
    dec ecx
    cmp ecx, 0
    jnz stack_pop
    NEWLINE
    jmp increment
 
printB:
    PRINT_CHAR 'b'
    dec ecx
    cmp ecx, 0
    jnz stack_pop
    NEWLINE
    jmp increment
    
printC:
    PRINT_CHAR 'c'
    dec ecx
    cmp ecx, 0
    jnz stack_pop
    NEWLINE
    jmp increment
    
printD:
    PRINT_CHAR 'd'
    dec ecx
    cmp ecx, 0
    jnz stack_pop
    NEWLINE
    jmp increment
    
printE:
    PRINT_CHAR 'e'
    dec ecx
    cmp ecx, 0
    jnz stack_pop
    NEWLINE
    jmp increment
    
printF:
    PRINT_CHAR 'f'
    dec ecx
    cmp ecx, 0
    jnz stack_pop
    NEWLINE
    jmp increment

;printarea mesajului corespunzator in cazul unei baze invalide
notvalid:
    PRINT_STRING "Baza incorecta"
    NEWLINE
    jmp increment
    
finish:
    ret