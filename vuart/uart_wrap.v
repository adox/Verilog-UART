`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:24:58 08/15/2012 
// Design Name: 
// Module Name:    uart_wrap 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
// Received byte is displayed on the 7 seg. display.
// When BTN1 is pressed, unit is transmitting byte 0xCC.
// Baud rate 9600
//
//////////////////////////////////////////////////////////////////////////////////
module uart_wrap(
    input clk, // The master clock for this module
    input nrst, // Synchronous neg reset.
    input rx, // Incoming serial line
    output tx, // Outgoing serial line
    input ntransmit, // Signal to transmit
    output received, // Indicated that a byte has been received.
    output [7:0] led_disp, // 7 segment led display
	 output [3:0] led_disp_cc // common cathode output
    );

wire rst;
reg transmit;
wire is_transmitting;
wire [7:0] tx_byte;

assign rst = ~nrst;
//assign transmit = ~ntransmit;

assign led_disp_cc[3:0] = 4'b1110;
assign tx_byte[7:0] = 8'b11001100;


always @(negedge ntransmit or posedge is_transmitting)
	if(is_transmitting)
		transmit = 1'b0;
	else
		transmit = 1'b1;
	

 // instantinate uart module
uart uart1(
	.clk(clk),
	.rst(rst),
	.rx(rx),
	.tx(tx),
	.transmit(transmit),
	.received(received),
	.rx_byte(led_disp),
	.tx_byte(tx_byte),
	.is_transmitting(is_transmitting)
	);

endmodule
