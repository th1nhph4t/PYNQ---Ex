set moduleName lc3
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {lc3}
set C_modelType { void 0 }
set C_modelArgList {
	{ IR int 16 regular {axi_slave 0}  }
	{ PC int 16 regular {axi_slave 0}  }
	{ PC_out int 16 regular {axi_slave 1}  }
	{ R0 int 16 regular {axi_slave 1}  }
	{ R1 int 16 regular {axi_slave 1}  }
	{ R2 int 16 regular {axi_slave 1}  }
	{ R3 int 16 regular {axi_slave 1}  }
	{ R4 int 16 regular {axi_slave 1}  }
	{ R5 int 16 regular {axi_slave 1}  }
	{ R6 int 16 regular {axi_slave 1}  }
	{ R7 int 16 regular {axi_slave 1}  }
	{ N int 16 regular {axi_slave 1}  }
	{ Z int 16 regular {axi_slave 1}  }
	{ P int 16 regular {axi_slave 1}  }
	{ n1 int 16 regular {axi_slave 1}  }
	{ p1 int 16 regular {axi_slave 1}  }
	{ z1 int 16 regular {axi_slave 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "IR", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "PC", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":24}, "offset_end" : {"in":31}} , 
 	{ "Name" : "PC_out", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 16, "direction" : "WRITEONLY", "offset" : {"out":32}, "offset_end" : {"out":39}} , 
 	{ "Name" : "R0", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 16, "direction" : "WRITEONLY", "offset" : {"out":48}, "offset_end" : {"out":55}} , 
 	{ "Name" : "R1", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 16, "direction" : "WRITEONLY", "offset" : {"out":64}, "offset_end" : {"out":71}} , 
 	{ "Name" : "R2", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 16, "direction" : "WRITEONLY", "offset" : {"out":80}, "offset_end" : {"out":87}} , 
 	{ "Name" : "R3", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 16, "direction" : "WRITEONLY", "offset" : {"out":96}, "offset_end" : {"out":103}} , 
 	{ "Name" : "R4", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 16, "direction" : "WRITEONLY", "offset" : {"out":112}, "offset_end" : {"out":119}} , 
 	{ "Name" : "R5", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 16, "direction" : "WRITEONLY", "offset" : {"out":128}, "offset_end" : {"out":135}} , 
 	{ "Name" : "R6", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 16, "direction" : "WRITEONLY", "offset" : {"out":144}, "offset_end" : {"out":151}} , 
 	{ "Name" : "R7", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 16, "direction" : "WRITEONLY", "offset" : {"out":160}, "offset_end" : {"out":167}} , 
 	{ "Name" : "N", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 16, "direction" : "WRITEONLY", "offset" : {"out":176}, "offset_end" : {"out":183}} , 
 	{ "Name" : "Z", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 16, "direction" : "WRITEONLY", "offset" : {"out":192}, "offset_end" : {"out":199}} , 
 	{ "Name" : "P", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 16, "direction" : "WRITEONLY", "offset" : {"out":208}, "offset_end" : {"out":215}} , 
 	{ "Name" : "n1", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 16, "direction" : "WRITEONLY", "offset" : {"out":224}, "offset_end" : {"out":231}} , 
 	{ "Name" : "p1", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 16, "direction" : "WRITEONLY", "offset" : {"out":240}, "offset_end" : {"out":247}} , 
 	{ "Name" : "z1", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 16, "direction" : "WRITEONLY", "offset" : {"out":256}, "offset_end" : {"out":263}} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 9 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 9 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"IR","role":"data","value":"16"},{"name":"PC","role":"data","value":"24"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"PC_out","role":"data","value":"32"}, {"name":"PC_out","role":"valid","value":"36","valid_bit":"0"},{"name":"R0","role":"data","value":"48"}, {"name":"R0","role":"valid","value":"52","valid_bit":"0"},{"name":"R1","role":"data","value":"64"}, {"name":"R1","role":"valid","value":"68","valid_bit":"0"},{"name":"R2","role":"data","value":"80"}, {"name":"R2","role":"valid","value":"84","valid_bit":"0"},{"name":"R3","role":"data","value":"96"}, {"name":"R3","role":"valid","value":"100","valid_bit":"0"},{"name":"R4","role":"data","value":"112"}, {"name":"R4","role":"valid","value":"116","valid_bit":"0"},{"name":"R5","role":"data","value":"128"}, {"name":"R5","role":"valid","value":"132","valid_bit":"0"},{"name":"R6","role":"data","value":"144"}, {"name":"R6","role":"valid","value":"148","valid_bit":"0"},{"name":"R7","role":"data","value":"160"}, {"name":"R7","role":"valid","value":"164","valid_bit":"0"},{"name":"N","role":"data","value":"176"}, {"name":"N","role":"valid","value":"180","valid_bit":"0"},{"name":"Z","role":"data","value":"192"}, {"name":"Z","role":"valid","value":"196","valid_bit":"0"},{"name":"P","role":"data","value":"208"}, {"name":"P","role":"valid","value":"212","valid_bit":"0"},{"name":"n1","role":"data","value":"224"}, {"name":"n1","role":"valid","value":"228","valid_bit":"0"},{"name":"p1","role":"data","value":"240"}, {"name":"p1","role":"valid","value":"244","valid_bit":"0"},{"name":"z1","role":"data","value":"256"}, {"name":"z1","role":"valid","value":"260","valid_bit":"0"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "lc3",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6", "EstimateLatencyMax" : "9",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "IR", "Type" : "None", "Direction" : "I"},
			{"Name" : "PC", "Type" : "None", "Direction" : "I"},
			{"Name" : "PC_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "R0", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "R1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "R2", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "R3", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "R4", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "R5", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "R6", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "R7", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "N", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "Z", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "P", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "n1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "z1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "reg_r", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "z_r", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "n_r", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_r", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "memory", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.reg_r_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.memory_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	lc3 {
		IR {Type I LastRead 0 FirstWrite -1}
		PC {Type I LastRead 0 FirstWrite -1}
		PC_out {Type O LastRead -1 FirstWrite 9}
		R0 {Type O LastRead -1 FirstWrite 9}
		R1 {Type O LastRead -1 FirstWrite 9}
		R2 {Type O LastRead -1 FirstWrite 9}
		R3 {Type O LastRead -1 FirstWrite 9}
		R4 {Type O LastRead -1 FirstWrite 9}
		R5 {Type O LastRead -1 FirstWrite 9}
		R6 {Type O LastRead -1 FirstWrite 9}
		R7 {Type O LastRead -1 FirstWrite 9}
		N {Type O LastRead -1 FirstWrite 3}
		Z {Type O LastRead -1 FirstWrite 3}
		P {Type O LastRead -1 FirstWrite 3}
		n1 {Type O LastRead -1 FirstWrite 3}
		p1 {Type O LastRead -1 FirstWrite 3}
		z1 {Type O LastRead -1 FirstWrite 3}
		reg_r {Type IO LastRead -1 FirstWrite -1}
		z_r {Type IO LastRead -1 FirstWrite -1}
		n_r {Type IO LastRead -1 FirstWrite -1}
		p_r {Type IO LastRead -1 FirstWrite -1}
		memory {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "6", "Max" : "9"}
	, {"Name" : "Interval", "Min" : "7", "Max" : "10"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
