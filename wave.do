onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ver2_dong_ho_the_ky_TB/cs1
add wave -noupdate /ver2_dong_ho_the_ky_TB/clk
add wave -noupdate /ver2_dong_ho_the_ky_TB/reset_n
add wave -noupdate -label s1 -radix unsigned /ver2_dong_ho_the_ky_TB/dut/s1/count
add wave -noupdate -label s2 -radix unsigned /ver2_dong_ho_the_ky_TB/dut/s2/count
add wave -noupdate -label m1 -radix unsigned /ver2_dong_ho_the_ky_TB/dut/min1/count
add wave -noupdate -label m2 -radix unsigned /ver2_dong_ho_the_ky_TB/dut/min2/count
add wave -noupdate -label h1 -radix unsigned /ver2_dong_ho_the_ky_TB/dut/hours/count_unit
add wave -noupdate -label h2 -radix unsigned /ver2_dong_ho_the_ky_TB/dut/hours/count_ten
add wave -noupdate -label d1 -radix unsigned /ver2_dong_ho_the_ky_TB/dut/days/count_unit
add wave -noupdate -label d2 -radix unsigned /ver2_dong_ho_the_ky_TB/dut/days/count_ten
add wave -noupdate -label mon1 -radix unsigned /ver2_dong_ho_the_ky_TB/dut/months/count_unit
add wave -noupdate -label mon2 -radix unsigned /ver2_dong_ho_the_ky_TB/dut/months/count_ten
add wave -noupdate -radix unsigned /ver2_dong_ho_the_ky_TB/dut/years/count_y_unit
add wave -noupdate -radix unsigned /ver2_dong_ho_the_ky_TB/dut/years/count_y_ten
add wave -noupdate -radix unsigned /ver2_dong_ho_the_ky_TB/dut/years/count_y_hun
add wave -noupdate -radix unsigned /ver2_dong_ho_the_ky_TB/dut/years/current_year
add wave -noupdate /ver2_dong_ho_the_ky_TB/dut/days/detect_2
add wave -noupdate /ver2_dong_ho_the_ky_TB/dut/days/detect_30_31
add wave -noupdate /ver2_dong_ho_the_ky_TB/dut/days/leap_year
add wave -noupdate /ver2_dong_ho_the_ky_TB/dut/days/cm1
add wave -noupdate /ver2_dong_ho_the_ky_TB/dut/months/cy1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10510531554124 ms} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ms
update
WaveRestoreZoom {10201522297029 ms} {12138552547525 ms}
