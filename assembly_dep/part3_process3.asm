    .ORIG x6000
    AND R1, R1, #0
    ADD R1, R1, #3
    TRAP x26
    ADD R1, R1, #2
    TRAP x25
    .END