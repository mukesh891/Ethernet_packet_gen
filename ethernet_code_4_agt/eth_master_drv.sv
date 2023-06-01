class eth_master_drv extends uvm_driver#(eth_seq_item);
  eth_seq_item tx;
  eth_config cfg;
  virtual eth_if vif;
  
 int unsigned i=0,j=0;
  int err_pkt_num;

  //parameter pkts=10;

  //bit[719:0] frame[pkts];
//  byte b_frame;
  bit[7:0] b_frame[90];
  `uvm_component_utils(eth_master_drv)
  //`NEW_COMP
  function new(string name="", uvm_component parent=null); 
		super.new(name,parent); 
	endfunction
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    cfg = eth_config::type_id::create("cfg");
    //uvm_config_db#(virtual eth_if)::get(null,"*","vif",vif);
    uvm_resource_db#(virtual eth_if)::read_by_type("ETH",vif,this);
    `uvm_info("my_unique_id","eth_master_driver",UVM_NONE)
    
  endfunction: build_phase
  
  task run_phase(uvm_phase phase);
    cfg.m_actual_err_pkt_eij=0;
    
    for(int k=0;k<cfg.m_total_err_pkt_eij;k++)begin
      
      std::randomize(err_pkt_num) with  {err_pkt_num inside {[1:cfg.m_no_req-1]};
                                           !(err_pkt_num inside {cfg.m_err_eij_q});};
   		cfg.m_err_eij_q.push_back(err_pkt_num);
      	cfg.m_err_eij_q.shuffle();
    end
    
    cfg.m_err_eij_q.sort();
    `uvm_info(get_type_name(),$sformatf("---------cfg.m_err_eij_q=%0p------------",cfg.m_err_eij_q),UVM_LOW)

    forever begin
      @(posedge vif.clk);
      wait(vif.rst==0);
      `uvm_info(get_type_name(),$sformatf("AGENT 1 DRIVINF AT %s ",cfg.agt1_speed),UVM_NONE)
      
      seq_item_port.get_next_item(req);
      //START::ERROR PKT INJECTION
      if(cfg.m_total_err_pkt_eij>0)begin
      	if(cfg.m_err_eij_q[j]==i)begin
      		`uvm_do_callbacks(eth_master_drv,m_driver_callback,update_resp(req)) 
        	j++;
        	cfg.m_actual_err_pkt_eij++;
      	end
      end
      //END::ERROR PKT INJECTION
      req.print();
      drive_tx(req);
      i++;  
      `uvm_info("MASTER_PKT_NUMS_SENT",$sformatf("MASTER NUM PKTS=%0d",i),UVM_NONE)

      seq_item_port.item_done(); 
      
    end
    
  endtask
  
  task drive_tx(eth_seq_item tx);
    `uvm_info(get_type_name(),"before driving",UVM_NONE)
    
    vif.preamble<=tx.preamble;
  	vif.sfd<=tx.sfd;
  	vif.da<=tx.da;
  	vif.sa<=tx.sa;
 	vif.len<=tx.len;
  	vif.payload<=tx.payload;
  	vif.crc<=tx.crc;
    
    /*for(int i=0;i<pkts;i++)begin
      frame[i]={req.preamble,req.sfd,req.da,req.sa,req.len,req.payload,req.crc};
      `uvm_info("get_type_name()",$sformatf("pkt=%p",frame[i]),UVM_MEDIUM)
    end
    `uvm_info("get_type_name()",$sformatf("pkt=%p",frame),UVM_MEDIUM)*/
    /*for (int j=0;j<10;j++)begin
      for(int i=0;i<90;i++)begin
        //b_frame[i]=frame[j][((8*i)+7):(8*i)];
        b_frame[j]=frame[j][((i*by)+7):(i*by)];
    //hex'(b_frame[0]=b_frame[0]);
    $display("b_frame=%h",b_frame[0]);
      end
    end
   */
  endtask
  
  constraint err_eij_q_c{
    cfg.m_err_eij_q.size()== cfg.m_total_err_pkt_eij;
    unique {cfg.m_err_eij_q};
    err_pkt_num inside {[1:9]};
    !(err_pkt_num inside {cfg.m_err_eij_q});
  };
  
endclass
