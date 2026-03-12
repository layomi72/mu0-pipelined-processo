module mu0_core (
    input clk,
    input reset,
    output reg [15:0] acc

);
// Here is where i will write all of my logic 

    reg [11:0] pc;
    reg [15:0] ir;
    reg [15:0] memory [0:255]; // 256 16-bit words of memory


endmodule 