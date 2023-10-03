module WinLogic(
    input wire [1:0] player,  // MSB: Player's choice (00=Rock 🪨, 01=Paper 📄, 10=Scissors ✂️)
    input wire [1:0] computer, // LSB: Computer's choice (00=Rock 🪨, 01=Paper 📄, 10=Scissors ✂️)
    output wire win
);

    /* 
    ## Truth Table for Rock-Paper-Scissors 🎮
    - **Rock 🪨**: 00
    - **Paper 📄**: 01
    - **Scissors ✂️**: 10

    | Player 🎮 | Computer 🖥️| Win 🏆 == 1|
    |-----------|-------------|-----|
    |    00     |     00      | 0   |
    |    00     |     01      | 0   |
    |    00     |     10      | 1   |
    |    01     |     00      | 1   |
    |    01     |     01      | 0   |
    |    01     |     10      | 0   |
    |    10     |     00      | 0   |
    |    10     |     01      | 1   |
    |    10     |     10      | 0   |
    */

    wire w1, w2, w3;

    // Rock 🪨 beats Scissors ✂️: 00 beats 10
    assign w1 = ~player[1] & ~player[0] & computer[1] & ~computer[0];

    // Paper 📄 beats Rock 🪨: 01 beats 00
    assign w2 = ~player[1] & player[0] & ~computer[1] & ~computer[0];

    // Scissors ✂️ beat Paper 📄: 10 beats 01
    assign w3 = player[1] & ~player[0] & ~computer[1] & computer[0];

    // Final win 🏆 condition
    assign win = w1 | w2 | w3;

endmodule
