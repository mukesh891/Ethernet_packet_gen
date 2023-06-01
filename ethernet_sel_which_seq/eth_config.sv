 typedef enum bit{
  agt0,
  agt1
}which_agent;

 //`define num_req no_req

class eth_config extends uvm_object;
  // error value
  int crc_err_val;
  //int no_req;
  bit[9:0] pkt_id;
  //which test are we executing
  string testname;
  //We are injecting error to which agent(by name)
  which_agent agt_name;
  //We are injecting error to which agent(by number)
  bit[3:0] agt_num;
  // we will use     $cast(agt_name,agt_num);  to get agent name by putting bit values
  
  //declare variable for unidirectional total_err_pkt_eij(either master agt or slv agent)
  int unsigned total_err_pkt_eij;
  
  //declare variable for unidirectional total_err_pkt_eij(either master agt or slv agent)
  int unsigned m_total_err_pkt_eij;
  //declare variable for unidirectional total_err_pkt_eij(either master agt or slv agent)
  int unsigned s_total_err_pkt_eij;
  
  //  //declare variable for unidirectional which_pkt_nums for which pkts to inject(either master agt or slv agent)
  int unsigned which_pkt_num;
  
  //  //declare variable for unidirectional which_pkt_nums for which pkts to inject(either master agt or slv agent)
  //int m_which_pkt_num[];
  int m_which_pkt_num;
  
  //  //declare variable for unidirectional which_pkt_nums for which pkts to inject(either master agt or slv agent)
  int unsigned s_which_pkt_num[];
  
  //no. of req for pkt generation
  int no_req;
  int m_no_req;
  int s_no_req;
  
    rand int m_err_eij_q[$];
    rand int s_err_eij_q[$];
  
  //Here we need to check that m_total_err_pkt_eij == m_actual_err_pkt_eij && s_total_err_pkt_eij == s_actual_err_pkt_eij
  	int m_actual_err_pkt_eij;
  	int s_actual_err_pkt_eij;
  
  string agt1_speed;
  string agt2_speed;

  string seq_name;

  `uvm_object_utils(eth_config)
  
  function new(string name=""); 
		super.new(name); 
    $display("------------------------------------------this is UVM_CONFIGURATION FILE------------------------------------------------");
    `uvm_info(get_type_name(),$sformatf("------------------------------test_name=%s--------------------------------",testname),UVM_NONE)
    
    
    $value$plusargs("crc_err_val=%0d",crc_err_val);
    $value$plusargs("no_req=%0d",no_req);
    $value$plusargs("m_no_req=%0d",m_no_req);
    $value$plusargs("s_no_req=%0d",s_no_req);
    //pkt_id=new[no_req];
// `define num_req no_req

    // All arguments for injection of error
    $value$plusargs("testname=%s",testname);
    //$value$plusargs("agt_name=%s",agt_name);
    $value$plusargs("agt_num=%d",agt_num);
    $display("this is UVM_CONFIGURATION FILE	OPERATION happening to agent = %0d#####################################",agt_num);

    $value$plusargs("total_err_pkt_eij=%d",total_err_pkt_eij);
    $value$plusargs("m_total_err_pkt_eij=%d",m_total_err_pkt_eij);
    $value$plusargs("m_total_err_pkt_eij=%d",m_total_err_pkt_eij);
    $value$plusargs("s_total_err_pkt_eij=%d",s_total_err_pkt_eij);
    $value$plusargs("which_pkt_nums=%d",which_pkt_num);
    $value$plusargs("m_which_pkt_nums=%s",m_which_pkt_num);
    $value$plusargs("agt1_speed=%s",agt1_speed);
    $value$plusargs("agt2_speed=%s",agt2_speed);
          //s_which_pkt_num=new[m_total_err_pkt_eij];
    $value$plusargs("seq_name=%s",seq_name);

   
    
   
   
	endfunction
  
  uvm_active_passive_enum active = UVM_ACTIVE;
  
   
  /*task body();
    //agt_num=0;
    // All arguments for injection of error
    $value$plusargs("testname=%s",testname);
    //$value$plusargs("agt_name=%s",agt_name);
    $value$plusargs("agt_num=%s",agt_num);
    $display("this is UVM_CONFIGURATION FILE	OPERATION happening to agent = %0d#####################################-",agt_num);

    $value$plusargs("total_err_pkt_eij=%s",total_err_pkt_eij);
    $value$plusargs("m_total_err_pkt_eij=%s",m_total_err_pkt_eij);
    $value$plusargs("s_total_err_pkt_eij=%s",s_total_err_pkt_eij);
    $value$plusargs("which_pkt_nums=%s",which_pkt_nums);
    $value$plusargs("m_which_pkt_nums=%s",m_which_pkt_nums);
    $value$plusargs("s_which_pkt_nums=%s",s_which_pkt_nums);
   
    ///////////////////////////////////////////////////
    $display("this is UVM_CONFIGURATION FILE------------------------------------------------");
    `uvm_info(get_type_name(),$sformatf("565656566------------------------------test_name=%s--------------------------------",testname),UVM_NONE)
  endtask*/
  
  constraint sel_c{
  	agt_num!=3;
    //m_which_pkt_num.len()==m_total_err_pkt_eij;
//    m_which_pkt_num.len()==m_total_err_pkt_eij;
  }
  
endclass
