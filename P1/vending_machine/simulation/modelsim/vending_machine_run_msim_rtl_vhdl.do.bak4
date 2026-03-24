transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -2008 -work work {/home/c-ec2024/ra177700/MC613_Best_Group/P1/vending_machine/bin11_to_bcd4.vhd}
vcom -2008 -work work {/home/c-ec2024/ra177700/MC613_Best_Group/P1/vending_machine/bin2hex.vhd}
vcom -2008 -work work {/home/c-ec2024/ra177700/MC613_Best_Group/P1/vending_machine/hex_display_valor.vhd}

vcom -2008 -work work {/home/c-ec2024/ra177700/MC613_Best_Group/P1/vending_machine/bin2hex.vhd}
vcom -2008 -work work {/home/c-ec2024/ra177700/MC613_Best_Group/P1/vending_machine/bin11_to_bcd4.vhd}
vcom -2008 -work work {/home/c-ec2024/ra177700/MC613_Best_Group/P1/vending_machine/hex_display_valor.vhd}
vcom -2008 -work work {/home/c-ec2024/ra177700/MC613_Best_Group/P1/vending_machine/hex_display_valor_tb.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  hex_display_valor_tb

add wave *
view structure
view signals
run -all
