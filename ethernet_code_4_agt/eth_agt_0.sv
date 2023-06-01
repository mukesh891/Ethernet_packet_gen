class eth_agt_0 extends uvm_agent;
	eth_agt_0_sqr sqr0;
  	eth_agt_0_drv drv0;
    eth_mon_m m_mon;
  eth_config cfg;

  `uvm_component_utils(eth_agt_0)
  `NEW_COMP
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
            cfg = eth_config::type_id::create("cfg");

    sqr0 = eth_agt_0_sqr::type_id::create("sqr0",this);
    drv0 = eth_agt_0_drv::type_id::create("drv0",this);
    //m_mon = eth_mon_m::type_id::create("m_mon",this);
    //if(cfg.agt_num==0) m_mon = eth_mon_m::type_id::create("m_mon",this);
    `uvm_info("my_unique_id","eth_master_agent",UVM_NONE)
  endfunction : build_phase
  
  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv0.seq_item_port.connect(sqr0.seq_item_export);
  endfunction : connect_phase
endclass
