class eth_virtual_seq extends uvm_sequence;
  //eth_master_sqr	m_sqr;	
  //eth_slave_sqr		s_sqr;	
eth_config cfg;
  eth_1_seq 	seq1;
  eth_2_seq 	seq2;
  eth_3_seq 	seq3;
  eth_4_seq 	seq4;
  bit disable_seq1;
  bit disable_seq2;
  bit disable_seq3;
  bit disable_seq4;
  //eth_master_seq 	m_seq;
  //eth_slave_seq 	s_seq;
  //eth_env env;
  
  `uvm_object_utils(eth_virtual_seq)
  function new(string name=""); 
		super.new(name); 
  cfg = new();
//cfg.arg_en_seq1=1;
//cfg.arg_en_seq2=1;
//cfg.arg_en_seq3=1;
//cfg.arg_en_seq4=1;
	endfunction
//`NEW_OBJ
  eth_virtual_sequencer my_virtual_sequencer;
  `uvm_declare_p_sequencer(eth_virtual_sequencer)

 
  task body();
   //env = eth_env::type_id::create("env",this);
    uvm_config_db#(bit)::get(null,"","cfg.arg_disable_seq1",disable_seq1);
    uvm_config_db#(bit)::get(null,"","cfg.arg_disable_seq2",disable_seq2);
    uvm_config_db#(bit)::get(null,"","cfg.arg_disable_seq3",disable_seq3);
    uvm_config_db#(bit)::get(null,"","cfg.arg_disable_seq4",disable_seq4);
	
    seq1 = eth_1_seq::type_id::create("seq1");
    seq2 = eth_2_seq::type_id::create("seq2");
    seq3 = eth_3_seq::type_id::create("seq3");
    seq4 = eth_4_seq::type_id::create("seq4");
    //m_seq = eth_master_seq::type_id::create("m_seq");
    //s_seq = eth_slave_seq::type_id::create("s_seq");
    //uvm_split_string(cfg.seq_name,",",seq_q);
    fork
	    if(!disable_seq1)
      		seq1.start(p_sequencer.m_sqr);
	    if(!disable_seq2)
      		seq2.start(p_sequencer.m_sqr);
	    if(!disable_seq3)
      		seq3.start(p_sequencer.m_sqr);
	    if(!disable_seq4)begin
         	`uvm_info(get_type_name(),$sformatf("virtual_seq: Inside Body:: cfg.arg_disable_seq4=%0b",cfg.arg_disable_seq4), UVM_LOW)
      		seq4.start(p_sequencer.m_sqr);
	end
		#100;
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
