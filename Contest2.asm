INCLUDE Irvine32.inc

.data
titleMsg BYTE "BYTE HOPPER",0
startMsg BYTE "Press any key to start...",0

.code
main PROC
    call Clrscr
    mov dh,10
    mov dl,30
    call Gotoxy
    mov edx,OFFSET titleMsg
    call WriteString

    mov dh,12
    mov dl,24
    call Gotoxy
    mov edx,OFFSET startMsg
    call WriteString

    call ReadChar
    exit

main ENDP
END main
