module mu0_core (
    input clk,
    input reset,
    output reg [15:0] acc

);
// Here is where i will write all of my logic 

    reg [11:0] pc;
    reg [15:0] ir;
    reg fetch; // If high then you perform a fetch, else you perform an execute 
    reg [15:0] memory [0:255]; // 256 16-bit words of memory
    

    initial begin
        // Program
        memory[0] = 16'h0010; // LDA 16 → load value at address 16
        memory[1] = 16'h2011; // ADD 17 → add value at address 17
        memory[2] = 16'h1012; // STO 18 → store result at address 18
        memory[3] = 16'hF000; // STP    → halt
    
        // Data
        memory[16] = 16'h0005; // value 5
        memory[17] = 16'h0005; // value 5
    end

    always @(posedge clk or posedge reset)
        begin
            // if reset is high that means we set the pc, ir and the acc to 0
            if (reset)
                begin 
                    pc <= 0;
                    ir <= 0;
                    acc <= 0;
                    fetch <= 1;
                end
            else
                begin
                        // Load what ever is at address pc into the 
                    if (fetch)
                        begin
                            ir <= memory[pc];
                            fetch <= 0;
                        end 

                    else
                        begin
                        // Point the pc to the next instruction
                        pc <= pc + 1;
                        case (ir[15:12])
                            4'h0: // LDA, load the value from [11:0] in the accumulator 
                                begin
                                    acc <= memory[ir[11:0]];
                                end 

                            4'h1: // STO, stores the value in the accumulator into that memory address
                                begin 
                                    memory[ir[11:0]] <= acc;
                                end 
                                
                            4'h2: // ADD, acc = acc + memory[ir[11:0]] 
                                begin 
                                    acc <= acc + memory[ir[11:0]];
                                end 

                            4'h3: // SUB, acc = acc - memory[operand]
                                begin 
                                    acc <= acc - memory[ir[11:0]];
                                end 
                            4'h4: // JMP, pc = operand
                                begin
                                    pc <= ir[11:0];

                                end
                            4'h5: // JGE, if acc >= 0, pc = operand
                                begin
                                    if (acc[15] == 0)
                                        begin 
                                            pc <= ir[11:0];
                                        end
                                end
                                    
                            4'h6: // JNE, if acc != 0, pc = operand
                                begin 
                                    if (acc != 0)
                                        begin
                                            pc <= ir[11:0];
                                        end

                                end 
                            4'hF: // STP, halt, do nothing
                                begin
                                    pc <= pc;
                                end
                            
                        endcase
                        fetch <= 1;
                        end
                end
            end

endmodule 