INCLUDE Irvine32.inc

LEFTCOL     = 4
HUDROW      = 1
TITLEROW    = 3
TOPROW      = 4
GOALROW     = 5
SAFE1ROW    = 6
LANE1ROW    = 7
SAFE2ROW    = 8
LANE2ROW    = 9
SAFE3ROW    = 10
LANE3ROW    = 11
STARTROW    = 12
BOTTOMROW   = 13
MSGROW1     = 15
MSGROW2     = 16
MSGROW3     = 17
MSGROW4     = 19
MINX        = 7
MAXX        = 41
STARTX      = 23

.data
titleText BYTE "BYTE HOPPER",0
topBorder BYTE "+----------------------------------------+",0
midBorder BYTE "|                                        |",0
botBorder BYTE "+----------------------------------------+",0
playerChar BYTE "@",0
playerX BYTE STARTX
playerY BYTE STARTROW
goalLine BYTE "|================ GOAL ==================|",0
roadLine BYTE "|----------------------------------------|",0
roadLine2 BYTE "|----------------------------------------|",0
roadLine3 BYTE "|----------------------------------------|",0
startLine BYTE "|================ START =================|",0
carSmall BYTE "[=]",0
carTruck BYTE "[###]",0
hudLives BYTE "Lives: ",0
hudScore BYTE "Score: ",0
hudLevel BYTE "Level: ",0
hudTimer BYTE "Time: ",0
controlsMsg BYTE "WASD Move   Q Quit   R Restart",0
objectiveMsg BYTE "Get as many crossings as possible before time runs out",0
titleBar BYTE "|               BYTE HOPPER              |",0
safeLine BYTE "|                                        |",0
roadMark BYTE "|   -   -   -   -   -   -   -   -   -   |",0
roadMark2 BYTE "|   -   -   -   -   -   -   -   -   -   |",0
roadMark3 BYTE "|   -   -   -   -   -   -   -   -   -   |",0
bottomBorder BYTE "+----------------------------------------+",0
inputChar BYTE ?
lives BYTE 3
score BYTE 0
level BYTE 1
restartFlag BYTE 0
timeLeft BYTE 60
frameCounter BYTE 0
gameOverMsg BYTE "TIME UP - R to restart, Q to quit",0
loseMsg BYTE "OUT OF LIVES - R to restart, Q to quit",0
car1X BYTE 36
car2X BYTE 18
car3X BYTE 8
car4X BYTE 28
car5X BYTE 33
car6X BYTE 14
titleColor DWORD yellow+(black*16)
playerColor DWORD lightGreen+(black*16)
carColor DWORD lightRed+(black*16)
goalColor DWORD yellow+(black*16)
msgColor DWORD lightMagenta+(black*16)

.code
main PROC

StartGame:
    call InitGame
    call Clrscr
    call DrawScene

GameLoop:

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

    mov eax,goalColor
    call SetTextColor
    mov dh,3
    mov dl,20
    call Gotoxy
    mov edx,OFFSET goalLine
    call WriteString
    mov eax,white+(black*16)
    call SetTextColor

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

    mov eax,startColor
    call SetTextColor
    mov dh,7
    mov dl,20
    call Gotoxy
    mov edx,OFFSET startLine
    call WriteString
    mov eax,white+(black*16)
    call SetTextColor

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
