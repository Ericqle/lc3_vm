    .ORIG x00B0
    TRAP xFF
LOOP_GETC
    BR LOOP_GETC
    .END
