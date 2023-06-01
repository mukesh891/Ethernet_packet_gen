class eth_agent extends uvm_agent;
	eth_master_agent m_agent;
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
    m_agent = eth_master_agent::type_id::create("m_agent",this);
    
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
