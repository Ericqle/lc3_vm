    .ORIG x00F0
    TRAP xFF
LOOP_PUTSP
    BR LOOP_PUTSP
    .END
