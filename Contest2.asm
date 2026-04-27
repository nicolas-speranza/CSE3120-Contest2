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
car1X BYTE 28
blank3 BYTE "   ",0
gameLoopLabel BYTE 0
blank1 BYTE " ",0
car2X BYTE 40
blank5 BYTE "     ",0
car3X BYTE 50
car4X BYTE 55
hitMsg BYTE "You got hit!",0
winMsg BYTE "You made it across!",0
titleColor BYTE yellow+(black*16)
playerColor BYTE lightGreen+(black*16)
carColor BYTE lightRed+(black*16)

.code
main PROC
    call Clrscr

    gameLoop:

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

    mov eax,playerColor
    call SetTextColor
    mov dh,playerY
    mov dl,playerX
    call Gotoxy
    mov edx,OFFSET playerCh
    call WriteString
    mov eax,white+(black*16)
    call SetTextColor

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

    mov eax,carColor
    call SetTextColor
    mov dh,4
    mov dl,car1X
    call Gotoxy
    mov edx,OFFSET car1
    call WriteString

    mov eax,carColor
    call SetTextColor
    mov dh,5
    mov dl,40
    call Gotoxy
    mov edx,OFFSET car2
    call WriteString

    mov eax,carColor
    call SetTextColor
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

    mov eax,titleColor
    call SetTextColor
    mov dh,2
    mov dl,20
    call Gotoxy
    mov edx,OFFSET titleBar
    call WriteString
    mov eax,white+(black*16)
    call SetTextColor

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

    mov eax,carColor
    call SetTextColor
    mov dh,5
    mov dl,55
    call Gotoxy
    mov edx,OFFSET car4
    call WriteString
    mov eax,white+(black*16)
    call SetTextColor

    mov dh,4
    mov dl,car1X
    call Gotoxy
    mov edx,OFFSET blank3
    call WriteString

    call ReadChar
    mov inputChar,al
    cmp inputChar,'q'
    je done
    cmp inputChar,'Q'
    je done

    mov dh,playerY
    mov dl,playerX
    call Gotoxy
    mov edx,OFFSET blank1
    call WriteString

    cmp inputChar,'a'
    jne skipLeft
    cmp playerX,21
    jbe skipLeft
    dec playerX
skipLeft:

    cmp inputChar,'d'
    jne skipRight
    cmp playerX,58
    jae skipRight
    inc playerX
skipRight:

    cmp inputChar,'w'
    jne skipUp
    cmp playerY,3
    jbe skipUp
    dec playerY
skipUp:

    cmp inputChar,'s'
    jne skipDown
    cmp playerY,7
    jae skipDown
    inc playerY
skipDown:

    dec car1X
    cmp car1X,21
    jae skipReset1
    mov car1X,57
skipReset1:
    mov dh,4
    mov dl,car1X
    call Gotoxy
    mov edx,OFFSET car1
    call WriteString

    mov dh,5
    mov dl,car2X
    call Gotoxy
    mov edx,OFFSET blank5
    call WriteString

    inc car2X
    cmp car2X,55
    jbe skipReset2
    mov car2X,21
skipReset2:
    mov dh,5
    mov dl,car2X
    call Gotoxy
    mov edx,OFFSET car2
    call WriteString

    mov dh,6
    mov dh,6
    mov dl,car3X
    call Gotoxy
    mov edx,OFFSET blank3
    call WriteString

    dec car3X
    cmp car3X,21
    jae skipReset3
    mov car3X,57
skipReset3:
    mov dh,6
    mov dl,car3X
    call Gotoxy
    mov edx,OFFSET car3
    call WriteString

    mov dh,5
    mov dh,5
    mov dl,car4X
    call Gotoxy
    mov edx,OFFSET blank3
    call WriteString

    dec car4X
    cmp car4X,21
    jae skipReset4
    mov car4X,57
skipReset4:
    mov dh,5
    mov dl,car4X
    call Gotoxy
    mov edx,OFFSET car4
    call WriteString

    mov al,playerY
    cmp al,4
    jne skipHit1
    mov al,playerX
    cmp al,car1X
    jb skipHit1
    cmp al,car1X+2
    ja skipHit1
    jmp hitPlayer
skipHit1:

    cmp playerY,3
    jne skipWin
    jmp winPlayer
skipWin:

    mov dh,playerY
    mov dl,playerX
    call Gotoxy
    mov edx,OFFSET playerCh
    call WriteString

    jmp gameLoop

hitPlayer:
    mov dh,12
    mov dl,30
    call Gotoxy
    mov edx,OFFSET hitMsg
    call WriteString
    call ReadChar
    exit

winPlayer:
    mov dh,13
    mov dl,25
    call Gotoxy
    mov edx,OFFSET winMsg
    call WriteString
    call ReadChar
    exit

done:
    exit

main ENDP
END main
