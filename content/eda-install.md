# Installation of Linux EDA Tools

Once the WSL is setup, we are now ready to install the open source EDA tools.  We will install **Icarus Verilog** `iverilog` 
 and **GTKWave** `gtkwave` from the Ubuntu 24.04 distribution. 

- **INSTALLING iVerilog and GTKwave**:
  - [iVerilog creator Steve Icarus's document page](https://steveicarus.github.io/iverilog)
  - `sudo apt update && sudo apt upgrade -y` : To update your distribution
  - `sudo apt install iverilog gtkwave` : Install iverilog and viewer gtkwave
  - A quick start guide to get you started with iVerilog
    - Create project directory say `mkdir -p ~/iverilog/test` and `cd` to that directory.
    - `iverilog -o tb_mydut.vvp mydut.v tb_mydut.v` : Compile the verilog codes `mydut.v tb_mydut.v` and create an output `tb_mydut.vvp`
    - `vvp tb_mydut.vvp` : Convert the compiled output to a VCD format for GTKWave.
    - `gtkwave dump.vcd` : Note: the filename `dump.vcd` is assumed to be in `tb_mydut.v`

- If you want to execute the first two commands as script, you can add the first two commands to a file called say `run`:

```bash 
iverilog -o tb_mydut.vvp mydut.v tb_mydut.v
vvp tb_mydut.vvp
```

- Now make the file executable by typing the follwoing command: `chmod +x run`
- And from now on, you can simply execute the script by typing `./run`

- Example content of `mydut.v`:

```verilog
// Simple DUT with NAND expression 
module mydut ( input A, input B, output Y);
  assign Y = ~(A & B);
endmodule
```

- Example content of `tb_mydut.v` :

```verilog
module tb_mydut;
  reg A;
  reg B;
  wire Y, Z;
  
  mydut dut0 (.A(A), .B(B), .Y(Y));
  
  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    A <= 0;
    B <= 0;
    #2 
    A <= 0;
    B <= 1'bx;
    #2
    A <= 1;
    B <= 1'bz;
    #2
    A <= 1;
    B <= 1'bx;
    
   #2 $finish;
  end
endmodule
```

---
&copy; 2025 Silicon University, Odisha  
