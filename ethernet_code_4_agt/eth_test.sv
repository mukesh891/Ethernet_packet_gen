class eth_test extends uvm_test;
	eth_env env;
  	uvm_table_printer printer;
    eth_config cfg;
  
  `uvm_component_utils(eth_test)
  `NEW_COMP
  
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("my_unique_id","eth_test",UVM_NONE)
    env = eth_env::type_id::create("env",this);
    cfg = eth_config::type_id::create("cfg");

    //uvm_config_db #(eth_config)::set(this,"*", "eth_config", env_cfg);
    
endfunction: build_phase

  
    function void end_of_elaboration_phase(uvm_phase phase);
	   super.end_of_elaboration_phase(phase);
       `uvm_info(get_type_name(),$psprintf("eth_base_test hierarchy is %s", this.sprint(printer)),UVM_LOW)
      
      
	endfunction

  
endclass

class eth_tx_test extends eth_test;
  `uvm_component_utils(eth_tx_test)
  `NEW_COMP
  
  task run_phase(uvm_phase phase);
    //`uvm_info(get_type_name(),$sformatf("env_config.active = %s",env_cfg.active),UVM_LOW)

  	eth_10_seq eth_tx;
    `uvm_info(get_type_name(),$sformatf("----------------------env_config.total_err_pkt_eij = %d-------------------",cfg.total_err_pkt_eij),UVM_LOW)
    
    eth_tx = eth_10_seq::type_id::create("eth_tx");
    
    phase.raise_objection(this);
    
    if(cfg.agt_num==0)begin
    	eth_tx.start(env.agent.m_agent.m_sqr);
    end
    else if(cfg.agt_num==1)begin
    	eth_tx.start(env.agent.s_agent.s_sqr);
    end
    if(cfg.agt_num==2)begin
    	eth_tx.start(env.agent.m_agent.m_sqr);
        eth_tx.start(env.agent.s_agent.s_sqr);
    end
    phase.drop_objection(this);
    
    
  endtask
  
endclass