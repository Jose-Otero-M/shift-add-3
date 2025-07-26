# Double Dabble (Shift-Add-3) algorithm implemented in VHDL.

This project was coded in VHDL using Vivado and implemented on the Xilinx Basys 3 board.

## Features
- Implements the Double Dabble (Shift-Add-3) algorithm for binary to BCD conversion.

- Parameterizable input width using the generic `N`.

- Synthesizable VHDL code, compatible with the Xilinx Vivado toolchain.

- Designed and tested for the Xilinx Basys 3 development board.

- Outputs a BCD representation with automatic bit-width estimation based on the input size.

- Modular and reusable VHDL entity for integration into larger digital systems.


## Note:

```vhdl
(N + (N-4)/3 downto 0)
```
The formula above, used in:

```vhdl
BCD_OUT  : out std_logic_vector(N + (N-4)/3 downto 0)
```

`shift_add_3.vhd` is an estimate of the number of bits required for the `BCD_OUT` vector, based on the generic parameter `N`.
Here, `N` corresponds to the number of bits of the input `BIN_DATA` used in the binary-to-BCD conversion.
Make sure that `BCD_OUT` vector has the correct width for your specific input size.
