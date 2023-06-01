class eth_master_agent extends uvm_agent;
	eth_master_sqr m_sqr;
  	eth_master_drv m_drv;
    eth_mon_m m_mon;
  eth_config cfg;

  `uvm_component_utils(eth_master_agent)
  `NEW_COMP
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
            cfg = eth_config::type_id::create("cfg");

    m_sqr = eth_master_sqr::type_id::create("m_sqr",this);
    m_drv = eth_master_drv::type_id::create("m_drv",this);
    m_mon = eth_mon_m::type_id::create("m_mon",this);
    //if(cfg.agt_num==0) m_mon = eth_mon_m::type_id::create("m_mon",this);
    `uvm_info("my_unique_id","eth_master_agent",UVM_NONE)
  endfunction : build_phase
  
  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    m_drv.seq_item_port.connect(m_sqr.seq_item_export);
  endfunction : connect_phase
endclass
