class eth_mon_s extends uvm_monitor;
  `uvm_component_utils(eth_mon_s)
  `NEW_COMP
  eth_seq_item tx;
  virtual eth_if vif;
  eth_config cfg;
  //uvm_analysis_port#(eth_seq_item) m_ap_port;
  uvm_analysis_port#(eth_seq_item) s_ap_port;
   
  function void build_phase(uvm_phase phase);
     super.build_phase(phase);
    `uvm_info(get_type_name(),"eth_monitor",UVM_NONE)
    tx = eth_seq_item::type_id::create("tx",this);
    //m_ap_port = new("m_ap_port",this);
    s_ap_port = new("s_ap_port",this);
        cfg = eth_config::type_id::create("cfg");

    
    if(! uvm_config_db #(virtual eth_if)::get(this,"","vif",vif))begin
      `uvm_error(get_type_name(),"DUT_INTERFACE_NOT_FOUND")
    end
   endfunction : build_phase
  
  virtual task run_phase(uvm_phase phase);
    repeat(cfg.s_no_req)begin
      `uvm_info(get_type_name(),$sformatf("ETH_MONITOR_RUN_PHASE AT %t TIME************",$time),UVM_NONE)
      wait(vif.rst==0);
      @(posedge vif.clk)
    tx.preamble=vif.preamble;
  	tx.sfd=vif.sfd;
  	tx.da=vif.da;
  	tx.sa=vif.sa;
 	tx.len=vif.len;
  	tx.payload=vif.payload;
  	tx.crc=vif.crc;
    #1;
      //tx.print();
      s_ap_port.write(tx);

      end
  endtask
  
  
endclass
