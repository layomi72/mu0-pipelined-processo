module lcd_driver (
    input        clk,
    input        reset,

    // command/data interface
    input [7:0]  char_to_print, // The character we want to print 
    input        send,   
    input        rs_to_send, // if 0 then control register, if 1 then data register
    output       busy,
    output       read_write,
    output       rs,
    output       enable,
    output       backlight,
    output [7:0] lcd_data_bus
);
    // Regs (this is what the always @posedge clock is going to write to)
    reg  [7:0]   data_bus_reg;
    reg  read_write_reg;
    reg  rs_reg;
    reg  enable_reg;
    reg  backlight_reg;
    reg  busy_reg;
    
    assign       busy = busy_reg;
    assign       read_write = read_write_reg;
    assign       rs = rs_reg;
    assign       enable = enable_reg;
    assign       backlight = backlight_reg;
    assign [7:0] lcd_data_bus = data_bus_reg;


    




endmodule