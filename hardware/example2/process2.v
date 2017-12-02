// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.1
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="process2,hls_ip_2017_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=4.644000,HLS_SYN_LAT=6,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=5,HLS_SYN_LUT=89}" *)

module process2 (
        ap_clk,
        ap_rst,
        in_V_dout,
        in_V_empty_n,
        in_V_read,
        out_V_din,
        out_V_full_n,
        out_V_write
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input  [31:0] in_V_dout;
input   in_V_empty_n;
output   in_V_read;
output  [31:0] out_V_din;
input   out_V_full_n;
output   out_V_write;

reg in_V_read;
reg out_V_write;

reg    in_V_blk_n;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state2;
wire   [0:0] exitcond_fu_60_p2;
reg    out_V_blk_n;
wire   [2:0] i_1_fu_66_p2;
reg    ap_block_state2;
reg   [2:0] i_reg_49;
wire    ap_CS_fsm_state1;
wire   [31:0] tmp_fu_72_p2;
reg   [1:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (exitcond_fu_60_p2 == 1'd0) & ~(((exitcond_fu_60_p2 == 1'd0) & (1'b0 == in_V_empty_n)) | ((exitcond_fu_60_p2 == 1'd0) & (1'b0 == out_V_full_n))))) begin
        i_reg_49 <= i_1_fu_66_p2;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        i_reg_49 <= 3'd0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (exitcond_fu_60_p2 == 1'd0))) begin
        in_V_blk_n = in_V_empty_n;
    end else begin
        in_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (exitcond_fu_60_p2 == 1'd0) & ~(((exitcond_fu_60_p2 == 1'd0) & (1'b0 == in_V_empty_n)) | ((exitcond_fu_60_p2 == 1'd0) & (1'b0 == out_V_full_n))))) begin
        in_V_read = 1'b1;
    end else begin
        in_V_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (exitcond_fu_60_p2 == 1'd0))) begin
        out_V_blk_n = out_V_full_n;
    end else begin
        out_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (exitcond_fu_60_p2 == 1'd0) & ~(((exitcond_fu_60_p2 == 1'd0) & (1'b0 == in_V_empty_n)) | ((exitcond_fu_60_p2 == 1'd0) & (1'b0 == out_V_full_n))))) begin
        out_V_write = 1'b1;
    end else begin
        out_V_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & ~(((exitcond_fu_60_p2 == 1'd0) & (1'b0 == in_V_empty_n)) | ((exitcond_fu_60_p2 == 1'd0) & (1'b0 == out_V_full_n))) & (exitcond_fu_60_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if (((1'b1 == ap_CS_fsm_state2) & (exitcond_fu_60_p2 == 1'd0) & ~(((exitcond_fu_60_p2 == 1'd0) & (1'b0 == in_V_empty_n)) | ((exitcond_fu_60_p2 == 1'd0) & (1'b0 == out_V_full_n))))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_block_state2 = (((exitcond_fu_60_p2 == 1'd0) & (1'b0 == in_V_empty_n)) | ((exitcond_fu_60_p2 == 1'd0) & (1'b0 == out_V_full_n)));
end

assign exitcond_fu_60_p2 = ((i_reg_49 == 3'd5) ? 1'b1 : 1'b0);

assign i_1_fu_66_p2 = (i_reg_49 + 3'd1);

assign out_V_din = (tmp_fu_72_p2 | 32'd1);

assign tmp_fu_72_p2 = in_V_dout << 32'd1;

endmodule //process2
