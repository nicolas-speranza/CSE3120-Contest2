INCLUDE Irvine32.inc

.data
titleMsg BYTE "BYTE HOPPER",0
startMsg BYTE "Press any key to start...",0
topBorder BYTE "+----------------------------------------+",0
midBorder BYTE "|                                        |",0
botBorder BYTE "+----------------------------------------+",0
playerCh BYTE "@",0
playerX BYTE 40
playerY BYTE 3
moveMsg BYTE "Use WASD to move",0
quitMsg BYTE "Press Q to quit",0
laneMsg BYTE "Avoid traffic and reach the top",0
startPrompt BYTE "Press any key to begin",0

.code
main PROC
    call Clrscr

    mov dh,2
    mov dl,20
    call Gotoxy
    mov edx,OFFSET topBorder
    call WriteString

    mov dh,3
    mov dl,20
    call Gotoxy
    mov edx,OFFSET midBorder
    call WriteString

    mov dh,4
    mov dl,20
    call Gotoxy
    mov edx,OFFSET botBorder
    call WriteString

    mov dh,playerY
    mov dl,playerX
    call Gotoxy
    mov edx,OFFSET playerCh
    call WriteString

    mov dh,6
    mov dl,31
    call Gotoxy
    mov edx,OFFSET titleMsg
    call WriteString

    mov dh,8
    mov dl,24
    call Gotoxy
    mov edx,OFFSET startMsg
    call WriteString

    mov dh,9
    mov dl,28
    call Gotoxy
    mov edx,OFFSET moveMsg
    call WriteString

    mov dh,10
    mov dl,28
    call Gotoxy
    mov edx,OFFSET quitMsg
    call WriteString

    mov dh,11
    mov dl,22
    call Gotoxy
    mov edx,OFFSET laneMsg
    call WriteString

    mov dh,13
    mov dl,24
    call Gotoxy
    mov edx,OFFSET startPrompt
    call WriteString

    call ReadChar
    exit

main ENDP
END main
