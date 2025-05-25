`timescale 1ns / 1ps

module single_port_ram #(
    parameter addr_width = 6,
    parameter data_width = 8,
    parameter depth      = 64
)(
    input [data_width - 1 : 0] data,     
    input [addr_width - 1 : 0] addr,     
    input we, clk,                    // Write Enable (WE): write => 1 and read => 0
    output reg [data_width - 1 : 0] q    
);

    reg [data_width - 1 : 0] ram [0 : depth - 1];
    
    //Initialize RAM to zero
    integer i;
    initial begin
        for (i = 0; i < depth; i = i + 1)
            ram[i] = 0;
    end         
    initial q = 0;
    always @(posedge clk) begin
        if (we)
            ram[addr] <= data;    
        else
            q <= ram[addr];         
    end
endmodule
