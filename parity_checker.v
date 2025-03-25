// Code your design here
module parity_checker;
  input parity_en,clk,rst_n,data_valid,busy,parity_type;
  input [7:0] data_in;
  output reg par_bit;
  reg [7:0] memory;
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      par_bit<=0;
      memory<=0;
    end
    else if(data_valid &&!busy) begin
      memory<=data_in;
    end
  end
  //parity coder 
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      par_bit<=0;
    end
    else begin
      if(parity_en) begin
        case(parity_type)
          1'b0: begin
            par_bit<=^memory;
          end
          1'b1:par_bit<=~(^memory);
        endcase
      end
    end
  end
endmodule
      
            
          
  
