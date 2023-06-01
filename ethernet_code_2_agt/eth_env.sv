class eth_env extends uvm_env;
  
	eth_agent agent;
  	eth_sbd sbd;
  eth_config cfg;
  `uvm_component_utils(eth_env)
  `NEW_COMP
  
   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     agent = eth_agent::type_id::create("agent",this);
     sbd = eth_sbd::type_id::create("sbd",this);
     //v_sqr = eth_virtual_sequencer::type_id::create("v_sqr",this);
         cfg = eth_config::type_id::create("cfg");

          `uvm_info("my_unique_id","eth_environment",UVM_NONE)

   endfunction : build_phase
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    if(cfg.agt_num==0) agent.m_agent.m_mon.m_ap_port.connect(sbd.m_ap_imp);
    if(cfg.agt_num==1) agent.s_agent.s_mon.s_ap_port.connect(sbd.s_ap_imp);
    
          	  //v_sqr.m_sqr = agent.m_agent.m_sqr;
          	  //v_sqr.s_sqr = agent.s_agent.s_sqr;

  endfunction
  
  
  
endclass
