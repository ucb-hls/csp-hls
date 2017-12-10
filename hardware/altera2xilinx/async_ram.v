`timescale 1 ns / 1 ps
module altsyncram (address_a, clken_a, data_a, wren_a, q_a, address_b, clken_b, data_b, wren_b, q_b, clk);

parameter DWIDTH = 64;
parameter AWIDTH = 4;
parameter MEM_SIZE = 16;

input[AWIDTH-1:0] address_a;
input clken_a;
input[DWIDTH-1:0] data_a;
input wren_a;
output reg[DWIDTH-1:0] q_a;

input[AWIDTH-1:0] address_b;
input clken_b;
input[DWIDTH-1:0] data_b;
input wren_b;
output reg[DWIDTH-1:0] q_b;

input clk;

(* ram_style = "block" *)reg [DWIDTH-1:0] ram[MEM_SIZE-1:0];

always @(posedge clk)
begin
    if (clken_a)
    begin
        if (wren_a)
        begin
            ram[address_a] <= data_a;
            q_a <= data_a;
        end
        else
            q_a <= ram[address_a];
    end
end


always @(posedge clk)
begin
    if (clken_b)
    begin
        if (wren_b)
        begin
            ram[address_b] <= data_b;
        end
        else
            q_b <= ram[address_b];
    end
end
endmodule

// Init 
/*altsyncram altsyncram_component (
    .address_a (address_a),
    .clken_a (clken),
    .data_a (data_a),
    .wren_a (wren_a),
    .q_a (q_a_wire),

    .address_b (address_b),
    .clken_b (clken),
    .data_b (data_b),
    .wren_b (wren_b),
    .q_b (q_b_wire),
    .clk (clk_wire)

);

defparam
altsyncram_component.DWIDTH=width_a,
altsyncram_component.AWIDTH=widthad_a,
altsyncram_component.MEM_SIZE=numwords_a;
*/
