class eth_agt_1_seq extends uvm_sequence#(eth_seq_item);
  
  `uvm_object_utils(eth_agt_1_seq)
  eth_seq_item req;
  eth_config cfg;

 int i=0;
 int no_req;
 
 // `NEW_OBJ
  function new(string name=""); 
		super.new(name); 
	endfunction
task pre_body();
  if(starting_phase != null)begin
      starting_phase.raise_objection(this);
    starting_phase.phase_done.set_drain_time(this,100);
    end
  endtask
  
  task post_body();
    if (starting_phase != null)
      starting_phase.drop_objection(this); 

  endtask
  
   virtual task body();
     cfg = eth_config::type_id::create("cfg");
     req = eth_seq_item::type_id::create("req",,get_full_name());
    //manual method
    /*start_item(req);
    req.randomize();
     $display("length = %d",req.len);
    finish_item(req);
    */
    //req.sfd.rand_mode(0);
    //if(req.sfd==8'hb)begin
     
     repeat(cfg.agt_1_no_req)begin
    `uvm_do(req)
       `uvm_info(">>>>>>>>>>>>>>>>>>>>MASTER_SEQ_TX_GOING ON","eth_master_seq",UVM_NONE)
      end
      
     /*if(cfg.agt_num==0)begin
       req = eth_seq_item::type_id::create("req");
       repeat(cfg.m_no_req)begin
    		`uvm_do(req)
      		`uvm_info("req proceeded","eth_seq",UVM_NONE)
      	end
     end
     else if(cfg.agt_num==1)begin
       req = eth_seq_item::type_id::create("req");
       repeat(cfg.s_no_req)begin
    		`uvm_do(req)
      		`uvm_info("req proceeded","eth_seq",UVM_NONE)
      	end
     end
     else if(cfg.agt_num==2)begin
         req = eth_seq_item::type_id::create("req");
         repeat(cfg.m_no_req)begin
    		`uvm_do(req)
      		`uvm_info("req proceeded","eth_seq",UVM_NONE)
      	 end
    	 req = eth_seq_item::type_id::create("req");
         repeat(cfg.s_no_req)begin
    		`uvm_do(req)
      		`uvm_info("req proceeded","eth_seq",UVM_NONE)
      	end
       end*/
    //end
  endtask : body

endclass

class eth_5_seq extends eth_master_seq;
  `uvm_object_utils(eth_10_seq)

  eth_config cfg;
  eth_seq_item req;
  function new(string name=""); 
		super.new(name); 
        cfg = eth_config::type_id::create("cfg");
	endfunction
  
  
  task body();
    `uvm_info(get_type_name(),$sformatf("------------------------------no_req=%0d--------------------------------",no_req),UVM_NONE)

    req = eth_seq_item::type_id::create("req");
    /*//manual method
    start_item(req);
    req.randomize();
	$display("length = %d",len);
    finish_item(req);
    */
    //req.sfd.rand_mode(0);
    //if(req.sfd==8'hb)begin
   // repeat(no_req)begin
    
    repeat(cfg.no_req)begin
    
      `uvm_do(req)
      `uvm_info("req proceeded","eth_seq",UVM_NONE)
      
    end
  endtask : body
  
  
  endclass
