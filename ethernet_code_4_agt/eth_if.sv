interface eth_if(input bit clk, bit rst);
  logic [55:0] preamble;
  logic[7:0] sfd;
  logic[47:0] da;
  logic[47:0] sa;
  logic[15:0] len;
  logic[511:0] payload;
  logic[31:0] crc;
  
  clocking cb@(posedge clk);
  	input  preamble;
    input sfd;
  input da;
  input sa;
  input len;
  input payload;
  input crc;
  endclocking
  
  clocking mon_cb@(posedge clk);
  	input preamble;
    input sfd;
  input da;
  input sa;
  input len;
  input payload;
  input crc;
  endclocking
  
  modport mon_cd (clocking cb, clocking mon_cb);
endinterface