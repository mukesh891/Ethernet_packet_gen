`uvm_analysis_imp_decl(_m)
`uvm_analysis_imp_decl(_s)
class eth_sbd extends uvm_scoreboard;
  eth_config cfg;
  eth_seq_item 		m_tx;
  eth_seq_item 		s_tx;
  eth_seq_item 		m_tx_q[$];
  eth_seq_item 		s_tx_q[$];
  int crc_q[$];
  int good_pkt=0;
  int bad_pkt=0;
  eth_seq_item tx2;
  
  uvm_analysis_imp_m#(eth_seq_item,eth_sbd) m_ap_imp;
  uvm_analysis_imp_s#(eth_seq_item,eth_sbd) s_ap_imp;
  `uvm_component_utils(eth_sbd)
  `NEW_COMP
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_ap_imp = new("m_ap_imp", this);
    s_ap_imp = new("s_ap_imp", this);
    cfg = eth_config::type_id::create("cfg");
    m_tx= eth_seq_item::type_id::create("m_tx");

  endfunction
  
  virtual function void write_m(eth_seq_item tx);
    `uvm_info(get_type_name(),"This is SCOREBOARD",UVM_LOW)
    m_tx_q.push_back(tx);    
  endfunction
  
  virtual function void write_s(eth_seq_item tx);
    `uvm_info(get_type_name(),"This is SCOREBOARD",UVM_LOW)
        s_tx_q.push_back(tx);
  endfunction
  
  task run_phase(uvm_phase phase);
    
    tx2=new();
    //check for  cfg.m_err_eij_q error packets using pop and compare with a local int i, increment i++ and check if the respective pkts are eij properly or not. If err injection successful then dont display those packets
    //check for  cfg.s_err_eij_q error packets using pop and compare with a local int i, increment i++ and check if the respective pkts are eij properly or not. If err injection successful then dont display those packets
    forever begin
      tx2.crc=cfg.crc_err_val;
    //repeat(cfg.no_req)begin
      wait(m_tx_q.size()>0)
      m_tx=m_tx_q.pop_front();
      if(m_tx.crc!=tx2.crc)begin
        `uvm_info(get_type_name(),"GOOD PKT RECIEVED",UVM_LOW)
        good_pkt++;
      end
      else bad_pkt++;
    `uvm_info(get_type_name(),$sformatf("TOTAL NUMBERS OF GOOD PKT RECIEVED = %0d",good_pkt),UVM_LOW)

      end

    //end
    
  endtask
endclass
