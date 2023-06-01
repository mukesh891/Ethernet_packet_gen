class eth_fcs_err_test extends eth_test;
  ///
uvm_sequence_library my_seq_lib;
uvm_sequence_base my_sequence;
  ///
  eth_virtual_seq v_seq;
  eth_env env_e;
  eth_config cfg;
  //fcs_error_callback fcs_err_cb;
  m_fcs_error_callback m_fcs_err_cb;
  s_fcs_error_callback s_fcs_err_cb;
  eth_master_drv m_drv;
  //eth_slave_drv s_drv;
  eth_virtual_sequencer v_sqr;
  `uvm_component_utils(eth_fcs_err_test)
  `NEW_COMP
  `uvm_register_cb(eth_master_drv,m_driver_callback)
  //`uvm_register_cb(eth_slave_drv,s_driver_callback)
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(),"This is eth_fcs_err_test class: Entering error test",UVM_LOW)
    m_fcs_err_cb = m_fcs_error_callback::type_id::create("m_fcs_err_cb",this);
    //s_fcs_err_cb = s_fcs_error_callback::type_id::create("s_fcs_err_cb",this);
    env_e = eth_env::type_id::create("env_e",this);
    v_sqr = eth_virtual_sequencer::type_id::create("v_sqr",this);
    v_seq = eth_virtual_seq::type_id::create("v_seq");
    cfg = eth_config::type_id::create("cfg");
    
    uvm_config_db#(bit)::set(null,"*","cfg.arg_disable_seq1",cfg.arg_disable_seq1);
    uvm_config_db#(bit)::set(null,"*","cfg.arg_disable_seq2",cfg.arg_disable_seq2);
    uvm_config_db#(bit)::set(null,"*","cfg.arg_disable_seq3",cfg.arg_disable_seq3);
    uvm_config_db#(bit)::set(null,"*","cfg.arg_disable_seq4",cfg.arg_disable_seq4);

    
  endfunction

  function void connect_phase(uvm_phase phase);
    v_sqr.m_sqr = env_e.agent.m_agent.m_sqr;
    //v_sqr.s_sqr = env_e.agent.s_agent.s_sqr;
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this, "Starting phase sequence");
    if(cfg.agt_num==0)begin
          uvm_callbacks#(eth_master_drv,m_driver_callback)::add(m_drv,m_fcs_err_cb);
      v_seq.start(v_sqr);
    end

        /*
    if(cfg.agt_num==0)begin
          uvm_callbacks#(eth_master_drv,m_driver_callback)::add(m_drv,m_fcs_err_cb);
      v_seq.start(v_sqr);
    end
    else if(cfg.agt_num==1)begin
          uvm_callbacks#(eth_slave_drv,s_driver_callback)::add(s_drv,s_fcs_err_cb);
      v_seq.start(v_sqr);
    end
    else if(cfg.agt_num==2)begin
      if(cfg.m_total_err_pkt_eij>0)
      	uvm_callbacks#(eth_master_drv,m_driver_callback)::add(m_drv,m_fcs_err_cb);
      if(cfg.s_total_err_pkt_eij>0)
      	uvm_callbacks#(eth_slave_drv,s_driver_callback)::add(s_drv,s_fcs_err_cb);
      v_seq.start(v_sqr);
    end*/
    #100;

    phase.drop_objection(this,  "Ending phase sequence");

    
  endtask
  /*task disable_seq();
	    v_seq.seq4.set_enabled(0);
    endtask
  */
  
endclass
