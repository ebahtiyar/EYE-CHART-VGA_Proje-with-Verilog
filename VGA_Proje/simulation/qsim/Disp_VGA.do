onerror {exit -code 1}
vlib work
vlog -work work Disp_VGA.vo
vlog -work work Waveform3.vwf.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Disp_VGA_vlg_vec_tst -voptargs="+acc"
vcd file -direction Disp_VGA.msim.vcd
vcd add -internal Disp_VGA_vlg_vec_tst/*
vcd add -internal Disp_VGA_vlg_vec_tst/i1/*
run -all
quit -f
