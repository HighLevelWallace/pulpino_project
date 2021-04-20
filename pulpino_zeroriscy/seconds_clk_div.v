module seconds_clk_div(
    input clk_in,
    output reg clk_out
);

reg [31:0] counter;

initial begin
    counter = 0;
    clk_out = 0;
end

// always @(posedge clk_in) begin
//     counter <= counter > 38 ? 0 : counter + 1;
    
//     if (!counter) begin
//         clk_out <= ~clk_out;
//     end
// end

always @(posedge clk_in) begin
    clk_out <= ~clk_out;
end

endmodule
