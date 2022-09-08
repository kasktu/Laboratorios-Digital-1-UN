onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /seleccionador/S
add wave -noupdate /seleccionador/D
add wave -noupdate /seleccionador/Z
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {50 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {535 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern repeater -initialvalue UU -period 50ps -sequence { 00 01 10 11  } -repeat 16 -range 1 0 -starttime 0ps -endtime 1000ps sim:/seleccionador/S 
WaveExpandAll -1
wave create -driver freeze -pattern counter -startvalue 0000 -endvalue 1111 -type Range -direction Up -period 50ps -step 1 -repeat forever -range 3 0 -starttime 0ps -endtime 1000ps sim:/seleccionador/D 
wave create -driver expectedOutput -pattern constant -value UUUU -range 3 0 -starttime 0ps -endtime 1000ps sim:/seleccionador/Z 
wave create -driver freeze -pattern repeater -initialvalue 0000 -period 200ps -sequence { 0001 0010 0100 1000  } -repeat 1 -range 3 0 -starttime 0ps -endtime 1000ps sim:/seleccionador/D 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
