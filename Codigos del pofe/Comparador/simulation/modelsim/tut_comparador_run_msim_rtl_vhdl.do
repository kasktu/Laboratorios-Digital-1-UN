transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {E:/intelFPGA_lite/20.1/projects/Comparador/comparador.vhd}
vcom -93 -work work {E:/intelFPGA_lite/20.1/projects/Comparador/comp_bits.vhd}

