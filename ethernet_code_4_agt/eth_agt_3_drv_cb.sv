class driver_callback_cb3 extends uvm_callback;
  
  `uvm_object_utils(driver_callback_cb3)
  `NEW_OBJ
  
 // function new(string name = "driver_callback");
  //  super.new(name);
  //endfunction
  
  virtual task update_resp(ref eth_seq_item resp); 
  endtask
endclass
