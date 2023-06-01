class m_driver_callback extends uvm_callback;
  
  `uvm_object_utils(m_driver_callback)
  `NEW_OBJ
  
 // function new(string name = "driver_callback");
  //  super.new(name);
  //endfunction
  
  virtual task update_resp(ref eth_seq_item resp); 
  endtask
endclass
