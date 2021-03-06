// ----------------------------------------------------------------------------
// LegUp High-Level Synthesis Tool Version 5.1 (http://legupcomputing.com)
// Copyright (c) 2015-2017 LegUp Computing Inc. All Rights Reserved.
// For technical issues, please contact: support@legupcomputing.com
// For general inquiries, please contact: info@legupcomputing.com
// Date: Tue Dec  5 02:15:44 2017
// ----------------------------------------------------------------------------
`define MEMORY_CONTROLLER_ADDR_SIZE 32
// This directory contains the memory initialization files generated by LegUp.
// This is a relative path to the directories where simulation and FPGA vendors' synthesis flow will run.
`define MEM_INIT_DIR "../mem_init/"

`timescale 1 ns / 1 ns
module main
(
	clk,
	reset,
	start,
	finish,
	return_val,
	auto_pthread_wrapper_start,
	auto_pthread_wrapper_threadID,
	main_0_1_ready_to_source,
	main_0_1_valid_from_source,
	main_0_1_data_from_source
);

parameter [1:0] LEGUP_0 = 2'd0;
parameter [1:0] LEGUP_F_main_BB__0_1 = 2'd1;
parameter [1:0] LEGUP_F_main_BB__0_3 = 2'd3;
parameter [1:0] LEGUP_function_call_2 = 2'd2;

input  clk;
input  reset;
input  start;
output reg  finish;
output reg [31:0] return_val;
output reg  auto_pthread_wrapper_start;
output reg [15:0] auto_pthread_wrapper_threadID;
output reg  main_0_1_ready_to_source;
input  main_0_1_valid_from_source;
input [63:0] main_0_1_data_from_source;
reg [1:0] cur_state;
reg [1:0] next_state;
reg  fsm_stall;
reg [63:0] main_0_2;
reg  main_0_1_inputFIFO_consumed_valid;
reg [63:0] main_0_1_inputFIFO_consumed_data;
reg  main_0_1_inputFIFO_consumed_taken;


/* Unsynthesizable Statements */
/* synthesis translate_off */
always @(posedge clk)
	if (!fsm_stall) begin
	/* main: %0*/
	/*   %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i64 %2) #7, !dbg !145, !MSB !146, !LSB !132, !extendFrom !146*/
	if ((cur_state == LEGUP_F_main_BB__0_3)) begin
		$write("%d", $signed(main_0_2));
		// to fix quartus warning
		if (reset == 1'b0 && ^(main_0_2) === 1'bX) finish <= 0;
	end
end
/* synthesis translate_on */
always @(posedge clk) begin
if (reset == 1'b1)
	cur_state <= LEGUP_0;
else if (!fsm_stall)
	cur_state <= next_state;
end

always @(*)
begin
next_state = cur_state;
case(cur_state)  // synthesis parallel_case  
LEGUP_0:
	if ((fsm_stall == 1'd0) && (start == 1'd1))
		next_state = LEGUP_F_main_BB__0_1;
LEGUP_F_main_BB__0_1:
		next_state = LEGUP_function_call_2;
LEGUP_F_main_BB__0_3:
		next_state = LEGUP_0;
LEGUP_function_call_2:
		next_state = LEGUP_F_main_BB__0_3;
default:
	next_state = cur_state;
endcase

end
always @(*) begin
	fsm_stall = 1'd0;
	if (((cur_state == LEGUP_F_main_BB__0_3) & ~(main_0_1_inputFIFO_consumed_valid))) begin
		fsm_stall = 1'd1;
	end
end
always @(*) begin
	main_0_2 = main_0_1_inputFIFO_consumed_data;
end
always @(posedge clk) begin
	if (main_0_1_inputFIFO_consumed_taken) begin
		main_0_1_inputFIFO_consumed_valid <= 1'd0;
	end
	if ((main_0_1_ready_to_source & main_0_1_valid_from_source)) begin
		main_0_1_inputFIFO_consumed_valid <= 1'd1;
	end
	if (reset) begin
		main_0_1_inputFIFO_consumed_valid <= 1'd0;
	end
end
always @(posedge clk) begin
	if ((main_0_1_ready_to_source & main_0_1_valid_from_source)) begin
		main_0_1_inputFIFO_consumed_data <= main_0_1_data_from_source;
	end
	if (reset) begin
		main_0_1_inputFIFO_consumed_data <= 1'd0;
	end
end
always @(*) begin
	main_0_1_inputFIFO_consumed_taken = 1'd0;
	if (reset) begin
		main_0_1_inputFIFO_consumed_taken = 1'd0;
	end
	if ((cur_state == LEGUP_F_main_BB__0_3)) begin
		main_0_1_inputFIFO_consumed_taken = ~(fsm_stall);
	end
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
	end
	/* main: %0*/
	/*   ret i32 0, !dbg !151, !MSB !131, !LSB !132, !extendFrom !131*/
	if ((cur_state == LEGUP_F_main_BB__0_3)) begin
		finish <= (fsm_stall == 1'd0);
	end
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		return_val <= 0;
	end
	/* main: %0*/
	/*   ret i32 0, !dbg !151, !MSB !131, !LSB !132, !extendFrom !131*/
	if ((cur_state == LEGUP_F_main_BB__0_3)) begin
		return_val <= 32'd0;
	end
end
always @(posedge clk) begin
	if (reset) begin
		auto_pthread_wrapper_start <= 1'd0;
	end
	/* main: %0*/
	/*   call fastcc void @auto_pthread_wrapper(%struct.FIFO* %1) #8, !dbg !137, !PTHREADNAME !138, !NUMTHREADS !139, !FUNCTIONID !132, !TYPE !140, !MSB !131, !LSB !132, !extendFrom !131*/
	if ((cur_state == LEGUP_F_main_BB__0_1)) begin
		auto_pthread_wrapper_start <= 1'd1;
	end
	/* main: %0*/
	/*   call fastcc void @auto_pthread_wrapper(%struct.FIFO* %1) #8, !dbg !137, !PTHREADNAME !138, !NUMTHREADS !139, !FUNCTIONID !132, !TYPE !140, !MSB !131, !LSB !132, !extendFrom !131*/
	if (((cur_state == LEGUP_function_call_2) & ~(fsm_stall))) begin
		auto_pthread_wrapper_start <= 1'd0;
	end
end
always @(posedge clk) begin
	/* main: %0*/
	/*   call fastcc void @auto_pthread_wrapper(%struct.FIFO* %1) #8, !dbg !137, !PTHREADNAME !138, !NUMTHREADS !139, !FUNCTIONID !132, !TYPE !140, !MSB !131, !LSB !132, !extendFrom !131*/
	if ((cur_state == LEGUP_F_main_BB__0_1)) begin
		auto_pthread_wrapper_threadID <= 1'd0;
	end
end
always @(*) begin
	main_0_1_ready_to_source = (~(main_0_1_inputFIFO_consumed_valid) | main_0_1_inputFIFO_consumed_taken);
	if (reset) begin
		main_0_1_ready_to_source = 1'd0;
	end
end

endmodule
`timescale 1 ns / 1 ns
module auto_pthread_wrapper
(
	clk,
	reset,
	start,
	finish,
	main_0_1_ready_from_sink,
	main_0_1_valid_to_sink,
	main_0_1_data_to_sink
);

parameter  LEGUP_0 = 1'd0;
parameter  LEGUP_F_auto_pthread_wrapper_BB__0_1 = 1'd1;

input  clk;
input  reset;
input  start;
output reg  finish;
input  main_0_1_ready_from_sink;
output reg  main_0_1_valid_to_sink;
output reg [63:0] main_0_1_data_to_sink;
reg  cur_state;
reg  next_state;
reg  fsm_stall;
reg  main_0_1_outputFIFO_LEGUP_F_auto_pthread_wrapper_BB__0_1_not_accessed_due_to_stall_a;
reg  main_0_1_outputFIFO_LEGUP_F_auto_pthread_wrapper_BB__0_1_stalln_reg;
reg  main_0_1_outputFIFO_LEGUP_F_auto_pthread_wrapper_BB__0_1_enable_cond_a;


always @(posedge clk) begin
if (reset == 1'b1)
	cur_state <= LEGUP_0;
else if (!fsm_stall)
	cur_state <= next_state;
end

always @(*)
begin
next_state = cur_state;
case(cur_state)  // synthesis parallel_case  
LEGUP_0:
	if ((fsm_stall == 1'd0) && (start == 1'd1))
		next_state = LEGUP_F_auto_pthread_wrapper_BB__0_1;
LEGUP_F_auto_pthread_wrapper_BB__0_1:
		next_state = LEGUP_0;
default:
	next_state = cur_state;
endcase

end
always @(*) begin
	fsm_stall = 1'd0;
	if (((cur_state == LEGUP_F_auto_pthread_wrapper_BB__0_1) & ~(main_0_1_ready_from_sink))) begin
		fsm_stall = 1'd1;
	end
end
always @(posedge clk) begin
	main_0_1_outputFIFO_LEGUP_F_auto_pthread_wrapper_BB__0_1_not_accessed_due_to_stall_a <= ((fsm_stall & main_0_1_valid_to_sink) & ~(main_0_1_ready_from_sink));
end
always @(posedge clk) begin
	main_0_1_outputFIFO_LEGUP_F_auto_pthread_wrapper_BB__0_1_stalln_reg <= ~(fsm_stall);
end
always @(*) begin
	main_0_1_outputFIFO_LEGUP_F_auto_pthread_wrapper_BB__0_1_enable_cond_a = ((cur_state == LEGUP_F_auto_pthread_wrapper_BB__0_1) & (main_0_1_outputFIFO_LEGUP_F_auto_pthread_wrapper_BB__0_1_not_accessed_due_to_stall_a | main_0_1_outputFIFO_LEGUP_F_auto_pthread_wrapper_BB__0_1_stalln_reg));
end
always @(posedge clk) begin
	if ((cur_state == LEGUP_0)) begin
		finish <= 1'd0;
	end
	/* auto_pthread_wrapper: %0*/
	/*   ret void, !MSB !178, !LSB !179, !extendFrom !178*/
	if ((cur_state == LEGUP_F_auto_pthread_wrapper_BB__0_1)) begin
		finish <= (fsm_stall == 1'd0);
	end
end
always @(*) begin
	main_0_1_valid_to_sink = 1'd0;
	if (main_0_1_outputFIFO_LEGUP_F_auto_pthread_wrapper_BB__0_1_enable_cond_a) begin
		main_0_1_valid_to_sink = 1'd1;
	end
end
always @(*) begin
	main_0_1_data_to_sink = 64'd0;
	/* auto_pthread_wrapper: %0*/
	/*   tail call void @fifo_write(%struct.FIFO* %.0.0.val, i64 7) #7, !dbg !190, !MSB !178, !LSB !179, !extendFrom !178*/
	if ((cur_state == LEGUP_F_auto_pthread_wrapper_BB__0_1)) begin
		main_0_1_data_to_sink = 64'd7;
	end
end

endmodule
`timescale 1 ns / 1 ns
module top
(
	clk,
	reset,
	start,
	finish,
	return_val
);

input  clk;
input  reset;
input  start;
output reg  finish;
output reg [31:0] return_val;
reg  main_inst_clk;
reg  main_inst_reset;
reg  main_inst_start;
wire  main_inst_finish;
wire [31:0] main_inst_return_val;
wire  main_inst_auto_pthread_wrapper_start;
wire [15:0] main_inst_auto_pthread_wrapper_threadID;
wire  main_inst_main_0_1_ready_to_source;
reg  main_inst_main_0_1_valid_from_source;
reg [63:0] main_inst_main_0_1_data_from_source;
reg  main_inst_finish_reg;
reg [31:0] main_inst_return_val_reg;
reg  main_0_1_inst_clk;
reg  main_0_1_inst_reset;
reg  main_0_1_inst_clken;
reg  main_0_1_inst_write_en;
reg [63:0] main_0_1_inst_write_data;
reg  main_0_1_inst_read_en;
wire [63:0] main_0_1_inst_read_data;
wire  main_0_1_inst_full;
wire  main_0_1_inst_almost_full;
wire  main_0_1_inst_empty;
wire  main_0_1_inst_almost_empty;
wire [4:0] main_0_1_inst_usedw;
reg  auto_pthread_wrapper_inst_clk;
reg  auto_pthread_wrapper_inst_reset;
reg  auto_pthread_wrapper_inst_start;
wire  auto_pthread_wrapper_inst_finish;
reg  auto_pthread_wrapper_inst_main_0_1_ready_from_sink;
wire  auto_pthread_wrapper_inst_main_0_1_valid_to_sink;
wire [63:0] auto_pthread_wrapper_inst_main_0_1_data_to_sink;
reg  auto_pthread_wrapper_inst_finish_reg;


main main_inst (
	.clk (main_inst_clk),
	.reset (main_inst_reset),
	.start (main_inst_start),
	.finish (main_inst_finish),
	.return_val (main_inst_return_val),
	.auto_pthread_wrapper_start (main_inst_auto_pthread_wrapper_start),
	.auto_pthread_wrapper_threadID (main_inst_auto_pthread_wrapper_threadID),
	.main_0_1_ready_to_source (main_inst_main_0_1_ready_to_source),
	.main_0_1_valid_from_source (main_inst_main_0_1_valid_from_source),
	.main_0_1_data_from_source (main_inst_main_0_1_data_from_source)
);



fwft_fifo main_0_1_inst (
	.clk (main_0_1_inst_clk),
	.reset (main_0_1_inst_reset),
	.clken (main_0_1_inst_clken),
	.write_en (main_0_1_inst_write_en),
	.write_data (main_0_1_inst_write_data),
	.read_en (main_0_1_inst_read_en),
	.read_data (main_0_1_inst_read_data),
	.full (main_0_1_inst_full),
	.almost_full (main_0_1_inst_almost_full),
	.empty (main_0_1_inst_empty),
	.almost_empty (main_0_1_inst_almost_empty),
	.usedw (main_0_1_inst_usedw)
);

defparam
	main_0_1_inst.width = 64,
	main_0_1_inst.depth = 8,
	main_0_1_inst.widthad = 4;


auto_pthread_wrapper auto_pthread_wrapper_inst (
	.clk (auto_pthread_wrapper_inst_clk),
	.reset (auto_pthread_wrapper_inst_reset),
	.start (auto_pthread_wrapper_inst_start),
	.finish (auto_pthread_wrapper_inst_finish),
	.main_0_1_ready_from_sink (auto_pthread_wrapper_inst_main_0_1_ready_from_sink),
	.main_0_1_valid_to_sink (auto_pthread_wrapper_inst_main_0_1_valid_to_sink),
	.main_0_1_data_to_sink (auto_pthread_wrapper_inst_main_0_1_data_to_sink)
);



always @(*) begin
	main_inst_clk = clk;
end
always @(*) begin
	main_inst_reset = reset;
end
always @(*) begin
	main_inst_start = start;
end
always @(*) begin
	main_inst_main_0_1_valid_from_source = ~(main_0_1_inst_empty);
end
always @(*) begin
	main_inst_main_0_1_data_from_source = main_0_1_inst_read_data;
end
always @(posedge clk) begin
	if ((reset | main_inst_start)) begin
		main_inst_finish_reg <= 1'd0;
	end
	if (main_inst_finish) begin
		main_inst_finish_reg <= 1'd1;
	end
end
always @(posedge clk) begin
	if ((reset | main_inst_start)) begin
		main_inst_return_val_reg <= 0;
	end
	if (main_inst_finish) begin
		main_inst_return_val_reg <= main_inst_return_val;
	end
end
always @(*) begin
	main_0_1_inst_clk = clk;
end
always @(*) begin
	main_0_1_inst_reset = reset;
end
always @(*) begin
	main_0_1_inst_clken = ~(1'd0);
if (reset) begin main_0_1_inst_clken = 0; end
end
always @(*) begin
	main_0_1_inst_write_en = auto_pthread_wrapper_inst_main_0_1_valid_to_sink;
end
always @(*) begin
	main_0_1_inst_write_data = auto_pthread_wrapper_inst_main_0_1_data_to_sink;
end
always @(*) begin
	main_0_1_inst_read_en = main_inst_main_0_1_ready_to_source;
end
always @(*) begin
	auto_pthread_wrapper_inst_clk = clk;
end
always @(*) begin
	auto_pthread_wrapper_inst_reset = reset;
end
always @(*) begin
	auto_pthread_wrapper_inst_start = 1'd0;
	if ((main_inst_auto_pthread_wrapper_threadID == 16'd0)) begin
		auto_pthread_wrapper_inst_start = main_inst_auto_pthread_wrapper_start;
	end
end
always @(*) begin
	auto_pthread_wrapper_inst_main_0_1_ready_from_sink = ~(main_0_1_inst_full);
end
always @(posedge clk) begin
	if ((reset | auto_pthread_wrapper_inst_start)) begin
		auto_pthread_wrapper_inst_finish_reg <= 1'd0;
	end
	if (auto_pthread_wrapper_inst_finish) begin
		auto_pthread_wrapper_inst_finish_reg <= 1'd1;
	end
end
always @(posedge clk) begin
	finish <= main_inst_finish;
end
always @(posedge clk) begin
	return_val <= main_inst_return_val;
end

endmodule
