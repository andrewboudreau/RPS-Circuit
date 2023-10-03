// In this example, the win_led output is set to high when the player wins, as indicated by the 
// player_win wire. The lose_led output is set to high when the player loses, which is when player_win 
// is low and the player has made a choice (i.e., player_choice is not unset or 2'b00).

// This module acts as the game controller for Rock-Paper-Scissors
module GameController(
    input wire clock,                // Clock signal
    input wire reset_button,         // Resets the game state
    input wire rock_button,          // Rock choice button
    input wire paper_button,         // Paper choice button
    input wire scissors_button,      // Scissors choice button
    input wire stop_signal,          // Locks in the player's and computer's choices
    output wire win_led,             // LED for indicating a win
    output wire lose_led             // LED for indicating a loss
);

    wire player_win;                 // Signal indicating the player's win
    reg [1:0] player_choice;         // Player's choice
    reg [1:0] computer_choice;       // Computer's choice

    // Instantiate PlayerChoice module
    PlayerChoice playerInst (
        .rock_button(rock_button),
        .paper_button(paper_button),
        .scissors_button(scissors_button),
        .reset_button(reset_button),
        .choice(player_choice)
    );

    // Instantiate ComputerChoice module
    ComputerChoice computerInst (
        .clock(clock),
        .stop_signal(stop_signal),
        .choice(computer_choice)
    );

    // Instantiate WinLogic module
    WinLogic winLogicInst (
        .player_choice(player_choice),
        .computer_choice(computer_choice),
        .win(player_win)
    );

    // Control LEDs based on game outcome
    assign win_led = player_win;
    assign lose_led = ~player_win & (player_choice != 2'b00);

endmodule
