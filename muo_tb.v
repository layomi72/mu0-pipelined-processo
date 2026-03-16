`timescale 1ns / 1ps 

module module_name_tb;

    // Inputs
    reg input_name;

    // Outputs
    wire output_name;

    // Instantiate the module
    module_name uut (
        .port_name(signal_name)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Main test
    initial begin
        $dumpfile("sim/dump.vcd");
        $dumpvars(0, module_name_tb);

        // initialise inputs
        // run your test
        // stop simulation
        #200 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t output=%0d", $time, output_name);
    end

endmodule