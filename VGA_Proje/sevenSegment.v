module sevenSegment(
clk,
button1,button2,button3,
digit,
sevenS_out
);
input clk;
input button1,button2,button3;
output reg [6:0]sevenS_out;
output digit = 0;
wire [6:0]zero = 7'b1000000;
wire [6:0]one = 7'b1111001;
wire [6:0]two = 7'b0100100;
wire [6:0]three = 7'b0110000;
wire [6:0]four = 7'b0011001;
wire [6:0]five = 7'b0010010;
wire [6:0]six = 7'b0000010;
wire [6:0]seven = 7'b1111000;
wire [6:0]eigth = 7'b0000000;
//Seven segment shows which pressed button
//and size of letter such as 1 is smallest ,8 is biggest
always@(posedge clk)
begin
if(~button1 && ~button2 && ~button3)
   sevenS_out <= eigth;
else if(button1 && button2 && button3)
   sevenS_out <= one;
else if(~button1 && button2 && button3)
    sevenS_out <= two;
else if(~button1 && ~button2 && button3)
    sevenS_out <= four;
else if(button1 && button2 && ~button3)
    sevenS_out <= five;
else if(button1 && ~button2 && ~button3)
    sevenS_out <= seven;
else if(button1 && ~button2 && button3)
    sevenS_out <= three;
else if(~button1 && button2 && ~button3)
    sevenS_out <= six;
else
    sevenS_out <= zero;
end
endmodule 