class eth_virtual_sequencer extends uvm_sequencer;
  eth_agt_0_sqr sqr0;
  eth_agt_1_sqr sqr1;
  eth_agt_2_sqr sqr2;
  eth_agt_3_sqr sqr3;
  //eth_slave_sqr s_sqr;
  
  `uvm_component_utils(eth_virtual_sequencer)
  //`NEW_COMP
  function new(string name="", uvm_component parent=null); 
		super.new(name,parent); 
        //m_sqr = eth_master_sqr::type_id::create("m_sqr",this);
    	//s_sqr = eth_slave_sqr::type_id::create("s_sqr",this);

	endfunction

     

  
endclass
