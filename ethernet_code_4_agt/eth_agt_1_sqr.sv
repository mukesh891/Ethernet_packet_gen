class eth_agt_1_sqr extends uvm_sequencer#(eth_seq_item);
  `uvm_component_utils(eth_agt_1_sqr)
  //`NEW_COMP
  function new(string name="", uvm_component parent=null); 
    
		super.new(name,parent); 
  
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
endclass
