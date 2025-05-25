`timescale 1ns / 1ps

module tb_single_port_ram;
    //Parameter
    parameter addr_width = 6;
    parameter data_width = 8;
    parameter depth      = 64;
    
    //Testebench Signals
    reg [data_width - 1 : 0] data;
    reg [addr_width - 1 : 0] addr;
    reg we, clk;
    wire [data_width - 1 : 0] q;
    
    //Instaniate the RAM
    single_port_ram #(addr_width, data_width, depth) uut(
        .data(data),
        .addr(addr),
        .we(we),
        .clk(clk),
        .q(q)
    );
    
    //Clock Generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    //Test Procedure
    initial begin
        //Initialize inputs
        we   = 0;
        addr = 0;
        data = 0;
        #10;
        
        // Write data to the RAM
        we = 1;
        
        addr = 6'd10;
        data = 8'hAA;
        #10;
        
        addr = 6'd20;
        data = 8'h55;
        #10;
            
        addr = 6'd30;
        data = 8'hFF;
        #10;
        
        //Read Mode
        we = 0;
        
        addr = 6'd10;
        #10;
        
        $display("Read data at addr 10: %h (Expected: AA)", q);

        addr = 6'd20;
        #10;
        $display("Read data at addr 20: %h (Expected: 55)", q);

        addr = 6'd30;
        #10;
        $display("Read data at addr 30: %h (Expected: FF)", q);

        addr = 6'd40;
        #10;
        $display("Read data at addr 40: %h (Expected: 00)", q);

        #10;
        $finish;
    
    end    
endmodule
