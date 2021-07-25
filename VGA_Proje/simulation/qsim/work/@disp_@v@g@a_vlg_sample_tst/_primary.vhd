library verilog;
use verilog.vl_types.all;
entity Disp_VGA_vlg_sample_tst is
    port(
        button1         : in     vl_logic;
        button2         : in     vl_logic;
        button3         : in     vl_logic;
        clk_50M         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Disp_VGA_vlg_sample_tst;
