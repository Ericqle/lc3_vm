    .ORIG x3000

    ; check which processes exist and mark ready if so
    ; hold constants 1 in R6 for signifying if process is ready
    AND R6, R6, #0
    ADD R6, R6, #1

    ; find and mark existing processes
    LDI R0, PROCESS_1_ADDR
    LDR R0, R0, #0
    BRz PROCESS_1_ABSENT
    STI R6, PROCESS_1_STATUS
PROCESS_1_ABSENT

    LDI R0, PROCESS_2_ADDR
    LDR R0, R0, #0
    BRz PROCESS_2_ABSENT
    STI R6, PROCESS_2_STATUS
PROCESS_2_ABSENT

    LDI R0, PROCESS_3_ADDR
    LDR R0, R0, #0
    BRz PROCESS_3_ABSENT
    STI R6, PROCESS_3_STATUS
PROCESS_3_ABSENT

    LDI R0, PROCESS_4_ADDR
    LDR R0, R0, #0
    BRz PROCESS_4_ABSENT
    STI R6, PROCESS_4_STATUS
PROCESS_4_ABSENT

    LDI R0, PROCESS_5_ADDR
    LDR R0, R0, #0
    BRz PROCESS_5_ABSENT
    STI R6, PROCESS_5_STATUS
PROCESS_5_ABSENT

    ; clear general purpose registers
    AND R0, R0, #0
    AND R1, R1, #0
    AND R2, R2, #0
    AND R3, R3, #0
    AND R4, R4, #0
    AND R5, R5, #0
    AND R6, R6, #0

    ; start os
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

    .END