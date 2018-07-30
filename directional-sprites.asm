;Sonic Battle - Differing Sprites Based on Direction.
; by Glimmericious

.open sonic-battle-original.gba, sonic-battle-edited.gba, 0x08000000
.gba
.thumb

.org 0x8006D3A          ;Breaking off from the main code.
    bl 0x0805582C
    .pool

.org 0x805582C
    push {r2-r3}        ;Stores the value of r2 and r3 on the stack, because we'll need that back later  Maybe.
    ldr r2,=0x847AFD8   ;Store the address of the Sonic Sprites
    cmp r1,r2           ;r1 stores the current spritesheet
    bne originalCode    ; branch to the original code if it isn't Sonic's spritesheet
    ldr r2,=0x03001C50  ;This bit of code loads the direction that the player is facing.
    ldr r2,[r2]         ;Not 0 if right, 0 if left.
    cmp r2,00           ;Check what direction the player is facing.
    bne loadKnuckles    ;'Branch if equal' - so, if the player is facing right.  Else, this line will be ignored.
loadSonic:
    ldr r1,=0x0847AFD8  ;Loading a value into r1 - there are where Sonic's sprites begin.
    b originalCode      ;Return us to the loop; the program is over.
loadKnuckles:
    ldr r1,=0x084CADF8  ;Loading Knuckles's sprites into r0.
originalCode:
    str r1,[r0]         ;Store the new sprite address.
    pop {r2-r3}         ;Restore r2 and r3 from earlier.
    ldr r0,=0x3001C40   ;This is all stuff that was in the original code.  I had to move it here.
    mov r3,r8
    sub r1,r7,r3
    bl 0x8006D40
    .pool

.close
