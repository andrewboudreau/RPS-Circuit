module PlayerChoice(
    input wire rock_button,    // Rock Button: Press to choose Rock
    input wire paper_button,   // Paper Button: Press to choose Paper
    input wire scissors_button,// Scissors Button: Press to choose Scissors
    input wire reset_button,   // Reset Button: Clears the choice
    output reg [1:0] choice    // Player's choice: 2-bit output where Rock=1, Paper=2, Scissors=3, Unset=0
);

    // Resets the choice to an unset state (00) when reset_button is pressed
    always @(posedge reset_button) begin
        choice <= 2'b00;
    end

    // Logic to set player's choice based on button pressed
    always @(*) begin
        if (rock_button) begin
            choice = 2'b01; // Rock
        end else if (paper_button) begin
            choice = 2'b10; // Paper
        end else if (scissors_button) begin
            choice = 2'b11; // Scissors
        end
    end

endmodule
