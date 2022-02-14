    .ORIG x0200
    .fill x00 ; status of first process
    .fill x00 ; status of second process
    .fill x00 ; status of third process
    .fill x00 ; status of fourth process
    .fill x00 ; status of fifth process
    .fill x4000 ; location of first process
    .fill x5000 ; location of second process
    .fill x6000 ; location of third process
    .fill x7000 ; location of fourth process
    .fill x8000 ; location of fifth process
    .fill x00 ; yielded bit for process 1
    .fill x00 ; yielded bit for process 2
    .fill x00 ; yielded bit for process 3
    .fill x00 ; yielded bit for process 4
    .fill x00 ; yielded bit for process 5
    .fill x00 ; R1 state of process 1
    .fill x00 ; R2 state of process 2
    .fill x00 ; R3 state of process 3
    .fill x00 ; R4 state of process 4
    .fill x00 ; R5 state of process 5
    .fill x00 ; R7 state of process 1
    .fill x00 ; R7 state of process 2
    .fill x00 ; R7 state of process 3
    .fill x00 ; R7 state of process 4
    .fill x00 ; R7 state of process 5
    .END
