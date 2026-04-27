INCLUDE Irvine32.inc

.data
titleMsg BYTE "BYTE HOPPER",0
startMsg BYTE "Press any key to start...",0
topBorder BYTE "+----------------------------------------+",0
midBorder BYTE "|                                        |",0
botBorder BYTE "+----------------------------------------+",0
playerCh BYTE "@",0
playerX BYTE 40
playerY BYTE 7
moveMsg BYTE "Use WASD to move",0
quitMsg BYTE "Press Q to quit",0
laneMsg BYTE "Avoid traffic and reach the top",0
startPrompt BYTE "Press any key to begin",0
goalLine BYTE "|================ GOAL ==================|",0
roadLine BYTE "|----------------------------------------|",0
roadLine2 BYTE "|----------------------------------------|",0
roadLine3 BYTE "|----------------------------------------|",0
startLine BYTE "|================ START =================|",0
car1 BYTE "[=]",0
car2 BYTE "[###]",0
car3 BYTE "[=]",0
livesMsg BYTE "Lives: 3",0
scoreMsg BYTE "Score: 0",0
levelMsg BYTE "Level: 1",0
grassLine BYTE "|""""""""""""""""""""""""""""""""""""""""|",0
borderHint BYTE "WASD Move   Q Quit",0
titleBar BYTE "|               BYTE HOPPER              |",0
safeLine BYTE "|                                        |",0
dividerLine BYTE "|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|",0
goalHint BYTE "Reach the goal!",0
roadMark BYTE "|   -   -   -   -   -   -   -   -   -   |",0
roadMark2 BYTE "|   -   -   -   -   -   -   -   -   -   |",0
roadMark3 BYTE "|   -   -   -   -   -   -   -   -   -   |",0
bottomBorder BYTE "+----------------------------------------+",0
car4 BYTE "[=]",0
inputChar BYTE ?

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

    mov dh,3
    mov dl,20
    call Gotoxy
    mov edx,OFFSET goalLine
    call WriteString

    mov dh,4
    mov dl,20
    call Gotoxy
    mov edx,OFFSET roadLine
    call WriteString

    mov dh,5
    mov dl,20
    call Gotoxy
    mov edx,OFFSET roadLine2
    call WriteString

    mov dh,6
    mov dl,20
    call Gotoxy
    mov edx,OFFSET roadLine3
    call WriteString

    mov dh,7
    mov dl,20
    call Gotoxy
    mov edx,OFFSET startLine
    call WriteString

    mov dh,4
    mov dl,28
    call Gotoxy
    mov edx,OFFSET car1
    call WriteString

    mov dh,5
    mov dl,40
    call Gotoxy
    mov edx,OFFSET car2
    call WriteString

    mov dh,6
    mov dl,50
    call Gotoxy
    mov edx,OFFSET car3
    call WriteString

    mov dh,1
    mov dl,20
    call Gotoxy
    mov edx,OFFSET livesMsg
    call WriteString

    mov dh,1
    mov dl,35
    call Gotoxy
    mov edx,OFFSET scoreMsg
    call WriteString

    mov dh,1
    mov dl,50
    call Gotoxy
    mov edx,OFFSET levelMsg
    call WriteString

    mov dh,8
    mov dl,20
    call Gotoxy
    mov edx,OFFSET grassLine
    call WriteString

    mov dh,10
    mov dl,27
    call Gotoxy
    mov edx,OFFSET borderHint
    call WriteString

    mov dh,2
    mov dl,20
    call Gotoxy
    mov edx,OFFSET titleBar
    call WriteString

    mov dh,3
    mov dl,20
    call Gotoxy
    mov edx,OFFSET safeLine
    call WriteString

    mov dh,4
    mov dl,20
    call Gotoxy
    mov edx,OFFSET dividerLine
    call WriteString

    mov dh,1
    mov dl,62
    call Gotoxy
    mov edx,OFFSET goalHint
    call WriteString

    mov dh,5
    mov dl,20
    call Gotoxy
    mov edx,OFFSET roadMark
    call WriteString

    mov dh,6
    mov dl,20
    call Gotoxy
    mov edx,OFFSET roadMark2
    call WriteString

    mov dh,7
    mov dl,20
    call Gotoxy
    mov edx,OFFSET roadMark3
    call WriteString

    mov dh,9
    mov dl,20
    call Gotoxy
    mov edx,OFFSET bottomBorder
    call WriteString

    mov dh,5
    mov dl,55
    call Gotoxy
    mov edx,OFFSET car4
    call WriteString


    call ReadChar
    mov inputChar,al
    call ReadChar
    exit

main ENDP
END main
