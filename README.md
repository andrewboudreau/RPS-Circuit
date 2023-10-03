# RPS-Circuit
A rock paper scissor digital circuit


https://chat.openai.com/share/e1661239-cbc7-4bde-933a-885e609e13d1

### Symbolic Notation for Inputs and Outputs:

- \( U_1U_0 \) : User Choice (2 bits)
- \( C_1C_0 \) : CPU Choice (2 bits)
- \( W \) : Win LED (1 bit)
- \( L \) : Loss LED (1 bit)

### Game Logic:

Here are the game rules as Boolean expressions. We'll consider a Win or Loss from the perspective of the user.

1. **User Wins** (Green LED): \( W \)
    - Rock beats Scissors: \( U_1U_0 = 00, C_1C_0 = 10 \) : \( W_1 = \overline{U_1} \overline{U_0} C_1 \overline{C_0} \)
    - Paper beats Rock: \( U_1U_0 = 01, C_1C_0 = 00 \) : \( W_2 = \overline{U_1} U_0 \overline{C_1} \overline{C_0} \)
    - Scissors beat Paper: \( U_1U_0 = 10, C_1C_0 = 01 \) : \( W_3 = U_1 \overline{U_0} \overline{C_1} C_0 \)

    The full expression for a win is:
    \[ W = W_1 + W_2 + W_3 \]

2. **User Loses** (Red LED): \( L \)
    - The loss conditions are simply the inverses of the win conditions. We can use the NOT operation on the \( W \) bit for this.

# Truth Table for Rock-Paper-Scissors 🎮
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


```Verilog

// Rock 🪨 beats Scissors ✂️: 00 beats 10
assign w1 = ~player[1] & ~player[0] & computer[1] & ~computer[0];

// Paper 📄 beats Rock 🪨: 01 beats 00
assign w2 = ~player[1] & player[0] & ~computer[1] & ~computer[0];

// Scissors ✂️ beat Paper 📄: 10 beats 01
assign w3 = player[1] & ~player[0] & ~computer[1] & computer[0];

// Final win 🏆 condition
assign win = w1 | w2 | w3;

```

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