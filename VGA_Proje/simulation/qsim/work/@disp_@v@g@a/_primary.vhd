library verilog;
use verilog.vl_types.all;
entity Disp_VGA is
    port(
        clk_50M         : in     vl_logic;
        button1         : in     vl_logic;
        button2         : in     vl_logic;
        button3         : in     vl_logic;
        h_sync          : out    vl_logic;
        v_sync          : out    vl_logic;
        Red             : out    vl_logic;
        Green           : out    vl_logic;
        Blue            : out    vl_logic
    );
end Disp_VGA;
