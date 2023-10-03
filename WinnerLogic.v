// This module determines the winner in Rock-Paper-Scissors
module WinLogic(
    input [1:0] player_choice,  // Player's choice: Rock (01), Paper (10), or Scissors (11)
    input [1:0] computer_choice,// Computer's choice: Rock (01), Paper (10), or Scissors (11)
    output wire win             // Win output: High if player wins, low otherwise
);

    // Game Logic Table
    // Player: Rock (1), Paper (2), Scissors (3)
    // Computer: Rock (1), Paper (2), Scissors (3)
    // 🪨 Rock = 01, 📄 Paper = 10, ✂️ Scissors = 11

    assign win = (player_choice == 2'b01 && computer_choice == 2'b11) ||  // Rock beats Scissors
                 (player_choice == 2'b10 && computer_choice == 2'b01) ||  // Paper beats Rock
                 (player_choice == 2'b11 && computer_choice == 2'b10);    // Scissors beats Paper

endmodule
