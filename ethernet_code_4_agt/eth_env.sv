class eth_env extends uvm_env;
  
	//eth_agent agent;
	eth_agt agent;
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
    
    if(cfg.agt_num==0) agent.agt0.mon1.ap_port_0.connect(sbd.m_ap_imp);
    if(cfg.agt_num==1) agent.agt1.mon2.ap_port_1.connect(sbd.s_ap_imp);
    if(cfg.agt_num==2) agent.agt2.mon2.ap_port_2.connect(sbd.s_ap_imp);
    if(cfg.agt_num==3) agent.agt3.mon2.ap_port_3.connect(sbd.s_ap_imp);
    
          	  //v_sqr.m_sqr = agent.m_agent.m_sqr;
          	  //v_sqr.s_sqr = agent.s_agent.s_sqr;

  endfunction
  
  
  
endclass
