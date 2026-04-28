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

main ENDP
END main
