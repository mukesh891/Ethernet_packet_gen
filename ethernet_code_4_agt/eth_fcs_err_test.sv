class eth_fcs_err_test extends eth_test;
  eth_virtual_seq v_seq;
  eth_virtual_sequencer v_sqr;
	
  eth_env e_env;
  fcs_error_callback fcs_err_cb;
  eth_master_drv m_drv;
  eth_slave_drv s_drv;
  `uvm_component_utils(eth_fcs_err_test)
  `NEW_COMP
  `uvm_register_cb(eth_master_drv,driver_callback)
  `uvm_register_cb(eth_slave_drv,driver_callback)
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(),"This is eth_fcs_err_test class: Entering error test",UVM_LOW)
    fcs_err_cb = fcs_error_callback::type_id::create("fcs_err_cb",this);
    v_sqr = eth_virtual_sequencer::type_id::create("v_sqr",this);
    e_env = eth_env::type_id::create("e_env",this);

    
  endfunction
  
   function void connect_phase(uvm_phase phase);
    v_sqr.m_sqr = e_env.agent.m_agent.m_sqr;
    v_sqr.s_sqr = e_env.agent.s_agent.s_sqr;
  endfunction
  //env.agent.m_agent.m_sqr
  task run_phase(uvm_phase phase);    
    v_seq = eth_virtual_seq::type_id::create("vseq");
    phase.raise_objection(this, "Starting phase sequence");
    //eth_test_seq.start(env.agent.m_agent.m_sqr);
    if(cfg.agt_num==0)begin
          uvm_callbacks#(eth_master_drv,driver_callback)::add(m_drv,fcs_err_cb);
      v_seq.start(v_sqr);
    end
    else if(cfg.agt_num==1)begin
          uvm_callbacks#(eth_slave_drv,driver_callback)::add(s_drv,fcs_err_cb);
      v_seq.start(v_sqr);
    end
    else if(cfg.agt_num==2)begin

      uvm_callbacks#(eth_master_drv,driver_callback)::add(m_drv,fcs_err_cb);
      uvm_callbacks#(eth_slave_drv,driver_callback)::add(s_drv,fcs_err_cb);
      v_seq.start(v_sqr);
    end
    #100;
    phase.drop_objection(this,  "Ending phase sequence");

    
  endtask
  
  
  
endclass
