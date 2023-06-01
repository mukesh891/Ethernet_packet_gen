class eth_virtual_seq extends uvm_sequence;
  //eth_master_sqr	m_sqr;	
  //eth_slave_sqr		s_sqr;	
  
  eth_master_seq 	m_seq;
  eth_slave_seq 	s_seq;
  //eth_env env;
  
  `uvm_object_utils(eth_virtual_seq)
  function new(string name=""); 
		super.new(name); 
	endfunction
//`NEW_OBJ
  eth_virtual_sequencer my_virtual_sequencer;
  `uvm_declare_p_sequencer(eth_virtual_sequencer)
  
 
  task body();
   //env = eth_env::type_id::create("env",this);

    m_seq = eth_master_seq::type_id::create("m_seq");
    s_seq = eth_slave_seq::type_id::create("s_seq");
    //Place both sequences in fork join
    fork
    //start a virtual master seq
      m_seq.start(p_sequencer.m_sqr);
   
    //start a virtual slave seq
      s_seq.start(p_sequencer.s_sqr);
         `uvm_info(get_type_name(), "virtual_seq: Inside Body", UVM_LOW);

    join
   endtask
  
endclass
