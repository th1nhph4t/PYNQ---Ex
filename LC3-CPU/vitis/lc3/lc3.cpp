void lc3(short IR, short PC, short& PC_out, short& R0, short& R1, short& R2, short& R3, short& R4, short& R5, short& R6, short& R7,short& N, short& Z, short& P, short& n1, short& p1, short& z1) {
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE s_axilite port=IR
#pragma HLS INTERFACE s_axilite port=PC
#pragma HLS INTERFACE s_axilite port=PC_out
#pragma HLS INTERFACE s_axilite port=R0
#pragma HLS INTERFACE s_axilite port=R1
#pragma HLS INTERFACE s_axilite port=R2
#pragma HLS INTERFACE s_axilite port=R3
#pragma HLS INTERFACE s_axilite port=R4
#pragma HLS INTERFACE s_axilite port=R5
#pragma HLS INTERFACE s_axilite port=R6
#pragma HLS INTERFACE s_axilite port=R7
#pragma HLS INTERFACE s_axilite port=n1
#pragma HLS INTERFACE s_axilite port=z1
#pragma HLS INTERFACE s_axilite port=p1
#pragma HLS INTERFACE s_axilite port=N
#pragma HLS INTERFACE s_axilite port=Z
#pragma HLS INTERFACE s_axilite port=P

	static short reg[8]; //Thanh ghi R0-R7
	static short memory[65536]; //Bộ nhớ 16 bit
	static int n;
	static int p;
	static int z;
	int OP;
	int PC1;
	int dr;
	int sr1;
	int sr2;
	int IR5;
	int pc_offset9;
	int pc_offset11;
	int pc_offset6;
	int imm5;
	int bit11;


	OP = (IR >> 12) & 0xf;



	switch (OP) {
		case 1: //ADD
			PC = PC + 1;
			imm5 = (IR & 0x1F);
			dr = (IR >> 9) & 0x7;
			sr1 = (IR >> 6) & 0x7;
			sr2 = (IR & 0x7);
			IR5 = (IR >> 5) & 0x1;
			if (IR5 == 1)
				reg[dr] = reg[sr1] + imm5;

			else
				reg[dr] = reg[sr1] + reg[sr2];
			//Cập nhật giá trị n, z, p
				    			if (reg[dr] == 0){
				    				z = 1;
				    				n = 0;
				    				p = 0;
				    			}else if(reg[dr] > 0){
				    				z = 0;
				    				n = 0;
				    				p = 1;
				    			}else {
				    				z = 0;
				    				n = 1;
				    				p = 0;
				    			}

			break;
		case 5: //AND
			PC = PC + 1;
			imm5 = (IR & 0x1F);
						dr = (IR >> 9) & 0x7;
						sr1 = (IR >> 6) & 0x7;
						sr2 = (IR & 0x7);
						IR5 = (IR >> 5) & 0x1;
			if (IR5 == 1)
				reg[dr] = reg[sr1] & imm5;

			else
				reg[dr] = reg[sr1] & reg[sr2];
			//Cập nhật giá trị n, z, p
				    			if (reg[dr] == 0){
				    				z = 1;
				    				n = 0;
				    				p = 0;
				    			}else if(reg[dr] > 0){
				    				z = 0;
				    				n = 0;
				    				p = 1;
				    			}else {
				    				z = 0;
				    				n = 1;
				    				p = 0;
				    			}

			break;
		case 9: //NOT
			PC = PC + 1;
			dr = (IR >> 9) & 0x7;
			sr1 = (IR >> 6) & 0x7;
			reg[dr] = ~reg[sr1];
			//Cập nhật giá trị n, z, p
				    			if (reg[dr] == 0){
				    				z = 1;
				    				n = 0;
				    				p = 0;
				    			}else if(reg[dr] > 0){
				    				z = 0;
				    				n = 0;
				    				p = 1;
				    			}else {
				    				z = 0;
				    				n = 1;
				    				p = 0;
				    			}

			break;
		case 2: //LD
			PC = PC + 1;
			dr = (IR >> 9) & 0x7;
			pc_offset9 = IR & 0x1FF;
			reg[dr] = memory[PC + 1 + pc_offset9];
			//Cập nhật giá trị n, z, p
				    			if (reg[dr] == 0){
				    				z = 1;
				    				n = 0;
				    				p = 0;
				    			}else if(reg[dr] > 0){
				    				z = 0;
				    				n = 0;
				    				p = 1;
				    			}else {
				    				z = 0;
				    				n = 1;
				    				p = 0;
				    			}

			break;
		case 10: //LDI
			PC = PC + 1;
			dr = (IR >> 9) & 0x7;
			pc_offset9 = IR & 0x1FF;
			reg[dr] = memory[memory[PC + 1 + pc_offset9]];
			//Cập nhật giá trị n, z, p
				    			if (reg[dr] == 0){
				    				z = 1;
				    				n = 0;
				    				p = 0;
				    			}else if(reg[dr] > 0){
				    				z = 0;
				    				n = 0;
				    				p = 1;
				    			}else {
				    				z = 0;
				    				n = 1;
				    				p = 0;
				    			}

			break;
		case 6: //LDR
			PC = PC + 1;
			dr = (IR >> 9) & 0x7;
			sr1 = (IR >> 6) & 0x7;
			pc_offset6 = (IR & 0x3F);
			reg[dr] = memory[reg[sr1] + pc_offset6];
			//Cập nhật giá trị n, z, p
				    			if (reg[dr] == 0){
				    				z = 1;
				    				n = 0;
				    				p = 0;
				    			}else if(reg[dr] > 0){
				    				z = 0;
				    				n = 0;
				    				p = 1;
				    			}else {
				    				z = 0;
				    				n = 1;
				    				p = 0;
				    			}

			break;
		case 14: //LEA
			PC = PC + 1;
			dr = (IR >> 9)  & 0x7;
			pc_offset9 = (IR & 0x1FF);
			reg[dr] = PC + pc_offset9;
			//Cập nhật giá trị n, z, p
				    			if (reg[dr] == 0){
				    				z = 1;
				    				n = 0;
				    				p = 0;
				    			}else if(reg[dr] > 0){
				    				z = 0;
				    				n = 0;
				    				p = 1;
				    			}else {
				    				z = 0;
				    				n = 1;
				    				p = 0;
				    			}

			break;
		case 3: //ST
			PC = PC + 1;
			sr1 = (IR >> 9) & 0x7;
			pc_offset9 = IR & 0x1FF;
			memory[PC + 1 + pc_offset9] = reg[sr1];

			break;
		case 11: //STI
			PC = PC + 1;
			sr1 = (IR >> 9) & 0x7;
			pc_offset9 = IR & 0x1FF;
			memory[memory[PC + 1 + pc_offset9]] = reg[sr1];

			break;
		case 7: //STR
			PC = PC + 1;
			sr1 = (IR >>9) & 0x7;
			dr = (IR >> 6) & 0x7;
			pc_offset6 = IR & 0x3F;
			memory[reg[dr] + pc_offset6] = reg[sr1];

			break;
		case 12: //JMP
			sr1 = (IR >> 6) & 0x7;
			PC1 = reg[sr1];
			break;
		case 4: //JSR & JSRR
			reg [7] = PC;
			sr1 = (IR >> 6) & 0x7;
			bit11 = (IR >> 11) & 0x1;
			pc_offset11 = IR & 0x7FF;
			if (bit11 == 1)
				PC1 = PC + pc_offset11;
			else
				PC1 = reg[sr1];
			break;
		case 0: //BR
			pc_offset9 = IR & 0x1FF;

			n1 = (IR >> 11) & 0x1;
			z1 = (IR >> 10) & 0x1;
			p1 = (IR >> 9) & 0x1;
			N = n & n1;
			P = p & p1;
			Z = z & z1;
			if (N == 1 || P == 1 || Z == 1)
				PC1 = PC + pc_offset9;
			else
				PC1 = PC + 1;
			break;


		default:
			break;

	}
	 	R0 = reg[0];
	    R1 = reg[1];
	    R2 = reg[2];
	    R3 = reg[3];
	    R4 = reg[4];
	    R5 = reg[5];
	    R6 = reg[6];
	    R7 = reg[7];

	    if (OP == 12 || OP == 4 || OP == 0)
	    	PC_out = PC1;

	    else
	    	PC_out = PC;


}
