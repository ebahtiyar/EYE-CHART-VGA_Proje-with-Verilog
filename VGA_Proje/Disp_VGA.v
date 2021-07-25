module Disp_VGA(
    input clk_50M,
	 input button1,
	 input button2,
	 input button3,
    output reg  h_sync,
    output reg  v_sync,
    output reg  Red,
    output reg  Green,
    output reg  Blue
);
//Screan Parameters 640 * 480
//Horizontal (pixel clocks)
parameter Display_H = 640; //Display Area
parameter FrontP_H =  16; //Front Porch
parameter SyncP_H  = 96; //Sync Pulse
parameter BackP_H  = 48; //Back Porch
parameter Whole_H  = Display_H + FrontP_H + SyncP_H + BackP_H; // Whole screen 800
//Vertical (rows)
parameter Display_V = 480; //Display Area
parameter FrontP_V = 10; // Front Porch
parameter SyncP_V  = 2; //Sync Pulse
parameter BackP_V  = 33;//Back Porch
parameter Whole_V  = Display_V + FrontP_V + SyncP_V + BackP_V; //Whole Screen 525
//We connected FF input with complement of FF output  
reg clock25M = 0;
always@(posedge clk_50M)
begin
		clock25M <= ~clock25M;
end		


reg [9:0] Horizontal_cntr;  
reg [9:0] Vertical_cntr;
//We getting h_sync and v_sync.
always@(posedge(clock25M))
begin
//if the horizontal and vertical counter reaches the edge of one line, it sould be reseted.
    if(Horizontal_cntr == Whole_H - 1)
    begin
       Horizontal_cntr <= 0;
		 if(Vertical_cntr == Whole_V -1)
		    Vertical_cntr <= 0;
		 else
		    Vertical_cntr <= Vertical_cntr + 1; 
    end
	 else
	    Horizontal_cntr <= Horizontal_cntr + 1;
//Our sync is negatif polarity so sync is 1'b0 until Sync Pulse	 
	 if(Horizontal_cntr == Display_H + FrontP_H - 1)
	   h_sync <= 1'b0;
	 else if (Horizontal_cntr == Display_H + FrontP_H + SyncP_H - 1)
	   h_sync <= 1'b1;
		
	 if(Vertical_cntr == Display_V + FrontP_V - 1)
	   v_sync <= 1'b0;
	 else if (Vertical_cntr == Display_V + FrontP_V + SyncP_V - 1)
	   v_sync <= 1'b1;
end
//It is constant values for the size of letter, we got this values from the buttons	
wire [6:0]constant_LR ;
wire [2:0]constant_UD ;
assign constant_LR[0] = 2'b10;
assign constant_LR[1] = button1;  assign constant_LR[2] = button1;  assign constant_LR[3] = button2;  assign constant_LR[4] = button2;
assign constant_LR[5] = button3;  assign constant_LR[6] = button3;  
assign constant_UD[0] = button1; assign constant_UD[1] = button2; assign constant_UD[2] = button3;
wire [3:0]constant_DIM;
assign constant_DIM[0]  = 1'b1;
assign constant_DIM[1] = button1; assign constant_DIM[2] = button2; assign constant_DIM[3] = button3;
   
//Letter parameters
// vertical bar
reg[9:0] bar1_up_pos = 200;
reg[9:0]	bar1_down_pos = 410;
reg[9:0] bar1_left_pos =180;
reg[9:0] bar1_right_pos = 220;
//horizontal bar
reg[9:0] bar2_up_pos = 360;
reg[9:0]	bar2_down_pos = 410;
reg[9:0] bar2_left_pos =221;
reg[9:0] bar2_right_pos = 360;
//We display different colors in L letter each buttons
always@(posedge clock25M)
begin
if(Vertical_cntr>=bar1_up_pos + constant_LR  && Vertical_cntr <= bar1_down_pos 
		        && Horizontal_cntr>= bar1_left_pos + constant_UD + constant_DIM && Horizontal_cntr <= bar1_right_pos)
begin
      if(button1 && (button2))
		begin  
			Green <= 1'b1;  
			Blue <= 1'b0;
			Red <= 1'b0;
		end
		else if(button2 && button3)
		begin  
			Green <= 1'b0;  
			Blue <= 1'b0;
			Red <= 1'b1;
		end
		else if(button3 && button1)
		begin  
			Green <= 1'b0;  
			Blue <= 1'b1;
			Red <= 1'b0;
		end
		else if(button3 && button1 && button2 )
		begin  
			Green <= 1'b1;  
			Blue <= 1'b1;
			Red <= 1'b0;
		end
		else if(button1)
		begin  
			Green <= 1'b0;  
			Blue <= 1'b1;
			Red <= 1'b1;
		end
		else if(button2)
		begin  
			Green <= 1'b1;  
			Blue <= 1'b0;
			Red <= 1'b1;
		end
		else if(button3)
		begin  
			Green <= 1'b0;  
			Blue <= 1'b0;
			Red <= 1'b1;
		end
		else 
		begin  
			Green <= 1'b1;  
			Blue <= 1'b1;
			Red <= 1'b1;
		end 
end

else if(Vertical_cntr>=bar2_up_pos + constant_UD + constant_DIM && Vertical_cntr <= bar2_down_pos 
		        && Horizontal_cntr>= bar2_left_pos   && Horizontal_cntr <= bar2_right_pos - constant_LR )
      if(button1 && (button2))
		begin  
			Green <= 1'b1;  
			Blue <= 1'b0;
			Red <= 1'b0;
		end
		else if(button2 && button3)
		begin  
			Green <= 1'b0;  
			Blue <= 1'b0;
			Red <= 1'b1;
		end
		else if(button3 && button1)
		begin  
			Green <= 1'b0;  
			Blue <= 1'b1;
			Red <= 1'b0;
		end
		else if(button3 && button1 && button2 )
		begin  
			Green <= 1'b1;  
			Blue <= 1'b1;
			Red <= 1'b0;
		end
		else if(button1)
		begin  
			Green <= 1'b0;  
			Blue <= 1'b1;
			Red <= 1'b1;
		end
		else if(button2)
		begin  
			Green <= 1'b1;  
			Blue <= 1'b0;
			Red <= 1'b1;
		end
		else if(button3)
		begin  
			Green <= 1'b0;  
			Blue <= 1'b0;
			Red <= 1'b1;
		end
		else 
		begin  
			Green <= 1'b1;  
			Blue <= 1'b1;
			Red <= 1'b1;
		end 
 else 
		begin  
			Green <= 1'b0;  
			Blue <= 1'b0;
			Red <= 1'b0;
 
		end				
		

end  
endmodule 