class eth_virtual_seq extends uvm_sequence;
  //eth_master_sqr	m_sqr;	
  //eth_slave_sqr		s_sqr;	
  string sel_seq;
  string seq_q[$];
eth_config cfg;
  eth_1_seq 	seq1;
  eth_2_seq 	seq2;
  eth_3_seq 	seq3;
  eth_4_seq 	seq4;
  //eth_master_seq 	m_seq;
  //eth_slave_seq 	s_seq;
  //eth_env env;
  
  `uvm_object_utils(eth_virtual_seq)
  function new(string name=""); 
		super.new(name); 
  cfg = new();
	endfunction
//`NEW_OBJ
  eth_virtual_sequencer my_virtual_sequencer;
  `uvm_declare_p_sequencer(eth_virtual_sequencer)

 
  task body();
   //env = eth_env::type_id::create("env",this);
	
    seq1 = eth_1_seq::type_id::create("seq1");
    seq2 = eth_2_seq::type_id::create("seq2");
    seq3 = eth_3_seq::type_id::create("seq3");
    seq4 = eth_4_seq::type_id::create("seq4");
    //m_seq = eth_master_seq::type_id::create("m_seq");
    //s_seq = eth_slave_seq::type_id::create("s_seq");
    uvm_split_string(cfg.seq_name,",",seq_q);
    fork
    for(int i=0;i<=seq_q.size();i++)begin
    	
	sel_seq = seq_q.pop_front();
	if(sel_seq=="seq1")
      		seq1.start(p_sequencer.m_sqr);
	else if(sel_seq=="seq2")
      		seq2.start(p_sequencer.m_sqr);
	else if(sel_seq=="seq3")
      		seq3.start(p_sequencer.m_sqr);
	else if(sel_seq=="seq4")
      		seq4.start(p_sequencer.m_sqr);
	#100;
    end
    join

    //Place both sequences in fork join
    /*fork
    //start a virtual master seq
      m_seq.start(p_sequencer.m_sqr);
   
    //start a virtual slave seq
      //s_seq.start(p_sequencer.s_sqr);
         `uvm_info(get_type_name(), "virtual_seq: Inside Body", UVM_LOW);

    join*/
   endtask
  
endclass
