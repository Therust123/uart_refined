// Code your design here
module dataserialiser;
  input [7:0] data_in;
  input serialiser_en,clk,rst_n,busy,data_valid;
  output reg data_out;
  output serialiser_dn;
  reg [7:0] memory;
  reg [2:0] ptr;
  parameter datawidth=8;
  
  //lets go for the code will refine when needed
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      memory<=0;
      ptr<=3'b000;
      data_out<=1'b0;
    end
    else begin
      if(data_valid && !busy) begin
        memory<=data_in;
        ptr<=0;
      end
    end
    if(serialiser_en) begin
      data_out<=memory[ptr];
      ptr+=1;
    end
  end
  assign serialiser_dn=(ptr== datawidth);
endmodule
        
        
        
        
      
    
  
