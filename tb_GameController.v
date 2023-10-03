`timescale 1ns/1ps

module tb_GameController();

    reg clock;
    reg reset_button;
    reg rock_button;
    reg paper_button;
    reg scissors_button;
    reg stop_signal;

    wire win_led;
    wire lose_led;

    // Instantiate the GameController module
    GameController uut (
        .clock(clock),
        .reset_button(reset_button),
        .rock_button(rock_button),
        .paper_button(paper_button),
        .scissors_button(scissors_button),
        .stop_signal(stop_signal),
        .win_led(win_led),
        .lose_led(lose_led)
    );

    // Clock generation
    always begin
        #5 clock = ~clock;
    end

    // Test sequence
	initial begin
		$display("Start of testbench");
		clock = 0;
		reset_button = 0;
		rock_button = 0;
		paper_button = 0;
		scissors_button = 0;
		stop_signal = 0;

		// Reset the game
		reset_button = 1;
		#10 reset_button = 0;
		
		// Scenario 1: Player chooses Rock
		
		$display("Scenario 1: Player chooses Rock");
		rock_button = 1;
		#10 stop_signal = 1; // Lock-in the choices
		#10 stop_signal = 0;
		#10 rock_button = 0;
		
		// Delay to observe behavior
		#50;

		// Scenario 2: Player chooses Paper
		paper_button = 1;
		#10 stop_signal = 1; // Lock-in the choices
		#10 stop_signal = 0;
		#10 paper_button = 0;
		
		// Delay to observe behavior
		#50;

		// Scenario 3: Player chooses Scissors
		scissors_button = 1;
		#10 stop_signal = 1; // Lock-in the choices
		#10 stop_signal = 0;
		#10 scissors_button = 0;

		// Delay to observe behavior
		#50;

		$display("End of testbench");
	end

endmodule
