transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/intelFPGA_lite/20.1/proyects/Laboratorios/sumadorRestador/sumadorRestador1Bit.vhd}
vcom -93 -work work {C:/intelFPGA_lite/20.1/proyects/Laboratorios/sumadorRestador/sumadorRestador.vhd}
vcom -93 -work work {C:/intelFPGA_lite/20.1/proyects/Laboratorios/sumadorRestador/medioSumador.vhd}

