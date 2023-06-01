class eth_slave_agent extends uvm_agent;
	eth_slave_sqr s_sqr;
    eth_slave_drv s_drv;
  	eth_mon_s s_mon;
  eth_config cfg;
  `uvm_component_utils(eth_slave_agent)
  `NEW_COMP
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("my_unique_id","eth_slave_agent",UVM_NONE)
        cfg = eth_config::type_id::create("cfg");

    s_sqr = eth_slave_sqr::type_id::create("s_sqr",this);
    s_drv = eth_slave_drv::type_id::create("s_drv",this);
    //s_mon = eth_mon_s::type_id::create("s_mon",this);

    if(cfg.agt_num==1) s_mon = eth_mon_s::type_id::create("s_mon",this);
  endfunction : build_phase
  
  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    s_drv.seq_item_port.connect(s_sqr.seq_item_export);
  endfunction : connect_phase
endclass