class eth_agt_3 extends uvm_agent;
	eth_agt_3_sqr sqr3;
  	eth_agt_3_drv drv3;
    eth_mon_m m_mon;
  eth_config cfg;

  `uvm_component_utils(eth_agt_3)
  `NEW_COMP
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
            cfg = eth_config::type_id::create("cfg");

    sqr3 = eth_agt_3_sqr::type_id::create("sqr3",this);
    drv3 = eth_agt_3_drv::type_id::create("drv3",this);
    //m_mon = eth_mon_m::type_id::create("m_mon",this);
    //if(cfg.agt_num==3) m_mon = eth_mon_m::type_id::create("m_mon",this);
    `uvm_info("my_unique_id","eth_master_agent",UVM_NONE)
  endfunction : build_phase
  
  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv3.seq_item_port.connect(sqr3.seq_item_export);
  endfunction : connect_phase
endclass

