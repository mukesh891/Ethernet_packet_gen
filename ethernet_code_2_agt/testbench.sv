// Code your testbench here
// or browse Examples
`timescale 1ns/1ps


`include "uvm_pkg.sv"

import uvm_pkg::*;

`include "uvm_macros.svh"
`include "eth_config.sv"

`include "eth_if.sv"
`include "eth_com.sv"
`include "eth_seq_item.sv"
`include "eth_mon_m.sv"
`include "eth_mon_s.sv"

//`include "drv_callback.sv"
//`include "eth_drv_cb.sv"
`include "eth_m_drv_cb.sv"
`include "eth_s_drv_cb.sv"
`include "eth_master_drv.sv"
`include "eth_slave_drv.sv"

`include "eth_fcs_error_cb.sv"
//`include "eth_tx_mon.sv"
//`include "eth_rx_mon.sv"
`include "eth_master_sqr.sv"
`include "eth_slave_sqr.sv"
//`include "eth_virtual_sequencer.sv"
`include "eth_slave_seq.sv"
`include "eth_master_seq.sv"
//`include "eth_seq.sv"
`include "eth_virtual_sequencer.sv"

`include "eth_virtual_seq.sv"

`include "eth_slave_agent.sv"
`include "eth_master_agent.sv"
`include "eth_agent.sv"
`include "eth_sbd.sv"

`include "eth_env.sv"
`include "eth_test.sv"
//`include "eth_fcs_err_test.sv"
`include "eth_fcs_err_test_v.sv"
//`include "eth_mon.sv"

//`include "eth_tx_mon.sv"
//`include"length_err_callback.sv"
//`include"length_err_test.sv"
module top;
  bit clk,rst;
  //instantiate interface
  eth_if vif(clk,rst);
  initial begin
    //uvm_resource_db#(virtual eth_if)::set("ETH","VIF",vif,null);
    uvm_config_db#(virtual eth_if)::set(null,"*","vif",vif);
  end
  
  initial begin
  	//clk gen
    clk=0;
    forever #5 clk=~clk;
  end  
  initial begin
  	//rst gen
    rst=1;
    #10 rst=0;
    

  end 
  initial begin
    #20; $display("TIME SCALE %t",$time);
  end
  
  initial begin
  	//run_test call
    //run_test("eth_10_tx_test");
    run_test("eth_fcs_err_test");
  end  
  
  initial begin
  	#2000;
    $finish;
    
  end
  initial begin
    $dumpfile("test.vcd");
    $dumpvars();
  end
endmodule
