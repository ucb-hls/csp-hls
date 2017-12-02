// A simple 2-to-1 arbiter
// TODO: Generalize/parameterize this!
// TODO: Possibly buffering input to improve performance

module arbiter (
  input clk,
  input reset,

  input [31:0] receive_data0,
  input receive_request0,
  output reg receive_valid0,

  input [31:0] receive_data1,
  input receive_request1,
  output reg receive_valid1,

  output reg [31:0] send_data0,
  output reg send_request0,
  input send_valid0
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
    send_data0 = 0;
    send_request0 = 1'b0;
    receive_valid0 = 1'b0;
    receive_valid1 = 1'b0;
    update_rr = 1'b0;
    if (send_valid0) begin
      if (receive_request0 && receive_request1) begin
        if (round_robin_counter == 0) begin
          send_data0 = receive_data0;
	  receive_valid1 = 1'b0;
        end
        else begin
          send_data0 = receive_data1;
	  receive_valid0 = 1'b0;
        end
        send_request0 = 1'b1;
	update_rr = 1'b1;
      end
      else if (receive_request0) begin
        send_data0 = receive_data0;
        send_request0 = 1'b1;
        receive_valid1 = 1'b0;
      end
      else if (receive_request1) begin
        send_data0 = receive_data1;
        send_request0 = 1'b1;
        receive_valid0 = 1'b0;
      end
    end
  end

endmodule
