
// This module serves as the computer's "random" choice generator for Rock-Paper-Scissors
module ComputerChoice(
    input wire clk,         // Clock input: Used to synchronize the state changes
    input wire stop_signal, // Stop Signal: When high, stops the counter and locks in the computer's choice
    output reg [1:0] choice // Computer's choice: 2-bit output representing Rock (00), Paper (01), or Scissors (10)
);

    // Logic that updates on every rising edge of the clock signal
    always @(posedge clk) begin

        // If stop_signal is not high, cycle through choices
        if (!stop_signal) begin

            // Cycle through 00, 01, 10 (Representing Rock, Paper, Scissors)
            if (choice == 2'b10) begin
                choice <= 2'b00;
            end else begin
                choice <= choice + 1;
            end
        end

        // When stop_signal is high, the current value of 'choice' is maintained
    end

endmodule