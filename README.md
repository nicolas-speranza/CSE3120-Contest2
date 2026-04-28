# Byte Hopper

## Description

Byte Hopper is a terminal-based arcade game written in x86 Assembly using the Irvine32 library. The player must cross multiple traffic lanes while avoiding moving vehicles before time runs out.

The objective of the game is to:

- Dodge moving cars and trucks  
- Reach the goal lane as many times as possible  
- Earn points before the timer reaches zero
- The player starts at the bottom of the arena and must move upward through several lanes of traffic. Each successful crossing increases the score.

The game also includes a countdown timer and limited lives. If the player is hit by too many vehicles or runs out of time, the game ends.

---

## How to Play

- The player is represented by `@`  
- Small cars are represented by `[=]`  
- Trucks are represented by `[###]`  

### Controls

- `W` → Move up  
- `A` → Move left  
- `S` → Move down  
- `D` → Move right
- `Q` → Quit the game  
- `R` → Restart the game  

### Objective

- Avoid all moving vehicles  
- Reach the goal row at the top of the arena  
- Score as many crossings as possible before the timer reaches zero  
- Survive with your remaining lives

  ---

## How to Compile and Run

### Requirements

- Windows OS  
- Visual Studio (with C++ tools installed)  
- Irvine32 library  

The Irvine32 files should be located at:

```text
C:\Irvine\irvine
### Steps

1. Download or clone the repository  

2. Open a Command Prompt  

3. Navigate to the project folder:

```text
cd path\to\CSE3120-Contest1

```

Example:

```text
cd %USERPROFILE%\Downloads\CSE3120-Contest1-main\CSE3120-Contest1-main
```

4. Build the program:

```text
build.bat
```

If successful, you should see:

```text
Build successful.
Run with: Contest1.exe
```

5. Run the game:

```text
Contest1.exe
```

Alternatively, you can just download the Contest2.asm file, open it in your Visual Studio (which I'm assuming is set up correctly), build, and then run it by clicking on Start Debugging or Start Without Debugging.

---

## Notes

- The build script automatically sets up the correct 32-bit environment  
- If the build fails, verify that Irvine32 is installed at `C:\Irvine\irvine`  

---

## Game Demo

YouTube Video Demo:
https://youtu.be/NglRixbxB5M

