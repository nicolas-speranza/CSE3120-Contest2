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

    call HandleInput
    cmp restartFlag,1
    je StartGame

    call UpdateCars
    call CheckCollision
    call UpdateTimer

    cmp lives,0
    je ShowOutOfLives

    cmp timeLeft,0
    je ShowTimeUp

    call CheckGoal
    call DrawScene

    mov eax,70
    call Delay
    jmp GameLoop

ShowTimeUp:
    call DrawScene
    mov eax,msgColor
    call SetTextColor
    mov dh,MSGROW4
    mov dl,LEFTCOL+3
    call Gotoxy
    mov edx,OFFSET gameOverMsg
    call WriteString
    mov eax,textColor
    call SetTextColor

WaitTimeUp:
    call ReadChar
    cmp al,'r'
    je StartGame
    cmp al,'R'
    je StartGame
    cmp al,'q'
    je QuitGame
    cmp al,'Q'
    je QuitGame
    jmp WaitTimeUp

ShowOutOfLives:
    call DrawScene
    mov eax,msgColor
    call SetTextColor
    mov dh,MSGROW4
    mov dl,LEFTCOL
    call Gotoxy
    mov edx,OFFSET loseMsg
    call WriteString
    mov eax,textColor
    call SetTextColor

WaitOutOfLives:
    call ReadChar
    cmp al,'r'
    je StartGame
    cmp al,'R'
    je StartGame
    cmp al,'q'
    je QuitGame
    cmp al,'Q'
    je QuitGame
    jmp WaitOutOfLives

QuitGame:
    exit

main ENDP

InitGame PROC
    mov lives,3
    mov score,0
    mov level,1
    mov restartFlag,0
    mov timeLeft,60
    mov frameCounter,0

    mov playerX,STARTX
    mov playerY,STARTROW

    mov car1X,36
    mov car2X,18
    mov car3X,8
    mov car4X,28
    mov car5X,33
    mov car6X,14
    ret
InitGame ENDP

DrawScene PROC
    call DrawHUD
    call DrawBoard
    call DrawCars
    call DrawPlayer
    ret
DrawScene ENDP

DrawHUD PROC
    mov eax,textColor
    call SetTextColor

    mov dh,HUDROW
    mov dl,LEFTCOL
    call Gotoxy
    mov edx,OFFSET hudLives
    call WriteString
    movzx eax,lives
    call WriteDec

    mov al,' '
    call WriteChar
    mov al,' '
    call WriteChar

    mov dh,HUDROW
    mov dl,LEFTCOL+12
    call Gotoxy
    mov edx,OFFSET hudScore
    call WriteString
    movzx eax,score
    call WriteDec

    mov al,' '
    call WriteChar
    mov al,' '
    call WriteChar

    mov dh,HUDROW
    mov dl,LEFTCOL+24
    call Gotoxy
    mov edx,OFFSET hudLevel
    call WriteString
    movzx eax,level
    call WriteDec

    mov al,' '
    call WriteChar
    mov al,' '
    call WriteChar

    mov dh,HUDROW
    mov dl,LEFTCOL+36
    call Gotoxy
    mov edx,OFFSET hudTimer
    call WriteString

    movzx eax,timeLeft

    cmp eax,10
    jae PrintSeconds
    mov al,'0'
    call WriteChar

PrintSeconds:
    movzx eax,timeLeft
    call WriteDec
    ret
DrawHUD ENDP

DrawBoard PROC
    mov eax,titleColor
    call SetTextColor
    mov dh,TITLEROW
    mov dl,LEFTCOL+14
    call Gotoxy
    mov edx,OFFSET titleText
    call WriteString

    mov eax,textColor
    call SetTextColor

    mov dh,TOPROW
    mov dl,LEFTCOL
    call Gotoxy
    mov edx,OFFSET topBorder
    call WriteString

    mov eax,goalColor
    call SetTextColor

    mov dh,GOALROW
    mov dl,LEFTCOL
    call Gotoxy
    mov edx,OFFSET goalLine
    call WriteString

    mov eax,textColor
    call SetTextColor

    mov dh,SAFE1ROW
    mov dl,LEFTCOL

    call Gotoxy
    mov edx,OFFSET safeLine
    call WriteString

    mov dh,LANE1ROW
    mov dl,LEFTCOL
    call Gotoxy
    mov edx,OFFSET roadMark
    call WriteString

    mov dh,SAFE2ROW
    mov dl,LEFTCOL
    call Gotoxy
    mov edx,OFFSET safeLine
    call WriteString

    mov dh,LANE2ROW
    mov dl,LEFTCOL
    call Gotoxy
    mov edx,OFFSET roadMark2
    call WriteString

    mov dh,SAFE3ROW
    mov dl,LEFTCOL
    call Gotoxy
    mov edx,OFFSET safeLine
    call WriteString

    mov dh,LANE3ROW
    mov dl,LEFTCOL
    call Gotoxy
    mov edx,OFFSET roadMark3
    call WriteString

    mov dh,STARTROW
    mov dl,LEFTCOL
    call Gotoxy
    mov edx,OFFSET startLine
    call WriteString

    mov dh,BOTTOMROW
    mov dl,LEFTCOL
    call Gotoxy
    mov edx,OFFSET bottomBorder

    call WriteString

    mov dh,MSGROW1
    mov dl,LEFTCOL+5
    call Gotoxy
    mov edx,OFFSET controlsMsg
    call WriteString

    mov dh,MSGROW2
    mov dl,LEFTCOL+1

    call Gotoxy
    mov edx,OFFSET objectiveMsg
    call WriteString

    mov dh,MSGROW3
    mov dl,LEFTCOL
    call Gotoxy
    mov edx,OFFSET safeLine
    call WriteString

    mov dh,MSGROW4
    mov dl,LEFTCOL
    call Gotoxy
    mov edx,OFFSET safeLine
    call WriteString
    ret
DrawBoard ENDP

DrawCars PROC
    mov eax,carColor
    call SetTextColor

    mov dh,LANE1ROW
    mov dl,car1X
    call Gotoxy
    mov edx,OFFSET carSmall
    call WriteString

END main
