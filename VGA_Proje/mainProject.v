module mainProject(
		input clock,    
		input button1,
		input button2,
		input button3,
        output H_Sync,         
        output Output_B,
        output Output_G, 
        output Output_R,         
        output V_Sync,
		output  digit,
		output [6:0] segment
);


Disp_VGA VGA(

    .clk_50M(clock),
	.button1(button1),
	.button2(button2),
	.button3(button3),
	.h_sync(H_Sync),
    .v_sync(V_Sync),
    .Red(Output_R),
    .Green(Output_G),
    .Blue(Output_B)
);
sevenSegment sevenSegment(

    .clk(clock),
	 .button1(button1),
	 .button2(button2),
	 .button3(button3),
	 .digit(digit),
	 .sevenS_out(segment)
);

endmodule 