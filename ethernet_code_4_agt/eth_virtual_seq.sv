class eth_virtual_seq extends uvm_sequence;
  //eth_master_sqr	m_sqr;	
  //eth_slave_sqr		s_sqr;	
  
  eth_agt_0_seq 	seq0;
  eth_agt_1_seq 	seq1;
  eth_agt_2_seq 	seq2;
  eth_agt_3_seq 	seq3;
  //eth_master_seq 	m_seq;
  //eth_slave_seq 	s_seq;
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

    seq0 = eth_agt_0_seq::type_id::create("seq0");
    seq1 = eth_agt_1_seq::type_id::create("seq1");
    seq2 = eth_agt_2_seq::type_id::create("seq2");
    seq3 = eth_agt_3_seq::type_id::create("seq3");
    //s_seq = eth_slave_seq::type_id::create("s_seq");
    //Place both sequences in fork join
    fork
    //start a virtual master seq
      seq0.start(p_sequencer.sqr0);
      seq1.start(p_sequencer.sqr1);
      seq2.start(p_sequencer.sqr2);
      seq3.start(p_sequencer.sqr3);
   
    //start a virtual slave seq
      //s_seq.start(p_sequencer.s_sqr);
         `uvm_info(get_type_name(), "virtual_seq: Inside Body", UVM_LOW);

    join
   endtask
  
endclass
