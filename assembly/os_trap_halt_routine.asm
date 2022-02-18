    .ORIG x0100

    ; first mem dump
    TRAP xFF


    ; hold 0 in R6 for writing a change of state to terminated
    AND R6, R6, #0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; find the running process that has just terminated
    ;   set status to terminated
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    LDI R0, PROCESS_1_STATUS
    ADD R0, R0, #-2
    BRnp PROCESS_1_NOT_RUNNING  ; branch if not the running process
    STI R6, PROCESS_1_STATUS    ; set process status as terminated
PROCESS_1_NOT_RUNNING

    LDI R0, PROCESS_2_STATUS
    ADD R0, R0, #-2
    BRnp PROCESS_2_NOT_RUNNING
    STI R6, PROCESS_2_STATUS
PROCESS_2_NOT_RUNNING

    LDI R0, PROCESS_3_STATUS
    ADD R0, R0, #-2
    BRnp PROCESS_3_NOT_RUNNING
    STI R6, PROCESS_3_STATUS
PROCESS_3_NOT_RUNNING

    LDI R0, PROCESS_4_STATUS
    ADD R0, R0, #-2
    BRnp PROCESS_4_NOT_RUNNING
    STI R6, PROCESS_4_STATUS
PROCESS_4_NOT_RUNNING

    LDI R0, PROCESS_5_STATUS
    ADD R0, R0, #-2
    BRnp PROCESS_5_NOT_RUNNING
    STI R6, PROCESS_5_STATUS
PROCESS_5_NOT_RUNNING


    ; hold 2 in R6 for writing a change of state to running
    AND R6, R6, #0
    ADD R6, R6, #2

    ; hold 0 in R5 for writing a change to user mode
    AND R5, R5, #0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; find next ready process and run
    ;   change MR_SM user mode
    ;   set status to running
    ;   change MR_MPU state
    ;   dump memory before process switch
    ;   jump to process address
    ; if process has been yielded:
    ;   load R1 from saved state of R1
    ;   change MR_SM to user mode
    ;   set status to running
    ;   change MR_MPU state
    ;   disable yield bit for process
    ;   dump memory before process switch
    ;   instead jump to address in saved state of R7
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    AND R4, R4, #0
    ADD R4, R4, #1              ; init mpu state
    LDI R0, PROCESS_1_STATUS
    ADD R0, R0, #-1
    BRnp PROCESS_1_NOT_WAITING  ; branch if not ready
    LDI R0, PROCESS_1_YIELDED
    ADD R0, R0, #-1
    BRnp PROCESS_1_NOT_YIELDING ; branch if not yielding
    LDI R1, PROCESS_1_R1_STATE  ; restore R1 state
    LDI R7, PROCESS_1_R7_STATE  ; restore R7 state
    AND R0, R0, #0
    STI R0, PROCESS_1_YIELDED   ; set yielded state to 0
    TRAP xFF                    ; dump memory before process switch
    STI R5, MR_SM_REF           ; change to user mode
    STI R6, PROCESS_1_STATUS    ; change process to running
    STI R4, MR_MPU_REF          ; set mpu state
    JMP R7                      ; jump to process where left off
PROCESS_1_NOT_YIELDING
    LDI R0, PROCESS_1_ADDR      ; load process address
    TRAP xFF                    ; dump memory before process switch
    STI R5, MR_SM_REF           ; change to user mode
    STI R6, PROCESS_1_STATUS    ; change process to running
    STI R4, MR_MPU_REF          ; set mpu state
    JMP R0                      ; jump to process
PROCESS_1_NOT_WAITING

    AND R4, R4, #0
    ADD R4, R4, #2
    LDI R0, PROCESS_2_STATUS
    ADD R0, R0, #-1
    BRnp PROCESS_2_NOT_WAITING
    LDI R0, PROCESS_2_YIELDED
    ADD R0, R0, #-1
    BRnp PROCESS_2_NOT_YIELDING
    LDI R1, PROCESS_2_R1_STATE
    LDI R7, PROCESS_2_R7_STATE
    AND R0, R0, #0
    STI R0, PROCESS_2_YIELDED
    TRAP xFF
    STI R5, MR_SM_REF
    STI R6, PROCESS_2_STATUS
    STI R4, MR_MPU_REF
    JMP R7
PROCESS_2_NOT_YIELDING
    LDI R0, PROCESS_2_ADDR
    TRAP xFF
    STI R5, MR_SM_REF
    STI R6, PROCESS_2_STATUS
    STI R4, MR_MPU_REF
    JMP R0
PROCESS_2_NOT_WAITING

    AND R4, R4, #0
    ADD R4, R4, #3
    LDI R0, PROCESS_3_STATUS
    ADD R0, R0, #-1
    BRnp PROCESS_3_NOT_WAITING
    LDI R0, PROCESS_3_YIELDED
    ADD R0, R0, #-1
    BRnp PROCESS_3_NOT_YIELDING
    LDI R1, PROCESS_3_R1_STATE
    LDI R7, PROCESS_3_R7_STATE
    AND R0, R0, #0
    STI R0, PROCESS_3_YIELDED
    TRAP xFF
    STI R5, MR_SM_REF
    STI R6, PROCESS_3_STATUS
    STI R4, MR_MPU_REF
    JMP R7
PROCESS_3_NOT_YIELDING
    LDI R0, PROCESS_3_ADDR
    TRAP xFF
    STI R5, MR_SM_REF
    STI R6, PROCESS_3_STATUS
    STI R4, MR_MPU_REF
    JMP R0
PROCESS_3_NOT_WAITING

    AND R4, R4, #0
    ADD R4, R4, #4
    LDI R0, PROCESS_4_STATUS
    ADD R0, R0, #-1
    BRnp PROCESS_4_NOT_WAITING
    LDI R0, PROCESS_4_YIELDED
    ADD R0, R0, #-1
    BRnp PROCESS_4_NOT_YIELDING
    LDI R1, PROCESS_4_R1_STATE
    LDI R7, PROCESS_4_R7_STATE
    AND R0, R0, #0
    STI R0, PROCESS_4_YIELDED
    TRAP xFF
    STI R5, MR_SM_REF
    STI R6, PROCESS_4_STATUS
    STI R4, MR_MPU_REF
    JMP R7
PROCESS_4_NOT_YIELDING
    LDI R0, PROCESS_4_ADDR
    TRAP xFF
    STI R5, MR_SM_REF
    STI R6, PROCESS_4_STATUS
    STI R4, MR_MPU_REF
    JMP R0
PROCESS_4_NOT_WAITING

    AND R4, R4, #0
    ADD R4, R4, #5
    LDI R0, PROCESS_5_STATUS
    ADD R0, R0, #-1
    BRnp PROCESS_5_NOT_WAITING
    LDI R0, PROCESS_5_YIELDED
    ADD R0, R0, #-1
    BRnp PROCESS_5_NOT_YIELDING
    LDI R1, PROCESS_5_R1_STATE
    LDI R7, PROCESS_5_R7_STATE
    AND R0, R0, #0
    STI R0, PROCESS_5_YIELDED
    TRAP xFF
    STI R5, MR_SM_REF
    STI R6, PROCESS_5_STATUS
    STI R4, MR_MPU_REF
    JMP R7
PROCESS_5_NOT_YIELDING
    LDI R0, PROCESS_5_ADDR
    TRAP xFF
    STI R5, MR_SM_REF
    STI R6, PROCESS_5_STATUS
    STI R4, MR_MPU_REF
    JMP R0
PROCESS_5_NOT_WAITING


    ; final dump and infinite loop
    TRAP xFF
LOOP_HALT
    BR LOOP_HALT


    ; data table
    PROCESS_1_STATUS .fill x0200
    PROCESS_2_STATUS .fill x0201
    PROCESS_3_STATUS .fill x0202
    PROCESS_4_STATUS .fill x0203
    PROCESS_5_STATUS .fill x0204

    PROCESS_1_ADDR .fill x0205
    PROCESS_2_ADDR .fill x0206
    PROCESS_3_ADDR .fill x0207
    PROCESS_4_ADDR .fill x0208
    PROCESS_5_ADDR .fill x0209

    PROCESS_1_YIELDED .fill x020A
    PROCESS_2_YIELDED .fill x020B
    PROCESS_3_YIELDED .fill x020C
    PROCESS_4_YIELDED .fill x020D
    PROCESS_5_YIELDED .fill x020E

    PROCESS_1_R1_STATE .fill x020F
    PROCESS_2_R1_STATE .fill x0210
    PROCESS_3_R1_STATE .fill x0211
    PROCESS_4_R1_STATE .fill x0212
    PROCESS_5_R1_STATE .fill x0213

    PROCESS_1_R7_STATE .fill x0214
    PROCESS_2_R7_STATE .fill x0215
    PROCESS_3_R7_STATE .fill x0216
    PROCESS_4_R7_STATE .fill x0217
    PROCESS_5_R7_STATE .fill x0218

    MR_SM_REF .fill xFE04
    MR_MPU_REF .fill xFE06

    .END
