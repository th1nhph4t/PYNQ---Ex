# This script segment is generated automatically by AutoPilot

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


