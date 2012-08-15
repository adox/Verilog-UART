`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:01:33 08/04/2012
// Design Name:   uart
// Module Name:   E:/Projekty/fpgamr/hardware/trunk/fpga/uart/uart/uart_tb.v
// Project Name:  uart
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: uart
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module uart_tb;

	// Inputs
	reg rst;
	reg rx;
	reg transmit;
	reg [7:0] tx_byte;

	// Outputs
	wire tx;
	wire received;
	wire [7:0] rx_byte;
	wire is_receiving;
	wire is_transmitting;
	wire recv_error;
	
	reg clock;
	initial clock = 1'b0;  
   parameter CLOCK_PERIOD = 2; 
   always #(CLOCK_PERIOD/2) clock = ~clock; 

	// Instantiate the Unit Under Test (UUT)
	uart uut (
		.clk(clock), 
		.rst(rst), 
		.rx(rx), 
		.tx(tx), 
		.transmit(transmit), 
		.tx_byte(tx_byte), 
		.received(received), 
		.rx_byte(rx_byte), 
		.is_receiving(is_receiving), 
		.is_transmitting(is_transmitting), 
		.recv_error(recv_error)
	);

	initial begin
		// Initialize Inputs
		rst = 1;
		rx = 1;
		transmit = 0;
		tx_byte = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$display("Stimulus begin");
		rst = 0;
		tx_byte = 8'b11001100;
		#100 transmit = 1;

	end
      
endmodule

