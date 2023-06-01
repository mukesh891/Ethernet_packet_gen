vlog testbench.sv +incdir+/home/mukesh/ethernet_eij/ 
#vsim -c -novopt -suppress 12110 top -sv_lib /global/apps/mentor_graphics/questa_10.7d/questasim/bin/vsim -do "run -all;exit"
#vsim -c -sv_lib /DATA/installation/mentor_graphics/questa_10.3d/questasim/uvm-1.1d/linux_x86_64/uvm_dpi top +testname=fcs_error_injection +crc_err_val=305419896 +agt_num=2 +s_no_req=10 +m_no_req=15 +agt1_speed=10G +agt2_speed=5G -do "run -all;exit"
vsim -c -sv_lib /DATA/installation/mentor_graphics/questa_10.7d/questasim/uvm-1.2/linux_x86_64/uvm_dpi top +testname=fcs_error_injection +crc_err_val=305419896 +agt_num=2 +s_no_req=10 +m_no_req=15 +agt1_speed=10G +agt2_speed=5G -do "run -all;exit"
#vsim top
#add wave -position insertpoint sim:/top/*
