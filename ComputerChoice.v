// This module represents the computer's choice in Rock-Paper-Scissors
module ComputerChoice(
    input wire clock,           // Clock signal: Synchronizes the random generation
    input wire stop_signal,     // Stop Signal: Locks in the current random number
    output reg [1:0] choice     // Computer's choice: 2-bit output where Rock=1, Paper=2, Scissors=3, Unset=0
);

    // Counter to cycle through choices quickly
    reg [1:0] counter = 2'b00;
    
    // Generates a "random" choice for the computer
    always @(posedge clock) begin
        if (!stop_signal) begin
            counter <= counter + 1;
        end
    end

    // Locks in the choice when the stop_signal is high
    always @(posedge stop_signal) begin
        choice <= counter[1:0];
    end

endmodule
