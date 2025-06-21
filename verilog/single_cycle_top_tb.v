`timescale 1ns / 1ps
module single_cycle_top_tb;

    reg clk;
    reg reset;
    single_cycle_top uut (
        .clk(clk),
        .reset(reset)
    );
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        reset = 1; 
        #20;
        reset = 0;
        #1000; 
        $finish;
    end
    initial
    begin
        $dumpfile("Risc.vcd");
        $dumpvars();
    end
    initial begin
        $monitor("Time: %0t | PC: %h | Instr: %h | ALU_Out: %d | WD: %d | RD: %h",
                 $time, uut.PC_out, uut.instr, uut.ALU_out, uut.WD, uut.RD);
    end

endmodule
