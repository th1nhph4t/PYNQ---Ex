# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler lc3_reg_r_RAM_AUTO_1R1W BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler lc3_memory_RAM_AUTO_1R1W BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

set axilite_register_dict [dict create]
set port_control {
IR { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
PC { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
PC_out { 
	dir O
	width 16
	depth 1
	mode ap_vld
	offset 32
	offset_end 39
}
R0 { 
	dir O
	width 16
	depth 1
	mode ap_vld
	offset 48
	offset_end 55
}
R1 { 
	dir O
	width 16
	depth 1
	mode ap_vld
	offset 64
	offset_end 71
}
R2 { 
	dir O
	width 16
	depth 1
	mode ap_vld
	offset 80
	offset_end 87
}
R3 { 
	dir O
	width 16
	depth 1
	mode ap_vld
	offset 96
	offset_end 103
}
R4 { 
	dir O
	width 16
	depth 1
	mode ap_vld
	offset 112
	offset_end 119
}
R5 { 
	dir O
	width 16
	depth 1
	mode ap_vld
	offset 128
	offset_end 135
}
R6 { 
	dir O
	width 16
	depth 1
	mode ap_vld
	offset 144
	offset_end 151
}
R7 { 
	dir O
	width 16
	depth 1
	mode ap_vld
	offset 160
	offset_end 167
}
N { 
	dir O
	width 16
	depth 1
	mode ap_vld
	offset 176
	offset_end 183
}
Z { 
	dir O
	width 16
	depth 1
	mode ap_vld
	offset 192
	offset_end 199
}
P { 
	dir O
	width 16
	depth 1
	mode ap_vld
	offset 208
	offset_end 215
}
n1 { 
	dir O
	width 16
	depth 1
	mode ap_vld
	offset 224
	offset_end 231
}
p1 { 
	dir O
	width 16
	depth 1
	mode ap_vld
	offset 240
	offset_end 247
}
z1 { 
	dir O
	width 16
	depth 1
	mode ap_vld
	offset 256
	offset_end 263
}
}
dict set axilite_register_dict control $port_control


# Native S_AXILite:
if {${::AESL::PGuard_simmodel_gen}} {
	if {[info proc ::AESL_LIB_XILADAPTER::s_axilite_gen] == "::AESL_LIB_XILADAPTER::s_axilite_gen"} {
		eval "::AESL_LIB_XILADAPTER::s_axilite_gen { \
			id 3 \
			corename lc3_control_axilite \
			name lc3_control_s_axi \
			ports {$port_control} \
			op interface \
			interrupt_clear_mode TOW \
			interrupt_trigger_type default \
			is_flushable 0 \
			is_datawidth64 0 \
			is_addrwidth64 1 \
		} "
	} else {
		puts "@W \[IMPL-110\] Cannot find AXI Lite interface model in the library. Ignored generation of AXI Lite  interface for 'control'"
	}
}

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler lc3_control_s_axi BINDTYPE interface TYPE interface_s_axilite
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -1 \
    name ${PortName} \
    reset_level 0 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst_n
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -2 \
    name ${PortName} \
    reset_level 0 \
    sync_rst true \
    corename apif_ap_rst_n \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


