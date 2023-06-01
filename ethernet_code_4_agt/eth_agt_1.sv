class eth_agt_1 extends uvm_agent;
	eth_agt_1_sqr sqr1;
    eth_agt_1_drv drv1;
  	eth_mon_s s_mon;
  eth_config cfg;
  `uvm_component_utils(eth_agt_1)
  `NEW_COMP
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("my_unique_id","eth_slave_agent",UVM_NONE)
        cfg = eth_config::type_id::create("cfg");

    sqr1 = eth_agt_1_sqr::type_id::create("sqr1",this);
    drv1 = eth_agt_1_drv::type_id::create("drv1",this);
    //s_mon = eth_mon_s::type_id::create("s_mon",this);

    //if(cfg.agt_num==1) s_mon = eth_mon_s::type_id::create("s_mon",this);
  endfunction : build_phase
  
  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv1.seq_item_port.connect(sqr1.seq_item_export);
  endfunction : connect_phase
endclass
