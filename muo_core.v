module mu0_core (
    input clk,
    input reset,
    output reg [15:0] acc

);
// Here is where i will write all of my logic 

    reg [11:0] pc;
    reg [15:0] ir;
    reg [15:0] memory [0:255]; // 256 16-bit words of memory

    always @(posedge clk or posedge reset)
        begin
            // if reset is high that means we set the pc, ir and the acc to 0
            if (reset)
                begin 
                    pc <= 0;
                    ir <= 0;
                    acc <= 0;
                end
            else
                begin
                    // Load what ever is at address pc into the instruction register
                    ir <= memory[pc];
                    // Point the pc to the next instruction
                    pc <= pc + 1;
                end
        end

endmodule 