# RPS-Circuit
A rock paper scissor digital circuit

# Build wtih Icarus Verilog
Install Icarus Verilog: If you're using a Debian-based system like Ubuntu, you can install it using:
```
sudo apt-get install iverilog
```

Compile Your Code: Navigate to the folder containing your Verilog files and run:
```
iverilog -o rps_circuit GameController.v PlayerChoice.v ComputerChoice.v WinnerLogic.v tb_GameController.v
```
This compiles all your Verilog files and generates an output file named rps_circuit.

Run the Simulation: To run the simulation, execute the output file using:
```
vvp rps_circuit
```

This will run the simulation and you should see any $display statements you've used in your testbench.

View Waveforms (Optional): If you've used $dumpfile and $dumpvars in your testbench, you can use a waveform viewer like GTKWave to view the simulation results:

```
gtkwave my_waveform_file.vcd
```


https://chat.openai.com/share/e1661239-cbc7-4bde-933a-885e609e13d1

### Game Logic:
# Truth Table for Rock-Paper-Scissors 🎮
- **Rock 🪨**: 01
- **Paper 📄**: 10
- **Scissors ✂️**: 11

| Player 🎮 | Computer 🖥️| Win 🏆 == 1|
|-----------|-------------|-----------|
|    01     |     01      |     0     |
|    01     |     10      |     0     |
|    01     |     11      |     1     |
|    10     |     01      |     1     |
|    10     |     10      |     0     |
|    10     |     11      |     0     |
|    11     |     01      |     0     |
|    11     |     10      |     1     |
|    11     |     11      |     0     |

```Verilog
// Game Logic Table
// Player: Rock (1), Paper (2), Scissors (3)
// Computer: Rock (1), Paper (2), Scissors (3)
// 🪨 Rock = 01, 📄 Paper = 10, ✂️ Scissors = 11

assign win = (player_choice == 2'b01 && computer_choice == 2'b11) ||  // Rock beats Scissors
             (player_choice == 2'b10 && computer_choice == 2'b01) ||  // Paper beats Rock
             (player_choice == 2'b11 && computer_choice == 2'b10);    // Scissors beats Paper
```

Here are the game rules as Boolean expressions. We'll consider a Win or Loss from the perspective of the user.

1. **User Wins** (Green LED): \( W \)
    - Rock beats Scissors: 
    - Paper beats Rock:
    - Scissors beat Paper:

    The full expression for a win is:
    \[ W = W_1 + W_2 + W_3 \]

2. **User Loses** (Red LED): \( L \)
    - The loss conditions are simply the inverses of the win conditions. We can use the NOT operation on the \( W \) bit for this.

### Symbolic Notation for Inputs and Outputs:

- Player : User Choice (2 bits)
- Computer : CPU Choice (2 bits)
- W : Win LED (1 bit)
- L : Loss LED (1 bit)

### Circuit Components:

1. **User Input**: Three buttons connected to a 2-bit latch to store \( U_1U_0 \).
2. **CPU Input**: A 2-bit random number generator connected to a 2-bit latch to store \( C_1C_0 \).
3. **Comparator**: Logic gates to implement the game logic. 
    - AND gates to calculate \( W_1, W_2, W_3 \)
    - OR gate to sum up \( W_1, W_2, W_3 \) to get \( W \)
    - NOT gate to get \( L \) from \( W \)
4. **Output**: Two LEDs connected to \( W \) and \( L \).


### Steps:

1. **Initialization**: Turn on the power switch to start the random number generator.
2. **User Input**: Press a button for Rock, Paper, or Scissors, and the corresponding value gets latched into \( U_1U_0 \).
3. **CPU Input**: The current value from the random number generator gets latched into \( C_1C_0 \) when the user presses a button.
4. **Win/Loss Evaluation**: \( W \) and \( L \) are calculated based on \( U_1U_0 \) and \( C_1C_0 \).
5. **Output Display**: \( W \) and \( L \) drive the Green and Red LEDs, respectively.

This is a simplified, high-level overview of the game logic and how it can be implemented in a digital circuit. To get into the nitty-gritty details, you'd go through Boolean minimization to simplify the logic, and then go on to actually layout the gates, flip-flops, and other components.

Would you like to dive deeper into any of these steps?