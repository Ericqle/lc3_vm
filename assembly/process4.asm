    .ORIG x7000

    AND R1, R1, #0
    ADD R1, R1, #4

    STI R1, MR_SM_ADDR
    STI R1, TEST_ADDR

    TRAP x25

    MR_SM_ADDR .fill xFE04
    TEST_ADDR .fill x0200

    .END