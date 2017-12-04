// A simple 2-to-1 arbiter
// TODO: Generalize/parameterize this!
// TODO: Possibly buffering input to improve performance

module Join (
  input clk,
  input reset,

  input [31:0] p0_write_data,
  input p0_write_request,
  output reg p0_write_valid,

  input [31:0] p1_write_data,
  input p1_write_request,
  output reg p1_write_valid,

  output reg [31:0] channel_write_data,
  output reg channel_write_request,
  input channel_write_valid
);

  reg update_rr;
  reg [0:0] round_robin_counter;
  always @(posedge clk) begin
    if (reset)
      round_robin_counter <= 0;
    else begin
      if (update_rr)
        round_robin_counter <= round_robin_counter + 1;
    end
  end

  always @(*) begin
    channel_write_data = 0;
    channel_write_request = 1'b0;
    p0_write_valid = 1'b0;
    p1_write_valid = 1'b0;
    update_rr = 1'b0;
    if (channel_write_valid) begin
      if (round_robin_counter == 0) begin
        p0_write_valid = 1'b1;
	if (p0_write_request) begin
	  channel_write_data = p0_write_data;
	  channel_write_request = 1'b1;
	end
      end
      else if (round_robin_counter == 1) begin
        p1_write_valid = 1'b1;
	if (p1_write_request) begin
	  channel_write_data = p1_write_data;
	  channel_write_request = 1'b1;
	end
      end
      update_rr = 1'b1;
    end
  end

endmodule
