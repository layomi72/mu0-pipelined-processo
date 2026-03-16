`timescale 1ns / 1ps // This is a verilog compiler directive that sets the time unit and precision of the file 
// All delay values like #5 or #200 are interpreted in nanoseconds so these values mean 5 nanosecondds or 200 nanoseconds respectively 

// 1ps represents the time precision that the simulator uses internally. Times are rounded to the nearest picosecond

module mu0_core_tb;

    // Inputs
    reg clk;
    reg reset;

    // Outputs
    wire [15:0] acc;

    /**
    * This creates an instance of my mu0_core.v module
    * the name of the instance is uut
    */
    mu0_core uut (
        .clk(clk),
        .reset(reset),
        .acc(acc)
    );

    /**
    * Clock generation
    * The line always in the test bench essentially means repeat this forever during the duration of the simulation
    * This line of code is saying every 5 nanoseconds flip the clock, 5 ns high + 5 ns low (10 ns period clock)
    */ 
    always #5 clk = ~clk;

    /* Main test
    *
    *
    *
    */

    initial begin
        $dumpfile("sim/dump.vcd"); // This means create a file inside the sim folder called  dump.vcd, this file will contain all the signal changes during the simulation
        $dumpvars(0, mu0_core_tb); // This means start recording all the signals under mu0_core_tb into that file, 0 means include this module and everything inside it 

        // initialise inputs
        clk = 0;
        reset = 1;
        #10 reset = 0;
        // run your test
        // stop simulation
        #200 $finish;
    end

    /*
    * Monitor outputs:
    * This is for printing values to the simulator console whenever they change
    * $monitor(...): This sets up a continuous print any time any of the values in the argument list changes 
    */ 
    initial begin
        $monitor("Time=%0t acc=%0d", $time, acc); 
    end

endmodule