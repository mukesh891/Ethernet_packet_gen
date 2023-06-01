class eth_agt_2 extends uvm_agent;
	eth_agt_2_sqr sqr2;
  	eth_agt_2_drv drv2;
    eth_mon_m m_mon;
  eth_config cfg;

  `uvm_component_utils(eth_agt_2)
  `NEW_COMP
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
            cfg = eth_config::type_id::create("cfg");

    sqr2 = eth_agt_2_sqr::type_id::create("sqr2",this);
    drv2 = eth_agt_2_drv::type_id::create("drv2",this);
    //m_mon = eth_mon_m::type_id::create("m_mon",this);
    //if(cfg.agt_num==2) m_mon = eth_mon_m::type_id::create("m_mon",this);
    `uvm_info("my_unique_id","eth_master_agent",UVM_NONE)
  endfunction : build_phase
  
  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv2.seq_item_port.connect(sqr2.seq_item_export);
  endfunction : connect_phase
endclass

