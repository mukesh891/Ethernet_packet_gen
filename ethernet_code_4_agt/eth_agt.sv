class eth_agt extends uvm_agent;
	eth_agt_0 agt0;
	eth_agt_1 agt1;
	eth_agt_2 agt2;
	eth_agt_3 agt3;
	//eth_master_agent m_agent;
  	//eth_slave_agent s_agent;
  	eth_config cfg;
	eth_virtual_seq vseq;
  `uvm_component_utils(eth_agent)
  `NEW_COMP
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("my_unique_id","eth_agent",UVM_NONE)
        cfg = eth_config::type_id::create("cfg");

    //if(cfg.agt_num==0)
    agt0 = eth_agt_0 ::type_id::create("agt0",this);
    agt1 = eth_agt_1 ::type_id::create("agt1",this);
    agt2 = eth_agt_2 ::type_id::create("agt2",this);
    agt3 = eth_agt_3 ::type_id::create("agt3",this);
    
    //if(cfg.agt_num==1)
    //s_agent = eth_slave_agent::type_id::create("s_agent",this);
    vseq = eth_virtual_seq::type_id::create("vseq",this);
  endfunction : build_phase
  
 function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info(get_type_name(),"**********This is Ethernet Agent: Entering MAIN AGENT**********",UVM_LOW)
  	//vseq.m_sqr = m_agent.m_sqr;
  	//vseq.s_sqr = s_agent.s_sqr;
   
 endfunction : connect_phase
  
endclass
