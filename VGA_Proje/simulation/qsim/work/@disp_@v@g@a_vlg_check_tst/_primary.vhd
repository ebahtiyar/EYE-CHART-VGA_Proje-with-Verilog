library verilog;
use verilog.vl_types.all;
entity Disp_VGA_vlg_check_tst is
    port(
        Blue            : in     vl_logic;
        Green           : in     vl_logic;
        Red             : in     vl_logic;
        h_sync          : in     vl_logic;
        v_sync          : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Disp_VGA_vlg_check_tst;
