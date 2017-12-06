// A simple 1-to-2 arbiter
// TODO: Generalize/parameterize this!
// TODO: Possibly buffering input to improve performance

module Fork (
  input clk,
  input reset,

  input [31:0] channel_read_data,
  output reg channel_read_request,
  input channel_read_valid,

  output reg [31:0] p0_read_data,
  input p0_read_request,
  output reg p0_read_valid,

  output reg [31:0] p1_read_data,
  input p1_read_request,
  output reg p1_read_valid
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
    channel_read_request = 0;
    p0_read_data = 0;
    p1_read_data = 0;
    p0_read_valid = 1'b0;
    p1_read_valid = 1'b0;
    update_rr = 1'b0;

    if (channel_read_valid) begin
      if (round_robin_counter == 0) begin
        p0_read_valid = 1'b1;
        if (p0_read_request) begin
	  p0_read_data = channel_read_data;
	  channel_read_request = 1'b1;
	end
      end
      else if (round_robin_counter == 1) begin
        p1_read_valid = 1'b1;
        if (p1_read_request) begin
	  p1_read_data = channel_read_data;
	  channel_read_request = 1'b1;
	end
      end
      update_rr = 1'b1;
    end
  end

endmodule
