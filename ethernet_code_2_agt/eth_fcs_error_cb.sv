class m_fcs_error_callback extends m_driver_callback;
  //eth_ex_seq_item ex_resp;
  eth_config cfg;
  `uvm_object_utils(m_fcs_error_callback)
  `NEW_OBJ
  //function new(string name = "fcs_error_callback");
  //  super.new(name);
  //endfunction
  
   task update_resp(ref eth_seq_item resp);
     cfg = eth_config::type_id::create("cfg");
     `uvm_info(get_full_name(),"FC_ERROR_CALLBACK: injecting errorin crc",UVM_LOW)
     //ex_resp.crc=32'h12345678
     //resp.ex = ex_resp.ex;
    //resp.crc = 32'h12345678;
    resp.crc = cfg.crc_err_val;
  endtask
endclass

class s_fcs_error_callback extends s_driver_callback;
  //eth_ex_seq_item ex_resp;
  eth_config cfg;
  `uvm_object_utils(s_fcs_error_callback)
  `NEW_OBJ
  //function new(string name = "fcs_error_callback");
  //  super.new(name);
  //endfunction
  
   task update_resp(ref eth_seq_item resp);
     cfg = eth_config::type_id::create("cfg");
     `uvm_info(get_full_name(),"FC_ERROR_CALLBACK: injecting errorin crc",UVM_LOW)
     //ex_resp.crc=32'h12345678
     //resp.ex = ex_resp.ex;
    //resp.crc = 32'h12345678;
    resp.crc = cfg.crc_err_val;
  endtask
endclass
