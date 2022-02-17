    .ORIG x01B0

    ; hold constants 1 in R6 for state change
    AND R6, R6, #0
    ADD R6, R6, #1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; find running process that called yield
    ;   change state to 1
    ;   set yieled bit for process to 1
    ;   save state of R1 and R7 for process
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    LDI R0, PROCESS_1_STATUS
    ADD R0, R0, #-2
    BRnp PROCESS_1_NOT_RUNNING
    STI R6, PROCESS_1_STATUS
    STI R6, PROCESS_1_YIELDED
    STI R1, PROCESS_1_R1_STATE
    STI R7, PROCESS_1_R7_STATE
PROCESS_1_NOT_RUNNING

    LDI R0, PROCESS_2_STATUS
    ADD R0, R0, #-2
    BRnp PROCESS_2_NOT_RUNNING
    STI R6, PROCESS_2_STATUS
    STI R6, PROCESS_2_YIELDED
    STI R1, PROCESS_2_R1_STATE
    STI R7, PROCESS_2_R7_STATE
PROCESS_2_NOT_RUNNING

    LDI R0, PROCESS_3_STATUS
    ADD R0, R0, #-2
    BRnp PROCESS_3_NOT_RUNNING
    STI R6, PROCESS_3_STATUS
    STI R6, PROCESS_3_YIELDED
    STI R1, PROCESS_3_R1_STATE
    STI R7, PROCESS_3_R7_STATE
PROCESS_3_NOT_RUNNING

    LDI R0, PROCESS_4_STATUS
    ADD R0, R0, #-2
    BRnp PROCESS_4_NOT_RUNNING
    STI R6, PROCESS_4_STATUS
    STI R6, PROCESS_4_YIELDED
    STI R1, PROCESS_4_R1_STATE
    STI R7, PROCESS_4_R7_STATE
PROCESS_4_NOT_RUNNING

    LDI R0, PROCESS_5_STATUS
    ADD R0, R0, #-2
    BRnp PROCESS_5_NOT_RUNNING
    STI R6, PROCESS_5_STATUS
    STI R6, PROCESS_5_YIELDED
    STI R1, PROCESS_5_R1_STATE
    STI R7, PROCESS_5_R7_STATE
PROCESS_5_NOT_RUNNING

    ; halt back to scheduler
    TRAP x25

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

    .END