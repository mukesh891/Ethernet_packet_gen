class eth_seq_item extends uvm_sequence_item;
  
  //rand logic ex;
  rand logic [55:0] preamble;
  rand byte sfd;
  rand logic[47:0] da;
  rand logic[47:0] sa;
  rand logic[15:0] len;
  rand logic[511:0] payload;
  rand logic[31:0] crc;
  
  
  //`uvm_object_utils(eth_seq_item)
  
  
  
  constraint d_s{
  	da!=sa;
    preamble=={28{2'b10}};
    sfd==8'hb;
    //crc==32'hffffffff;
  }
  
  `uvm_object_utils_begin(eth_seq_item)
  `uvm_field_int(preamble,UVM_ALL_ON)
  `uvm_field_int(sfd,UVM_ALL_ON) 
  `uvm_field_int(da,UVM_ALL_ON) 
  `uvm_field_int(sa,UVM_ALL_ON)
  `uvm_field_int(len,UVM_ALL_ON)
  `uvm_field_int(payload,UVM_ALL_ON)
  `uvm_field_int(crc,UVM_ALL_ON)
  `uvm_object_utils_end
  
  `NEW_OBJ
  
endclass