module xillydemo
  (
  input  clk_100,
  input  otg_oc,   
  inout [55:0] PS_GPIO,
  output [3:0] GPIO_LED,
  output [3:0] vga4_blue,
  output [3:0] vga4_green,
  output [3:0] vga4_red,
  output  vga_hsync,
  output  vga_vsync,

  output  audio_mclk,
  output  audio_dac,
  input   audio_adc,
  input   audio_bclk,
  input   audio_lrclk,

  output smb_sclk,
  inout  smb_sdata,
  output [1:0] smbus_addr

  ); 

   // Clock and quiesce
   wire    bus_clk;
   wire    quiesce;

   
   reg [7:0] litearray0[0:31];
   reg [7:0] litearray1[0:31];
   reg [7:0] litearray2[0:31];
   reg [7:0] litearray3[0:31];


   // Wires related to /dev/xillybus_read0_32
   wire       user_r_read0_32_rden;
   wire       user_r_read0_32_empty;
   wire [31:0] user_r_read0_32_data;
   wire        user_r_read0_32_eof;
   wire        user_r_read0_32_open;

   // Wires related to /dev/xillybus_read1_32
   wire       user_r_read1_32_rden;
   wire       user_r_read1_32_empty;
   wire [31:0] user_r_read1_32_data;
   wire        user_r_read1_32_eof;
   wire        user_r_read1_32_open;

   // Wires related to /dev/xillybus_read2_32
   wire       user_r_read2_32_rden;
   wire       user_r_read2_32_empty;
   wire [31:0] user_r_read2_32_data;
   wire        user_r_read2_32_eof;
   wire        user_r_read2_32_open;

   // Wires related to /dev/xillybus_read3_32
   wire       user_r_read3_32_rden;
   wire       user_r_read3_32_empty;
   wire [31:0] user_r_read3_32_data;
   wire        user_r_read3_32_eof;
   wire        user_r_read3_32_open;

   // Wires related to /dev/xillybus_write0_32
   wire        user_w_write0_32_wren;
   wire        user_w_write0_32_full;
   wire [31:0] user_w_write0_32_data;
   wire        user_w_write0_32_open;

   // Wires related to /dev/xillybus_write1_32
   wire        user_w_write1_32_wren;
   wire        user_w_write1_32_full;
   wire [31:0] user_w_write1_32_data;
   wire        user_w_write1_32_open;

   // Wires related to /dev/xillybus_write2_32
   wire        user_w_write2_32_wren;
   wire        user_w_write2_32_full;
   wire [31:0] user_w_write2_32_data;
   wire        user_w_write2_32_open;

   // Wires related to /dev/xillybus_write3_32
   wire        user_w_write3_32_wren;
   wire        user_w_write3_32_full;
   wire [31:0] user_w_write3_32_data;
   wire        user_w_write3_32_open;

   // Wires related to Xillybus Lite
   wire        user_clk;
   wire        user_wren;
   wire [3:0]  user_wstrb;
   wire        user_rden;
   reg [31:0]  user_rd_data;
   wire [31:0] user_wr_data;
   wire [31:0] user_addr;
   wire        user_irq;

   // Note that none of the ARM processor's direct connections to pads is
   // attached in the instantion below. Normally, they should be connected as
   // toplevel ports here, but that confuses Vivado 2013.4 to think that
   // some of these ports are real I/Os, causing an implementation failure.
   // This detachment results in a lot of warnings during synthesis and
   // implementation, but has no practical significance, as these pads are
   // completely unrelated to the FPGA bitstream.

   xillybus xillybus_ins (

    // Ports related to /dev/xillybus_read0_32
    // FPGA to CPU signals:
    .user_r_read0_32_rden(user_r_read0_32_rden),
    .user_r_read0_32_empty(user_r_read0_32_empty),
    .user_r_read0_32_data(user_r_read0_32_data),
    .user_r_read0_32_eof(user_r_read0_32_eof),
    .user_r_read0_32_open(user_r_read0_32_open),


    // Ports related to /dev/xillybus_read1_32
    // FPGA to CPU signals:
    .user_r_read1_32_rden(user_r_read1_32_rden),
    .user_r_read1_32_empty(user_r_read1_32_empty),
    .user_r_read1_32_data(user_r_read1_32_data),
    .user_r_read1_32_eof(user_r_read1_32_eof),
    .user_r_read1_32_open(user_r_read1_32_open),

    // Ports related to /dev/xillybus_read2_32
    // FPGA to CPU signals:
    .user_r_read2_32_rden(user_r_read2_32_rden),
    .user_r_read2_32_empty(user_r_read2_32_empty),
    .user_r_read2_32_data(user_r_read2_32_data),
    .user_r_read2_32_eof(user_r_read2_32_eof),
    .user_r_read2_32_open(user_r_read2_32_open),

    // Ports related to /dev/xillybus_read3_32
    // FPGA to CPU signals:
    .user_r_read3_32_rden(user_r_read3_32_rden),
    .user_r_read3_32_empty(user_r_read3_32_empty),
    .user_r_read3_32_data(user_r_read3_32_data),
    .user_r_read3_32_eof(user_r_read3_32_eof),
    .user_r_read3_32_open(user_r_read3_32_open),

    // Ports related to /dev/xillybus_write0_32
    // CPU to FPGA signals:
    .user_w_write0_32_wren(user_w_write0_32_wren),
    .user_w_write0_32_full(user_w_write0_32_full),
    .user_w_write0_32_data(user_w_write0_32_data),
    .user_w_write0_32_open(user_w_write0_32_open),

    // Ports related to /dev/xillybus_write1_32
    // CPU to FPGA signals:
    .user_w_write1_32_wren(user_w_write1_32_wren),
    .user_w_write1_32_full(user_w_write1_32_full),
    .user_w_write1_32_data(user_w_write1_32_data),
    .user_w_write1_32_open(user_w_write1_32_open),

    // Ports related to /dev/xillybus_write2_32
    // CPU to FPGA signals:
    .user_w_write2_32_wren(user_w_write2_32_wren),
    .user_w_write2_32_full(user_w_write2_32_full),
    .user_w_write2_32_data(user_w_write2_32_data),
    .user_w_write2_32_open(user_w_write2_32_open),

    // Ports related to /dev/xillybus_write3_32
    // CPU to FPGA signals:
    .user_w_write3_32_wren(user_w_write3_32_wren),
    .user_w_write3_32_full(user_w_write3_32_full),
    .user_w_write3_32_data(user_w_write3_32_data),
    .user_w_write3_32_open(user_w_write3_32_open),

    // Xillybus Lite signals:
    .user_clk ( user_clk ),
    .user_wren ( user_wren ),
    .user_wstrb ( user_wstrb ),
    .user_rden ( user_rden ),
    .user_rd_data ( user_rd_data ),
    .user_wr_data ( user_wr_data ),
    .user_addr ( user_addr ),
    .user_irq ( user_irq ),
			  			  
    // General signals
    .clk_100(clk_100),
    .otg_oc(otg_oc),
    .PS_GPIO(PS_GPIO),
    .GPIO_LED(GPIO_LED),
    .bus_clk(bus_clk),
    .quiesce(quiesce),

    // VGA port related outputs
			    
    .vga4_blue(vga4_blue),
    .vga4_green(vga4_green),
    .vga4_red(vga4_red),
    .vga_hsync(vga_hsync),
    .vga_vsync(vga_vsync)
  );

   assign      user_irq = 0; // No interrupts for now
   
   always @(posedge user_clk)
     begin
	if (user_wstrb[0])
	  litearray0[user_addr[6:2]] <= user_wr_data[7:0];

	if (user_wstrb[1])
	  litearray1[user_addr[6:2]] <= user_wr_data[15:8];

	if (user_wstrb[2])
	  litearray2[user_addr[6:2]] <= user_wr_data[23:16];

	if (user_wstrb[3])
	  litearray3[user_addr[6:2]] <= user_wr_data[31:24];
	
	if (user_rden)
	  user_rd_data <= { litearray3[user_addr[6:2]],
			    litearray2[user_addr[6:2]],
			    litearray1[user_addr[6:2]],
			    litearray0[user_addr[6:2]] };
     end

   wire reset = !user_w_write0_32_open && !user_w_write1_32_open && !user_r_read0_32_open;
   wire [31:0] in_V_dout_1;
   wire in_V_empty_n_1;
   wire in_V_read_1;
   wire [31:0] out_V_din_1;
   wire out_V_full_n_1;
   wire out_V_write_1;

   wire [31:0] in_V_dout_2;
   wire in_V_empty_n_2;
   wire in_V_read_2;
   wire [31:0] out_V_din_2;
   wire out_V_full_n_2;
   wire out_V_write_2;

   wire [31:0] in_V_dout_3;
   wire in_V_empty_n_3;
   wire in_V_read_3;
   wire [31:0] out_V_din_3;
   wire out_V_full_n_3;
   wire out_V_write_3;

   wire fifo1_empty_n, fifo1_full_n;
   wire fifo2_empty_n, fifo2_full_n;
   wire fifo3_empty_n, fifo3_full_n;
   wire [31:0] fifo3_dout;
   wire fifo4_empty_n, fifo4_full_n;

   wire [31:0] receive_data0;
   wire receive_request0;
   wire receive_valid0;

   wire [31:0] receive_data1;
   wire receive_request1;
   wire receive_valid1;

   wire [31:0] send_data0;
   wire send_request0;
   wire send_valid0;

   assign in_V_empty_n_1 = fifo1_empty_n;
   assign out_V_full_n_1 = ~receive_valid0;
   process1 p1(
     .ap_clk(bus_clk),
     .ap_rst(reset),
     .in_V_dout(in_V_dout_1),
     .in_V_empty_n(in_V_empty_n_1),
     .in_V_read(in_V_read_1),
     .out_V_din(out_V_din_1),
     .out_V_full_n(out_V_full_n_1),
     .out_V_write(out_V_write_1)
   );

   assign in_V_empty_n_2 = fifo4_empty_n;
   assign out_V_full_n_2 = ~receive_valid1;
   process2 p2(
     .ap_clk(bus_clk),
     .ap_rst(reset),
     .in_V_dout(in_V_dout_2),
     .in_V_empty_n(in_V_empty_n_2),
     .in_V_read(in_V_read_2),
     .out_V_din(out_V_din_2),
     .out_V_full_n(out_V_full_n_2),
     .out_V_write(out_V_write_2)
   );

   assign in_V_empty_n_3 = fifo2_empty_n;
   assign out_V_full_n_3 = fifo3_full_n;
   process3 p3(
     .ap_clk(bus_clk),
     .ap_rst(reset),
     .in_V_dout(in_V_dout_3),
     .in_V_empty_n(in_V_empty_n_3),
     .in_V_read(in_V_read_3),
     .out_V_din(out_V_din_3),
     .out_V_full_n(out_V_full_n_3),
     .out_V_write(out_V_write_3)
   );

   assign user_w_write0_32_full = ~fifo1_full_n;
   // ARM to Process1
   FIFO_Xilinx fifo1(
     .clk(bus_clk),
     .reset(reset),
     .if_full_n(fifo1_full_n),
     .if_write_ce(1'b1),
     .if_write(user_w_write0_32_wren),
     .if_din(user_w_write0_32_data),

     .if_empty_n(fifo1_empty_n),
     .if_read_ce(1'b1),
     .if_read(in_V_read_1),
     .if_dout(in_V_dout_1)
   );

   assign user_w_write1_32_full = ~fifo4_full_n;
   // ARM to Process2
   FIFO_Xilinx fifo4(
     .clk(bus_clk),
     .reset(reset),
     .if_full_n(fifo4_full_n),
     .if_write_ce(1'b1),
     .if_write(user_w_write1_32_wren),
     .if_din(user_w_write1_32_data),

     .if_empty_n(fifo4_empty_n),
     .if_read_ce(1'b1),
     .if_read(in_V_read_2),
     .if_dout(in_V_dout_2)
   );

   assign receive_data0 = out_V_din_1;
   assign receive_request0 = out_V_write_1;
   assign receive_data1 = out_V_din_2;
   assign receive_request1 = out_V_write_2;
   assign send_valid0 = fifo2_full_n;
   // Process1 & Process2 to Arbiter
   arbiter arb(
     .clk(bus_clk),
     .reset(reset),

     .receive_data0(receive_data0),
     .receive_request0(receive_request0),
     .receive_valid0(receive_valid0),

     .receive_data1(receive_data1),
     .receive_request1(receive_request1),
     .receive_valid1(receive_valid1),

     .send_data0(send_data0),
     .send_request0(send_request0),
     .send_valid0(send_valid0)
   );

   // Arbiter to Process3
   FIFO_Xilinx fifo2(
     .clk(bus_clk),
     .reset(reset),
     .if_full_n(fifo2_full_n),
     .if_write_ce(1'b1),
     .if_write(send_request0),
     .if_din(send_data0),

     .if_empty_n(fifo2_empty_n),
     .if_read_ce(1'b1),
     .if_read(in_V_read_3),
     .if_dout(in_V_dout_3)
   );

   reg [31:0] fifo3_dout_reg;
   always @(posedge bus_clk) begin
     fifo3_dout_reg <= fifo3_dout;
   end
   assign user_r_read0_32_data = fifo3_dout_reg;
   assign user_r_read0_32_empty = ~fifo3_empty_n;
   // Process3 to ARM
   FIFO_Xilinx fifo3(
     .clk(bus_clk),
     .reset(reset),
     .if_full_n(fifo3_full_n),
     .if_write_ce(1'b1),
     .if_write(out_V_write_3),
     .if_din(out_V_din_3),

     .if_empty_n(fifo3_empty_n),
     .if_read_ce(1'b1),
     .if_read(user_r_read0_32_rden),
     .if_dout(fifo3_dout)
   );

   assign  user_r_read0_32_eof = 0;
   
endmodule
