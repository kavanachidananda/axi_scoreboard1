
`ifndef AXI_MASTER_SCOREBOARD_INCLUDED_
`define AXI_MASTER_SCOREBOARD_INCLUDED_

  import uvm_pkg::*;
 `include "uvm_macros.svh"
//--------------------------------------------------------------------------------------------
// Class: axi_master_scoreboard
// Scoreboard will get the data from the analysis port of the  monitor and driver that goes into the implementation port
//--------------------------------------------------------------------------------------------
class axi_master_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(axi_master_scoreboard) // factory registration

  // Declaring handles for Driver and Monitor transactions
  
  axi_master_sequence_item axi_master_driver_sequence_item_h1;
  axi_master_sequence_item axi_master_driver_sequence_item_h2;
  axi_master_sequence_item axi_master_driver_sequence_item_h3;
  axi_master_sequence_item axi_master_driver_sequence_item_h4;
  axi_master_sequence_item axi_master_driver_sequence_item_h5;

  axi_master_sequence_item axi_master_monitor_sequence_item_h1;
  axi_master_sequence_item axi_master_monitor_sequence_item_h2;
  axi_master_sequence_item axi_master_monitor_sequence_item_h3;
  axi_master_sequence_item axi_master_monitor_sequence_item_h4;
  axi_master_sequence_item axi_master_monitor_sequence_item_h5;

  //Variable : axi_master_driver_analysis_fifo
  //Used to store the axi_driver_data
 
  uvm_tlm_analysis_fifo#(axi_master_sequence_item) axi_master_driver_read_address_analysis_fifo;
  uvm_tlm_analysis_fifo#(axi_master_sequence_item) axi_master_driver_read_data_analysis_fifo;
  uvm_tlm_analysis_fifo#(axi_master_sequence_item) axi_master_driver_write_address_analysis_fifo;
  uvm_tlm_analysis_fifo#(axi_master_sequence_item) axi_master_driver_write_data_analysis_fifo;
  uvm_tlm_analysis_fifo#(axi_master_sequence_item) axi_master_driver_write_response_analysis_fifo;
  
  //Variable : axi_master_monitor_analysis_fifo
  //Used to store the axi_master_monitor_data
  uvm_tlm_analysis_fifo#(axi_master_sequence_item) axi_master_monitor_read_address_analysis_fifo;
  uvm_tlm_analysis_fifo#(axi_master_sequence_item) axi_master_monitor_read_data_analysis_fifo;
  uvm_tlm_analysis_fifo#(axi_master_sequence_item) axi_master_monitor_write_address_analysis_fifo;
  uvm_tlm_analysis_fifo#(axi_master_sequence_item) axi_master_monitor_write_data_analysis_fifo;
  uvm_tlm_analysis_fifo#(axi_master_sequence_item) axi_master_monitor_write_response_analysis_fifo;


  //master_driver_tx_count
  int axi_master_driver_awaddr_count;
  //master_monitor_tx_count
  int axi_master_monitor_awaddr_count;

  //master_driver_tx_count
  int axi_master_driver_wdata_count;
  //master_monitor_tx_count
  int axi_master_monitor_wdata_count;

  //master_driver_tx_count
  int axi_master_driver_bresp_count;
  //master_monitor_tx_count
  int axi_master_monitor_bresp_count;

  //master_driver_tx_count
  int axi_master_driver_araddr_count;
  //master_monitor_tx_count
  int axi_master_monitor_araddr_count;

  //master_driver_tx_count
  int axi_master_driver_rdata_count;
  //master_monitor_tx_count
  int axi_master_monitor_rdata_count;

  //master_driver_tx_count
  int axi_master_driver_rresp_count;
  //master_monitor_tx_count
  int axi_master_monitor_rresp_count;

 // Signals used to declare verified count Write address channel
  int cmp_verified_awid_count;
  int cmp_verified_awaddr_count;
  int cmp_verified_awsize_count;
  int cmp_verified_awlen_count;
  int cmp_verified_awburst_count;
  int cmp_verified_awcache_count;
  int cmp_verified_awlock_count;
  int cmp_verified_awprot_count;

// Signals used to declare verified count Write data channel

  int cmp_verified_wdata_count;
  int cmp_verified_wstrb_count;
  int cmp_verified_wuser_count;

// Signals used to declare verified count Write response channel
  int cmp_verified_bid_count;
  int cmp_verified_bresp_count;
  int cmp_verified_buser_count;

// Signals used to declare verified count Read address channel
  int cmp_verified_arid_count;
  int cmp_verified_araddr_count;
  int cmp_verified_arsize_count;
  int cmp_verified_arlen_count;
  int cmp_verified_arburst_count;
  int cmp_verified_arcache_count;
  int cmp_verified_arlock_count;
  int cmp_verified_arprot_count;
  int cmp_verified_arregion_count;
  int cmp_verified_arqos_count;
  
// Signals used to declare verified count Read data channel
  int cmp_verified_rid_count;
  int cmp_verified_rdata_count;
  int cmp_verified_rresp_count;
  int cmp_verified_ruser_count;

// Signals used to declare failed count Write address channel
  int cmp_failed_awid_count;
  int cmp_failed_awaddr_count;
  int cmp_failed_awsize_count;
  int cmp_failed_awlen_count;
  int cmp_failed_awburst_count;
  int cmp_failed_awcache_count;
  int cmp_failed_awlock_count;
  int cmp_failed_awprot_count;

// Signals used to declare failed count Write data channel
  int cmp_failed_wdata_count;
  int cmp_failed_wstrb_count;
  int cmp_failed_wuser_count;

// Signals used to declare failed count Write response channel
  int cmp_failed_bid_count;
  int cmp_failed_bresp_count;
  int cmp_failed_buser_count;

// Signals used to declare failed count Read address channel
  int cmp_failed_arid_count;
  int cmp_failed_araddr_count;
  int cmp_failed_arsize_count;
  int cmp_failed_arlen_count;
  int cmp_failed_arburst_count;
  int cmp_failed_arcache_count;
  int cmp_failed_arlock_count;
  int cmp_failed_arprot_count;
  int cmp_failed_arregion_count;
  int cmp_failed_arqos_count;

// Signals used to declare failed count Read data channel
  int cmp_failed_rid_count;
  int cmp_failed_rdata_count;
  int cmp_failed_rresp_count;
  int cmp_failed_ruser_count;



   //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "axi_master_scoreboard", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);
  extern virtual task axi_write_address();
  extern virtual task axi_write_data();
  extern virtual task axi_write_response();
  extern virtual task axi_read_address();
  extern virtual task axi_read_data();
  extern virtual task axi_write_address_comparision(input axi_master_sequence_item axi_master_driver_sequence_item_h1,input axi_master_sequence_item axi_monitor_sequence_item_h1);
  extern virtual task axi_write_data_comparision(input axi_master_sequence_item axi_master_driver_sequence_item_h2,input axi_master_sequence_item axi_monitor_sequence_item_h2);
  extern virtual task axi_write_response_comparision(input axi_master_sequence_item axi_master_driver_sequence_item_h3,input axi_master_sequence_item axi_monitor_sequence_item_h3);
  extern virtual task axi_read_address_comparision(input axi_master_sequence_item axi_master_driver_sequence_item_h4,input axi_master_sequence_item axi_monitor_sequence_item_h4);
  extern virtual task axi_read_data_comparision(input axi_master_sequence_item axi_master_driver_sequence_item_h5,input axi_master_sequence_item axi_monitor_sequence_item_h5);
  extern virtual function void check_phase (uvm_phase phase);

endclass : axi_master_scoreboard

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - axi_master_scoreboard
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function axi_master_scoreboard::new(string name = "axi_master_scoreboard",
                                 uvm_component parent = null);
  super.new(name, parent);
  axi_master_driver__write_address_analysis_fifo = new("axi_master_driver_write_address_analysis_fifo",this);
  axi_master_driver_write_data_analysis_fifo = new("axi_master_driver_write_data_analysis_fifo",this);
  axi_master_driver_write_response_analysis_fifo= new("axi_master_driver_write_response_analysis_fifo",this);
  axi_master_driver_read_address_analysis_fifo = new("axi_master_driver_read_address_analysis_fifo",this);
  axi_master_driver_read_data_analysis_fifo = new("axi_master_driver_read_data_analysis_fifo",this);

  axi_master_monitor_write_address_analysis_fifo = new("axi_master_monitor_write_address_analysis_fifo",this);
  axi_master_monitor_write_data_analysis_fifo = new("axi_master_monitor_write_data_analysis_fifo",this);
  axi_master_monitor_write_response_analysis_fifo= new("axi_master_monitor_write_response_analysis_fifo",this);
  axi_master_monitor_read_address_analysis_fifo = new("axi_master_monitor_read_address_analysis_fifo",this);
  axi_master_monitor_read_data_analysis_fifo = new("axi_master_monitor_read_data_analysis_fifo",this);

  
endfunction : new

//--------------------------------------------------------------------------------------------
// Task: run_phase
// All the comparision are done
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
task axi_master_scoreboard::run_phase(uvm_phase phase);

  super.run_phase(phase);

  fork
    axi_write_address();
    axi_write_data();
    axi_write_response();
    axi_read_address();
    axi_read_data();
  join

endtask : run_phase

//--------------------------------------------------------------------------------------------
// Task: axi_write_address
// Gets the driver and monitor write address and send it to the write address comparision task
//--------------------------------------------------------------------------------------------
task axi_master_scoreboard::axi_write_address();

  forever begin
   
    axi_master_driver_write_address_analysis_fifo.get(axi_master_driver_sequence_item_h1);
    `uvm_info(get_type_name(),$sformatf("scoreboard's axi_master_driver_write_address_channel \n%s",axi_master_driver_sequence_item_h1.sprint()),UVM_HIGH)
    axi_master_monitor_write_address_analysis_fifo.get(axi_master_monitor_sequence_item_h1);
    `uvm_info(get_type_name(),$sformatf("scoreboard's axi_master_monitor_write_address_channel \n%s",axi_master_monitor_sequence_item_h1.sprint()),UVM_HIGH)
    axi_write_address_comparision(axi_master_driver_sequence_item_h1,axi_master_monitor_sequence_item_h1);
    axi_master_driver_awaddr_count++;
    `uvm_info(get_type_name(),$sformatf("scoreboard's axi_master_driver_write_address_channel count \n %0d",axi_master_driver_awaddr_count),UVM_HIGH)
    axi_master_monitor_awaddr_count++;
    `uvm_info(get_type_name(),$sformatf("scoreboard's axi_master_monitor_write_address_channel count \n %0d",axi_master_monitor_awaddr_count),UVM_HIGH)
  
  end

endtask : axi_write_address


//--------------------------------------------------------------------------------------------
// Task: axi_write_data
// Gets the driver and monitor write data and send it to the write data comparision task
//--------------------------------------------------------------------------------------------
 task axi_master_scoreboard::axi_write_data();

   forever begin
     
     axi_master_driver_write_data_analysis_fifo.get(axi_master_driver_sequence_item_h2);
     `uvm_info(get_type_name(),$sformatf("scoreboard's axi_master_driver_write_data_channel \n%s",axi_master_driver_sequence_item_h2.sprint()),UVM_HIGH)
     axi_master_monitor_write_data_analysis_fifo.get(axi_master_monitor_sequence_item_h2);
     `uvm_info(get_type_name(),$sformatf("scoreboard's axi_master_monitor_write_data_channel \n%s",axi_master_monitor_sequence_item_h2.sprint()),UVM_HIGH)
     axi_write_data_comparision(axi_master_driver_sequence_item_h2,axi_master_monitor_sequence_item_h2);
     axi_master_driver_wdata_count++;
     `uvm_info(get_type_name(),$sformatf("scoreboard's axi_master_driver_write_data_channel count \n %0d",axi_master_driver_wdata_count),UVM_HIGH)
     axi_master_monitor_wdata_count++;
     `uvm_info(get_type_name(),$sformatf("scoreboard's axi_master_monitor_write_data_channel count \n %0d",axi_master_monitor_wdata_count),UVM_HIGH)
    
   end

endtask : axi_write_data



//--------------------------------------------------------------------------------------------      
 // Task: axi_write_response                                                                             
// Gets the driver and monitor write response and send it to the write response comparision task
 //--------------------------------------------------------------------------------------------      
  task axi_master_scoreboard::axi_write_response();                                                      
                                                                                                     
    forever begin                                                                                    
                                                                       
      axi_master_driver_write_response_analysis_fifo.get(axi_master_driver_sequence_item_h3);            
      `uvm_info(get_type_name(),$sformatf("scoreboard's axi_master_driver_write_response_channel \n%s",axi_master_driver_sequence_item_h3.sprint()),UVM_HIGH)
      axi_master_monitor_write_response_analysis_fifo.get(axi_master_monitor_sequence_item_h3);          
      `uvm_info(get_type_name(),$sformatf("scoreboard's axi_master_monitor_write_response_channel \n%s",axi_master_monitor_sequence_item_h3.sprint()),UVM_HIGH)
      axi_write_response_comparision(axi_master_driver_sequence_item_h3,axi_master_monitor_sequence_item_h3);
      axi_master_driver_bresp_count++;                                                               
`uvm_info(get_type_name(),$sformatf("scoreboard's axi_master_driver_write_response_channel count \n %0d",axi_master_driver_bresp_count),UVM_HIGH)
      axi_master_monitor_bresp_count++;                                                              
      `uvm_info(get_type_name(),$sformatf("scoreboard's axi_master_monitor_write_response_channel count \n %0d",axi_master_monitor_bresp_count),UVM_HIGH)
                                                                     
    end                                                                                              
                                                                                                     
endtask : axi_write_response

//--------------------------------------------------------------------------------------------
 // Task: axi_read_address
 // Gets the driver and monitor read address and send it to the read address comparision task
 //--------------------------------------------------------------------------------------------
 task axi_master_scoreboard::axi_read_address();
   forever begin

     axi_master_driver_read_address_analysis_fifo.get(axi_master_driver_sequence_item_h4);
     `uvm_info(get_type_name(),$sformatf("scoreboard's axi_master_driver_read_address_channel \n%s",axi_master_driver_sequence_item_h4.sprint()),UVM_HIGH)
     axi_master_monitor_read_address_analysis_fifo.get(axi_master_monitor_sequence_item_h4);
     `uvm_info(get_type_name(),$sformatf("scoreboard's axi_master_monitor_read_address_channel \n%s",axi_master_monitor_sequence_item_h4.sprint()),UVM_HIGH)
     axi_read_address_comparision(axi_master_driver_sequence_item_h4,axi_master_monitor_sequence_item_h4);
     axi_master_driver_araddr_count++;
     `uvm_info(get_type_name(),$sformatf("scoreboard's axi_master_driver_read_address_channel count \n %0d",axi_master_driver_araddr_count),UVM_HIGH)
     axi_master_monitor_araddr_count++;
     `uvm_info(get_type_name(),$sformatf("scoreboard's axi_master_monitor_read_address_channel count \n %0d",axi_master_monitor_araddr_count),UVM_HIGH)
     
   end

endtask : axi_read_address

//--------------------------------------------------------------------------------------------      
// Task: axi_write_data                                                                             
// Gets the driver and monitor write data and send it to the write data comparision task            
//--------------------------------------------------------------------------------------------      

task axi_master_scoreboard::axi_read_data();                                                      
                                                                                                     
    forever begin                                                                                    

      axi_master_driver_read_data_analysis_fifo.get(axi_master_driver_sequence_item_h5);            
      `uvm_info(get_type_name(),$sformatf("scoreboard's axi_master_driver_read_data_channel \n%s",axi_master_driver_sequence_item_h5.sprint()),UVM_HIGH)
      axi_master_monitor_read_data_analysis_fifo.get(axi_master_monitor_sequence_item_h5);          
      `uvm_info(get_type_name(),$sformatf("scoreboard's axi_master_monitor_read_data_channel \n%s",axi_master_monitor_sequence_item_h5.sprint()),UVM_HIGH)
      axi_read_data_comparision(axi_master_driver_sequence_item_h5,axi_master_monitor_sequence_item_h5);
      axi_master_driver_rdata_count++;                                                               
      `uvm_info(get_type_name(),$sformatf("scoreboard's axi_master_driver_read_data_channel count \n %0d",axi_master_driver_rdata_count),UVM_HIGH)
      axi_master_monitor_rdata_count++;                                                              
      `uvm_info(get_type_name(),$sformatf("scoreboard's axi_master_monitor_read_data_channel count \n %0d",axi_master_monitor_rdata_count),UVM_HIGH)
                                                                            
    end                                                                                              
                                                                                                     
endtask : axi_read_data




//--------------------------------------------------------------------------------------------
// Task : axi_write_address_comparision
// Used to compare the driver and monitor write address
// Parameter :
//  axi_master_driver_sequence_item_h1 
//  axi_master_monitor_sequence_item_h1 
//--------------------------------------------------------------------------------------------
task axi_scoreboard::axi_write_address_comparision(input axi_master_sequence_item axi_master_driver_sequence_item_h1,input axi_master_sequence_item axi_master_monitor_sequence_item_h1);

  if(axi_master_driver_sequence_item_h1.awid == axi_master_monitor_sequence_item_h1.awid)begin
    `uvm_info(get_type_name(),$sformatf("axi_awid from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_AWID_MATCHED", $sformatf("Driver AWID = 'h%0x and monitor AWID = 'h%0x",axi_master_driver_sequence_item_h1.awid,axi_master_monitor_sequence_item_h1.awid), UVM_HIGH);
    cmp_verified_awid_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_awid from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_AWID_NOT_MATCHED", $sformatf("Driver AWID = 'h%0x and monitor AWID = 'h%0x",axi_master_driver_sequence_item_h1.awid,axi_master_monitor_sequence_item_h1.awid), UVM_HIGH);
    cmp_failed_awid_count++;
  end

  if(axi_master_driver_sequence_item_h1.awaddr == axi_master_monitor_sequence_item_h1.awaddr)begin
    `uvm_info(get_type_name(),$sformatf("axi_awaddr from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_AWADDR_MATCHED", $sformatf("Driver AWADDR = 'h%0x and monitor AWADDR = 'h%0x",axi_master_driver_sequence_item_h1.awaddr,axi_master_monitor_sequence_item_h1.awaddr), UVM_HIGH);
    cmp_verified_awaddr_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_awaddr from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_AWADDR_NOT_MATCHED", $sformatf("Driver AWADDR = 'h%0x and monitor AWADDR = 'h%0x",axi_master_driver_sequence_item_h1.awaddr,axi_master_monitor_sequence_item_h1.awaddr), UVM_HIGH);
    cmp_failed_awaddr_count++;
  end

  if(axi_master_driver_sequence_item_h1.awlen == axi_master_monitor_sequence_item_h1.awlen)begin
    `uvm_info(get_type_name(),$sformatf("axi_awlen from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_awlen_MATCHED", $sformatf("Driver awlen = 'h%0x and monitor awlen = 'h%0x",axi_master_driver_sequence_item_h1.awlen,axi_master_monitor_sequence_item_h1.awlen), UVM_HIGH);
    cmp_verified_awlen_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_awlen from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_awlen_NOT_MATCHED", $sformatf("Driver awlen = 'h%0x and monitor awlen = 'h%0x",axi_master_driver_sequence_item_h1.awlen,axi_master_monitor_sequence_item_h1.awlen), UVM_HIGH);
    cmp_failed_awlen_count++;
  end

  if(axi_master_driver_sequence_item_h1.awsize == axi_master_monitor_sequence_item_h1.awsize)begin
    `uvm_info(get_type_name(),$sformatf("axi_awsize from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_awsize_MATCHED", $sformatf("Driver awsize = 'h%0x and monitor awsize = 'h%0x",axi_master_driver_sequence_item_h1.awsize,axi_master_monitor_sequence_item_h1.awsize), UVM_HIGH);
    cmp_verified_awsize_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_awsize from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_awsize_NOT_MATCHED", $sformatf("Driver awsize = 'h%0x and monitor awsize = 'h%0x",axi_master_driver_sequence_item_h1.awsize,axi_master_monitor_sequence_item_h1.awsize), UVM_HIGH);
    cmp_failed_awsize_count++;
  end

  if(axi_master_driver_sequence_item_h1.awburst == axi_master_monitor_sequence_item_h1.awburst)begin
    `uvm_info(get_type_name(),$sformatf("axi_awburst from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_awburst_MATCHED", $sformatf("Driver awburst = 'h%0x and monitor awburst = 'h%0x",axi_master_driver_sequence_item_h1.awburst,axi_master_monitor_sequence_item_h1.awburst), UVM_HIGH);
    cmp_verified_awburst_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_awburst from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_awburst_NOT_MATCHED", $sformatf("Driver awburst = 'h%0x and monitor awburst = 'h%0x",axi_master_driver_sequence_item_h1.awburst,axi_master_monitor_sequence_item_h1.awburst), UVM_HIGH);
    cmp_failed_awburst_count++;
  end

  if(axi_master_driver_sequence_item_h1.awlock == axi_master_monitor_sequence_item_h1.awlock)begin
    `uvm_info(get_type_name(),$sformatf("axi_awlock from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_awlock_MATCHED", $sformatf("Driver awlock = 'h%0x and monitor awlock = 'h%0x",axi_master_driver_sequence_item_h1.awlock,axi_master_monitor_sequence_item_h1.awlock), UVM_HIGH);
    cmp_verified_awlock_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_awlock from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_awlock_NOT_MATCHED", $sformatf("Driver awlock = 'h%0x and monitor awlock = 'h%0x",axi_master_driver_sequence_item_h1.awlock,axi_master_monitor_sequence_item_h1.awlock), UVM_HIGH);
    cmp_failed_awlock_count++;
  end

  if(axi_master_driver_sequence_item_h1.awcache == axi_master_monitor_sequence_item_h1.awcache)begin
    `uvm_info(get_type_name(),$sformatf("axi_awcache from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_awcache_MATCHED", $sformatf("Driver awcache = 'h%0x and monitor awcache = 'h%0x",axi_master_driver_sequence_item_h1.awcache,axi_master_monitor_sequence_item_h1.awcache), UVM_HIGH);
    cmp_verified_awcache_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_awcache from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_awcache_NOT_MATCHED", $sformatf("Driver awcache = 'h%0x and monitor awcache = 'h%0x",axi_master_driver_sequence_item_h1.awcache,axi_master_monitor_sequence_item_h1.awcache), UVM_HIGH);
    cmp_failed_awcache_count++;
  end

  if(axi_master_driver_sequence_item_h1.awprot == axi_master_monitor_sequence_item_h1.awprot)begin
    `uvm_info(get_type_name(),$sformatf("axi_awprot from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_awprot_MATCHED", $sformatf("Driver awprot = 'h%0x and monitor awprot = 'h%0x",axi_master_driver_sequence_item_h1.awprot,axi_master_monitor_sequence_item_h1.awprot), UVM_HIGH);
    cmp_verified_awprot_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_awprot from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_awprot_NOT_MATCHED", $sformatf("Driver awprot = 'h%0x and monitor awprot = 'h%0x",axi_master_driver_sequence_item_h1.awprot,axi_master_monitor_sequence_item_h1.awprot), UVM_HIGH);
    cmp_failed_awprot_count++;
  end

endtask : axi_write_address_comparision

//--------------------------------------------------------------------------------------------
// Task : axi_write_data_comparision
// Used to compare the received master and monitor write data
// Parameter :
//  axi_master_driver_sequence_item_h2 - axi_master_tx
//  axi_master_monitor_sequence_item_h2  - axi_monitor_tx
//--------------------------------------------------------------------------------------------
task axi_scoreboard::axi_write_data_comparision(input axi_master_sequence_item axi_master_driver_sequence_item_h2,input axi_master_sequence_item axi_master_monitor_sequence_item_h2);

  axi_write_address_comparision(axi_master_driver_sequence_item_h2,axi_master_monitor_sequence_item_h2);

  if(axi_master_driver_sequence_item_h2.wdata == axi_master_monitor_sequence_item_h2.wdata)begin
    `uvm_info(get_type_name(),$sformatf("axi_wdata from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_wdata_MATCHED", $sformatf("Driver wdata = %0p and monitor wdata = %0p",axi_master_driver_sequence_item_h2.wdata,axi_master_monitor_sequence_item_h2.wdata), UVM_HIGH);
    cmp_verified_wdata_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_wdata from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_wdata_NOT_MATCHED", $sformatf("Driver wdata = %0p and monitor wdata = %0p",axi_master_driver_sequence_item_h2.wdata,axi_master_monitor_sequence_item_h2.wdata), UVM_HIGH);
  end

  if(axi_master_driver_sequence_item_h2.wstrb == axi_master_monitor_sequence_item_h2.wstrb)begin
    `uvm_info(get_type_name(),$sformatf("axi_wstrb from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_wstrb_MATCHED", $sformatf("Driver wstrb = %0p and monitor wstrb = %0p",axi_master_driver_sequence_item_h2.wstrb,axi_master_monitor_sequence_item_h2.wstrb), UVM_HIGH);
    cmp_verified_wstrb_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_wstrb from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_wstrb_NOT_MATCHED", $sformatf("Driver wstrb = %0p and monitor wstrb = %0p",axi_master_driver_sequence_item_h2.wstrb,axi_master_monitor_sequence_item_h2.wstrb), UVM_HIGH);
  end

  if(axi_master_driver_sequence_item_h2.wuser == axi_master_monitor_sequence_item_h2.wuser)begin
    `uvm_info(get_type_name(),$sformatf("axi_wuser from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_wuser_MATCHED", $sformatf("Driver wuser = 'h%0x and monitor wuser = 'h%0x",axi_master_driver_sequence_item_h2.wuser,axi_master_monitor_sequence_item_h2.wuser), UVM_HIGH);
    cmp_verified_wuser_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_wuser from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_wuser_NOT_MATCHED", $sformatf("Driver wuser = 'h%0x and monitor wuser = 'h%0x",axi_master_driver_sequence_item_h2.wuser,axi_master_monitor_sequence_item_h2.wuser), UVM_HIGH);
  end

endtask : axi_write_data_comparision

//--------------------------------------------------------------------------------------------
// Task : axi_write_response_comparision
// Used to compare the received master and monitor write response
// Parameter :
//  axi_master_driver_sequence_item_h3 - axi_master_tx
//  axi_master_monitor_sequence_item_h3  - axi_monitor_tx
//--------------------------------------------------------------------------------------------
task axi_scoreboard::axi_write_response_comparision(input axi_master_sequence_item axi_master_driver_sequence_item_h3,input axi_master_sequence_item axi_master_monitor_sequence_item_h3);

  axi_write_data_comparision(axi_master_driver_sequence_item_h3,axi_master_monitor_sequence_item_h3);

  if(axi_master_driver_sequence_item_h3.bid == axi_master_monitor_sequence_item_h3.bid)begin
    `uvm_info(get_type_name(),$sformatf("axi_bid from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_bid_MATCHED", $sformatf("Driver bid = %0p and monitor bid = %0p",axi_master_driver_sequence_item_h3.bid,axi_master_monitor_sequence_item_h3.bid), UVM_HIGH);
    cmp_verified_bid_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_bid from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_bid_NOT_MATCHED", $sformatf("Driver bid = %0p and monitor bid = %0p",axi_master_driver_sequence_item_h3.bid,axi_master_monitor_sequence_item_h3.bid), UVM_HIGH);
  end

  if(axi_master_driver_sequence_item_h3.bresp == axi_master_monitor_sequence_item_h3.bresp)begin
    `uvm_info(get_type_name(),$sformatf("axi_bresp from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_bresp_MATCHED", $sformatf("Driver bresp = %0p and monitor bresp = %0p",axi_master_driver_sequence_item_h3.bresp,axi_master_monitor_sequence_item_h3.bresp), UVM_HIGH);
    cmp_verified_bresp_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_bresp from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_bresp_NOT_MATCHED", $sformatf("Driver bresp = %0p and monitor bresp = %0p",axi_master_driver_sequence_item_h3.bresp,axi_master_monitor_sequence_item_h3.bresp), UVM_HIGH);
  end

  if(axi_master_driver_sequence_item_h3.buser == axi_master_monitor_sequence_item_h3.buser)begin
    `uvm_info(get_type_name(),$sformatf("axi_buser from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_buser_MATCHED", $sformatf("Driver buser = 'h%0x and monitor buser = 'h%0x",axi_master_driver_sequence_item_h3.buser,axi_master_monitor_sequence_item_h3.buser), UVM_HIGH);
    cmp_verified_buser_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_buser from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_buser_NOT_MATCHED", $sformatf("Driver buser = 'h%0x and monitor buser = 'h%0x",axi_master_driver_sequence_item_h3.buser,axi_master_monitor_sequence_item_h3.buser), UVM_HIGH);
  end
endtask : axi_write_response_comparision

//--------------------------------------------------------------------------------------------
// Task : axi_read_address_comparision
// Used to compare the received master and monitor read address
// Parameter :
//  axi_master_driver_sequence_item_h4 - axi_master_tx
//  axi_master_monitor_sequence_item_h4  - axi_monitor_tx
//--------------------------------------------------------------------------------------------
task axi_scoreboard::axi_read_address_comparision(input axi_master_sequence_item axi_master_driver_sequence_item_h4,input axi_master_sequence_item axi_master_monitor_sequence_item_h4);


  if(axi_master_driver_sequence_item_h4.arid == axi_master_monitor_sequence_item_h4.arid)begin
    `uvm_info(get_type_name(),$sformatf("axi_arid from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_arID_MATCHED", $sformatf("Driver arID = 'h%0x and monitor arID = 'h%0x",axi_master_driver_sequence_item_h4.arid,axi_master_monitor_sequence_item_h4.arid), UVM_HIGH);
    cmp_verified_arid_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_arid from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_arID_NOT_MATCHED", $sformatf("Driver arID = 'h%0x and monitor arID = 'h%0x",axi_master_driver_sequence_item_h4.arid,axi_master_monitor_sequence_item_h4.arid), UVM_HIGH);
  end

  if(axi_master_driver_sequence_item_h4.araddr == axi_master_monitor_sequence_item_h4.araddr)begin
    `uvm_info(get_type_name(),$sformatf("axi_araddr from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_arADDR_MATCHED", $sformatf("Driver arADDR = 'h%0x and monitor arADDR = 'h%0x",axi_master_driver_sequence_item_h4.araddr,axi_master_monitor_sequence_item_h4.araddr), UVM_HIGH);
    cmp_verified_araddr_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_araddr from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_arADDR_NOT_MATCHED", $sformatf("Driver arADDR = 'h%0x and monitor arADDR = 'h%0x",axi_master_driver_sequence_item_h4.araddr,axi_master_monitor_sequence_item_h4.araddr), UVM_HIGH);
  end

  if(axi_master_driver_sequence_item_h4.arlen == axi_master_monitor_sequence_item_h4.arlen)begin
    `uvm_info(get_type_name(),$sformatf("axi_arlen from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_arlen_MATCHED", $sformatf("Driver arlen = 'h%0x and monitor arlen = 'h%0x",axi_master_driver_sequence_item_h4.arlen,axi_master_monitor_sequence_item_h4.arlen), UVM_HIGH);
    cmp_verified_arlen_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_arlen from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_arlen_NOT_MATCHED", $sformatf("Driver arlen = 'h%0x and monitor arlen = 'h%0x",axi_master_driver_sequence_item_h4.arlen,axi_master_monitor_sequence_item_h4.arlen), UVM_HIGH);
  end

  if(axi_master_driver_sequence_item_h4.arsize == axi_master_monitor_sequence_item_h4.arsize)begin
    `uvm_info(get_type_name(),$sformatf("axi_arsize from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_arsize_MATCHED", $sformatf("Driver arsize = 'h%0x and monitor arsize = 'h%0x",axi_master_driver_sequence_item_h4.arsize,axi_master_monitor_sequence_item_h4.arsize), UVM_HIGH);
    cmp_verified_arsize_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_arsize from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_arsize_NOT_MATCHED", $sformatf("Driver arsize = 'h%0x and monitor arsize = 'h%0x",axi_master_driver_sequence_item_h4.arsize,axi_master_monitor_sequence_item_h4.arsize), UVM_HIGH);
  end

  if(axi_master_driver_sequence_item_h4.arburst == axi_master_monitor_sequence_item_h4.arburst)begin
    `uvm_info(get_type_name(),$sformatf("axi_arburst from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_arburst_MATCHED", $sformatf("Driver arburst = 'h%0x and monitor arburst = 'h%0x",axi_master_driver_sequence_item_h4.arburst,axi_master_monitor_sequence_item_h4.arburst), UVM_HIGH);
    cmp_verified_arburst_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_arburst from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_arburst_NOT_MATCHED", $sformatf("Driver arburst = 'h%0x and monitor arburst = 'h%0x",axi_master_driver_sequence_item_h4.arburst,axi_master_monitor_sequence_item_h4.arburst), UVM_HIGH);
  end

  if(axi_master_driver_sequence_item_h4.arlock == axi_master_monitor_sequence_item_h4.arlock)begin
    `uvm_info(get_type_name(),$sformatf("axi_arlock from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_arlock_MATCHED", $sformatf("Driver arlock = 'h%0x and monitor arlock = 'h%0x",axi_master_driver_sequence_item_h4.arlock,axi_master_monitor_sequence_item_h4.arlock), UVM_HIGH);
    cmp_verified_arlock_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_arlock from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_arlock_NOT_MATCHED", $sformatf("Driver arlock = 'h%0x and monitor arlock = 'h%0x",axi_master_driver_sequence_item_h4.arlock,axi_master_monitor_sequence_item_h4.arlock), UVM_HIGH);
  end

  if(axi_master_driver_sequence_item_h4.arcache == axi_master_monitor_sequence_item_h4.arcache)begin
    `uvm_info(get_type_name(),$sformatf("axi_arcache from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_arcache_MATCHED", $sformatf("Driver arcache = 'h%0x and monitor arcache = 'h%0x",axi_master_driver_sequence_item_h4.arcache,axi_master_monitor_sequence_item_h4.arcache), UVM_HIGH);
    cmp_verified_arcache_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_arcache from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_arcache_NOT_MATCHED", $sformatf("Driver arcache = 'h%0x and monitor arcache = 'h%0x",axi_master_driver_sequence_item_h4.arcache,axi_master_monitor_sequence_item_h4.arcache), UVM_HIGH);
  end

  if(axi_master_driver_sequence_item_h4.arprot == axi_master_monitor_sequence_item_h4.arprot)begin
    `uvm_info(get_type_name(),$sformatf("axi_arprot from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_arprot_MATCHED", $sformatf("Driver arprot = 'h%0x and monitor arprot = 'h%0x",axi_master_driver_sequence_item_h4.arprot,axi_master_monitor_sequence_item_h4.arprot), UVM_HIGH);
    cmp_verified_arprot_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_arprot from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_arprot_NOT_MATCHED", $sformatf("Driver arprot = 'h%0x and monitor arprot = 'h%0x",axi_master_driver_sequence_item_h4.arprot,axi_master_monitor_sequence_item_h4.arprot), UVM_HIGH);
  end

  if(axi_master_driver_sequence_item_h4.arregion == axi_master_monitor_sequence_item_h4.arregion)begin
    `uvm_info(get_type_name(),$sformatf("axi_arregion from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_arregion_MATCHED", $sformatf("Driver arregion = 'h%0x and monitor arregion = 'h%0x",axi_master_driver_sequence_item_h4.arregion,axi_master_monitor_sequence_item_h4.arregion), UVM_HIGH);
    cmp_verified_arregion_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_arregion from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_arregion_NOT_MATCHED", $sformatf("Driver arregion = 'h%0x and monitor arregion = 'h%0x",axi_master_driver_sequence_item_h4.arregion,axi_master_monitor_sequence_item_h4.arregion), UVM_HIGH);
  end

  if(axi_master_driver_sequence_item_h4.arqos == axi_master_monitor_sequence_item_h4.arqos)begin
    `uvm_info(get_type_name(),$sformatf("axi_arqos from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_arqos_MATCHED", $sformatf("Driver arqos = 'h%0x and monitor arqos = 'h%0x",axi_master_driver_sequence_item_h4.arqos,axi_master_monitor_sequence_item_h4.arqos), UVM_HIGH);
    cmp_verified_arqos_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_arqos from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_arqos_NOT_MATCHED", $sformatf("Driver arqos = 'h%0x and monitor arqos = 'h%0x",axi_master_driver_sequence_item_h4.arqos,axi_master_monitor_sequence_item_h4.arqos), UVM_HIGH);
  end
endtask : axi_read_address_comparision

//--------------------------------------------------------------------------------------------
// Task : axi_read_data_comparision
// Used to compare the received master and monitor read data
// Parameter :
//  axi_master_driver_sequence_item_h5 - axi_master_tx
//  axi_master_monitor_sequence_item_h5  - axi_monitor_tx
//--------------------------------------------------------------------------------------------
task axi_scoreboard::axi_read_data_comparision(input axi_master_sequence_item axi_master_driver_sequence_item_h5,input axi_master_sequence_item axi_master_monitor_sequence_item_h5);

  axi_read_address_comparision(axi_master_driver_sequence_item_h5,axi_master_monitor_sequence_item_h5);

  if(axi_master_driver_sequence_item_h5.rid == axi_master_monitor_sequence_item_h5.rid)begin
    `uvm_info(get_type_name(),$sformatf("axi_rid from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_rid_MATCHED", $sformatf("Driver rid = %0p and monitor rid = %0p",axi_master_driver_sequence_item_h5.rid,axi_master_monitor_sequence_item_h5.rid), UVM_HIGH);
    cmp_verified_rid_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_rid from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_rid_NOT_MATCHED", $sformatf("Driver rid = %0p and monitor rid = %0p",axi_master_driver_sequence_item_h5.rid,axi_master_monitor_sequence_item_h5.rid), UVM_HIGH);
  end

  if(axi_master_driver_sequence_item_h5.rdata == axi_master_monitor_sequence_item_h5.rdata)begin
    `uvm_info(get_type_name(),$sformatf("axi_rdata from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_rdata_MATCHED", $sformatf("Driver rdata = %0p and monitor rdata = %0p",axi_master_driver_sequence_item_h5.rdata,axi_master_monitor_sequence_item_h5.rdata), UVM_HIGH);
    cmp_verified_rdata_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_rdata from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_rdata_NOT_MATCHED", $sformatf("Driver rdata = %0p and monitor rdata = %0p",axi_master_driver_sequence_item_h5.rdata,axi_master_monitor_sequence_item_h5.rdata), UVM_HIGH);
  end

  if(axi_master_driver_sequence_item_h5.rresp == axi_master_monitor_sequence_item_h5.rresp)begin
    `uvm_info(get_type_name(),$sformatf("axi_rresp from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_rresp_MATCHED", $sformatf("Driver rresp = %0p and monitor rresp = %0p",axi_master_driver_sequence_item_h5.rresp,axi_master_monitor_sequence_item_h5.rresp), UVM_HIGH);
    cmp_verified_rresp_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_rresp from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_rresp_NOT_MATCHED", $sformatf("Driver rresp = %0p and monitor rresp = %0p",axi_master_driver_sequence_item_h5.rresp,axi_master_monitor_sequence_item_h5.rresp), UVM_HIGH);
  end

  if(axi_master_driver_sequence_item_h5.ruser == axi_master_monitor_sequence_item_h5.ruser)begin
    `uvm_info(get_type_name(),$sformatf("axi_ruser from driver and monitor is equal"),UVM_HIGH);
    `uvm_info("SB_ruser_MATCHED", $sformatf("Driver ruser = %0p and monitor ruser = %0p",axi_master_driver_sequence_item_h5.ruser,axi_master_monitor_sequence_item_h5.ruser), UVM_HIGH);
    cmp_verified_ruser_count++;
  end
  else begin
    `uvm_info(get_type_name(),$sformatf("axi_ruser from driver and monitor is  not equal"),UVM_HIGH);
    `uvm_info("SB_ruser_NOT_MATCHED", $sformatf("Driver ruser = %0p and monitor ruser = %0p",axi_master_driver_sequence_item_h5.ruser,axi_master_monitor_sequence_item_h5.ruser), UVM_HIGH);
  end

endtask : axi_read_data_comparision

//--------------------------------------------------------------------------------------------
// Function: check_phase
//
//
// Display the result of simulation
//
//--------------------------------------------------------------------------------------------
function void axi_master_scoreboard::check_phase(uvm_phase phase);
  super.check_phase(phase);

  `uvm_info(get_type_name(),$sformatf("--\n----------------------------------------------SCOREBOARD CHECK PHASE---------------------------------------"),UVM_HIGH) 
  
  `uvm_info (get_type_name(),$sformatf(" Scoreboard Check Phase is starting"),UVM_HIGH); 
  
  //--------------------------------------------------------------------------------------------
  // 1.Check if the comparisions counter is NON-zero
  //   A non-zero value indicates that the comparisions never happened and throw error
  // 2.Initial count of the failed count is zero
  //   If the failed count is more than 0 it means comparision is failed and gives error  
  //--------------------------------------------------------------------------------------------

  //-------------------------------------------------------
  // Write_Address_Channel comparision
  //-------------------------------------------------------
    if ((cmp_verified_awid_count != 0) && (cmp_failed_awid_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("awid count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_awid_count :%0d",
                                              cmp_verified_awid_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_awid_count : %0d", 
                                              cmp_failed_awid_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("awid count comparisions are failed"));
    end

    if ((cmp_verified_awaddr_count != 0) && (cmp_failed_awaddr_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("awaddr count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_awaddr_count :%0d",
                                              cmp_verified_awaddr_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_awaddr_count : %0d", 
                                              cmp_failed_awaddr_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("awaddr count comparisions are failed"));
    end

    if ((cmp_verified_awsize_count != 0) && (cmp_failed_awsize_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("awsize count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_awsize_count :%0d",
                                              cmp_verified_awsize_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_awsize_count : %0d", 
                                              cmp_failed_awsize_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("awsize count comparisions are failed"));
    end

    if ((cmp_verified_awlen_count != 0) && (cmp_failed_awlen_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("awlen count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_awlen_count :%0d",
                                              cmp_verified_awlen_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_awlen_count : %0d", 
                                              cmp_failed_awlen_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("awlen count comparisions are failed"));
    end
    
    if ((cmp_verified_awburst_count != 0) && (cmp_failed_awburst_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("awburst count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_awburst_count :%0d",
                                              cmp_verified_awburst_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_awburst_count : %0d", 
                                              cmp_failed_awburst_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("awburst count comparisions are failed"));
    end
    
    if ((cmp_verified_awcache_count != 0) && (cmp_failed_awcache_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("awcache count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_awcache_count :%0d",
                                              cmp_verified_awcache_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_awcache_count : %0d", 
                                              cmp_failed_awcache_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("awcache count comparisions are failed"));
    end
    
    if ((cmp_verified_awlock_count != 0) && (cmp_failed_awlock_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("awlock count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_awlock_count :%0d",
                                              cmp_verified_awlock_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_awlock_count : %0d", 
                                              cmp_failed_awlock_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("awlock count comparisions are failed"));
    end
    
    if ((cmp_verified_awprot_count != 0) && (cmp_failed_awprot_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("awprot count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_awprot_count :%0d",
                                              cmp_verified_awprot_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_awprot_count : %0d", 
                                              cmp_failed_awprot_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("awprot count comparisions are failed"));
    end
    
    //-------------------------------------------------------
    // Write_Data_Channel comparision
    //-------------------------------------------------------
    
    if ((cmp_verified_wdata_count != 0) && (cmp_failed_wdata_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("wdata count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_wdata_count :%0d",
                                              cmp_verified_wdata_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_wdata_count : %0d", 
                                              cmp_failed_wdata_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("wdata count comparisions are failed"));
    end 


    if ((cmp_verified_wstrb_count != 0) && (cmp_failed_wstrb_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("wstrb count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_wstrb_count :%0d",
                                              cmp_verified_wstrb_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_wstrb_count : %0d", 
                                              cmp_failed_wstrb_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("wstrb count comparisions are failed"));
    end 


    if ((cmp_verified_wuser_count != 0) && (cmp_failed_wuser_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("wuser count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_wuser_count :%0d",
                                              cmp_verified_wuser_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_wuser_count : %0d", 
                                              cmp_failed_wuser_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("wuser count comparisions are failed"));
    end 

    //-------------------------------------------------------
    // Write_Response_Channel comparision
    //-------------------------------------------------------


    if ((cmp_verified_bid_count != 0) && (cmp_failed_bid_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("bid count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_bid_count :%0d",
                                              cmp_verified_bid_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_bid_count : %0d", 
                                              cmp_failed_bid_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("bid count comparisions are failed"));
    end 


    if ((cmp_verified_bresp_count != 0) && (cmp_failed_bresp_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("bresp count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_bresp_count :%0d",
                                              cmp_verified_bresp_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_bresp_count : %0d", 
                                              cmp_failed_bresp_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("bresp count comparisions are failed"));
    end 


    if ((cmp_verified_buser_count != 0) && (cmp_failed_buser_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("buser count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_buser_count :%0d",
                                              cmp_verified_buser_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_buser_count : %0d", 
                                              cmp_failed_buser_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("buser count comparisions are failed"));
    end 
  

  //-------------------------------------------------------
  // Read_Address_Channel comparision
  //-------------------------------------------------------
    if ((cmp_verified_arid_count != 0) && (cmp_failed_arid_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("arid count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_arid_count :%0d",
                                              cmp_verified_arid_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_arid_count : %0d", 
                                              cmp_failed_arid_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("arid count comparisions are failed"));
    end

    if ((cmp_verified_araddr_count != 0) && (cmp_failed_araddr_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("araddr count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_araddr_count :%0d",
                                              cmp_verified_araddr_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_araddr_count : %0d", 
                                              cmp_failed_araddr_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("araddr count comparisions are failed"));
    end

    if ((cmp_verified_arsize_count != 0) && (cmp_failed_arsize_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("arsize count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_arsize_count :%0d",
                                              cmp_verified_arsize_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_arsize_count : %0d", 
                                              cmp_failed_arsize_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("arsize count comparisions are failed"));
    end

    if ((cmp_verified_arlen_count != 0) && (cmp_failed_arlen_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("arlen count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_arlen_count :%0d",
                                              cmp_verified_arlen_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_arlen_count : %0d", 
                                              cmp_failed_arlen_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("arlen count comparisions are failed"));
    end
    
    if ((cmp_verified_arburst_count != 0) && (cmp_failed_arburst_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("arburst count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_arburst_count :%0d",
                                              cmp_verified_arburst_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_arburst_count : %0d", 
                                              cmp_failed_arburst_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("arburst count comparisions are failed"));
    end
    
    if ((cmp_verified_arcache_count != 0) && (cmp_failed_arcache_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("arcache count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_arcache_count :%0d",
                                              cmp_verified_arcache_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_arcache_count : %0d", 
                                              cmp_failed_arcache_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("arcache count comparisions are failed"));
    end
    
    if ((cmp_verified_arlock_count != 0) && (cmp_failed_arlock_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("arlock count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_arlock_count :%0d",
                                              cmp_verified_arlock_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_arlock_count : %0d", 
                                              cmp_failed_arlock_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("arlock count comparisions are failed"));
    end
    
    if ((cmp_verified_arprot_count != 0) && (cmp_failed_arprot_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("arprot count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_arprot_count :%0d",
                                              cmp_verified_arprot_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_arprot_count : %0d", 
                                              cmp_failed_arprot_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("arprot count comparisions are failed"));
    end
 
    if ((cmp_verified_arregion_count != 0) && (cmp_failed_arregion_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("arregion count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_arregion_count :%0d",
                                              cmp_verified_arregion_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_arregion_count : %0d", 
                                              cmp_failed_arregion_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("arregion count comparisions are failed"));
    end

    if ((cmp_verified_arqos_count != 0) && (cmp_failed_arqos_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("arqos count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_arqos_count :%0d",
                                              cmp_verified_arqos_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_arqos_count : %0d", 
                                              cmp_failed_arqos_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("arqos count comparisions are failed"));
    end 

    //-------------------------------------------------------
    // Read_Data_Channel comparision
    //-------------------------------------------------------
    if ((cmp_verified_rid_count != 0) && (cmp_failed_rid_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("rid count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_rid_count :%0d",
                                              cmp_verified_rid_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_rid_count : %0d", 
                                              cmp_failed_rid_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("rid count comparisions are failed"));
    end

     if ((cmp_verified_rdata_count != 0) && (cmp_failed_rdata_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("rdata count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_rdata_count :%0d",
                                              cmp_verified_rdata_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_rdata_count : %0d", 
                                              cmp_failed_rdata_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("rdata count comparisions are failed"));
    end


     if ((cmp_verified_rresp_count != 0) && (cmp_failed_rresp_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("rresp count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_rresp_count :%0d",
                                              cmp_verified_rresp_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_rresp_count : %0d", 
                                              cmp_failed_rresp_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("rresp count comparisions are failed"));
    end

     if ((cmp_verified_ruser_count != 0) && (cmp_failed_ruser_count == 0)) begin
	    `uvm_info (get_type_name(), $sformatf ("ruser count comparisions are successful"),UVM_HIGH);
    end
    else begin
      `uvm_info (get_type_name(), $sformatf ("cmp_verified_ruser_count :%0d",
                                              cmp_verified_ruser_count),UVM_HIGH);
	    `uvm_info (get_type_name(), $sformatf ("cmp_failed_ruser_count : %0d", 
                                              cmp_failed_ruser_count),UVM_HIGH);
      `uvm_error (get_type_name(), $sformatf ("ruser count comparisions are failed"));
    end
  


  //--------------------------------------------------------------------------------------------
  // 2.Check if driver packets received are same as monitor packets received
  //   To Make sure that we have equal number of master and monitor packets
  //--------------------------------------------------------------------------------------------
  
  //--------------------------------------------------------------------------------------------
  // 3.Analysis fifos must be zero - This will indicate that all the packets have been compared
  //   This is to make sure that we have taken all packets from both FIFOs and made the comparisions
  //--------------------------------------------------------------------------------------------
  if (axi_master_driver_write_address_analysis_fifo.size() == 0) begin
    `uvm_info (get_type_name(), $sformatf ("axi Master write address analysis FIFO is empty"),UVM_HIGH);
  end
  else begin
    `uvm_info (get_type_name(), $sformatf ("axi_master_driver_write_address_analysis_fifo:%0d",axi_master_write_address_analysis_fifo.size() ),UVM_HIGH);
    `uvm_error (get_type_name(), $sformatf ("axi Master write address analysis FIFO is not empty"));
  end

  if (axi_master_driver_write_data_analysis_fifo.size() == 0) begin
    `uvm_info (get_type_name(), $sformatf ("axi Master write data analysis FIFO is empty"),UVM_HIGH);
  end
  else begin
    `uvm_info (get_type_name(), $sformatf ("axi_master_driver_write_data_analysis_fifo:%0d",axi_master_write_data_analysis_fifo.size() ),UVM_HIGH);
    `uvm_error (get_type_name(), $sformatf ("axi Master write data analysis FIFO is not empty"));
  end

  if (axi_master_driver_write_response_analysis_fifo.size() == 0) begin
    `uvm_info (get_type_name(), $sformatf ("axi Master write response analysis FIFO is empty"),UVM_HIGH);
  end
  else begin
    `uvm_info (get_type_name(), $sformatf ("axi_master_driver_write_response_analysis_fifo:%0d",axi_master_write_response_analysis_fifo.size() ),UVM_HIGH);
    `uvm_error (get_type_name(), $sformatf ("axi Master write response analysis FIFO is not empty"));
  end
 
  if (axi_master_driver_read_address_analysis_fifo.size() == 0) begin
    `uvm_info (get_type_name(), $sformatf ("axi Master read address analysis FIFO is empty"),UVM_HIGH);
  end
  else begin
    `uvm_info (get_type_name(), $sformatf ("axi_master_driver_read_address_analysis_fifo:%0d",axi_master_read_address_analysis_fifo.size() ),UVM_HIGH);
    `uvm_error (get_type_name(), $sformatf ("axi Master read address analysis FIFO is not empty"));
  end

  if (axi_master_driver_read_data_analysis_fifo.size() == 0) begin
    `uvm_info (get_type_name(), $sformatf ("axi Master read data analysis FIFO is empty"),UVM_HIGH);
  end
  else begin
    `uvm_info (get_type_name(), $sformatf ("axi_master_driver_read_data_analysis_fifo:%0d",axi_master_read_data_analysis_fifo.size() ),UVM_HIGH);
    `uvm_error (get_type_name(), $sformatf ("axi Master read data analysis FIFO is not empty"));
  end

  if (axi_monitor_write_address_analysis_fifo.size() == 0) begin
    `uvm_info (get_type_name(), $sformatf ("axi monitor write address analysis FIFO is empty"),UVM_HIGH);
  end
  else begin
    `uvm_info (get_type_name(), $sformatf ("axi_monitor_write_address_analysis_fifo:%0d",axi_master_driver_monitor_write_address_analysis_fifo.size() ),UVM_HIGH);
    `uvm_error (get_type_name(), $sformatf ("axi monitor write address analysis FIFO is not empty"));
  end

  if (axi_monitor_write_data_analysis_fifo.size() == 0) begin
    `uvm_info (get_type_name(), $sformatf ("axi monitor write data analysis FIFO is empty"),UVM_HIGH);
  end
  else begin
    `uvm_info (get_type_name(), $sformatf ("axi_monitor_write_data_analysis_fifo:%0d",axi_master_driver_monitor_write_data_analysis_fifo.size() ),UVM_HIGH);
    `uvm_error (get_type_name(), $sformatf ("axi monitor write data analysis FIFO is not empty"));
  end

  if (axi_monitor_write_response_analysis_fifo.size() == 0) begin
    `uvm_info (get_type_name(), $sformatf ("axi monitor write response analysis FIFO is empty"),UVM_HIGH);
  end
  else begin
    `uvm_info (get_type_name(), $sformatf ("axi_monitor_write_response_analysis_fifo:%0d",axi_master_driver_monitor_write_response_analysis_fifo.size() ),UVM_HIGH);
    `uvm_error (get_type_name(), $sformatf ("axi monitor write response analysis FIFO is not empty"));
  end
 
  if (axi_monitor_read_address_analysis_fifo.size() == 0) begin
    `uvm_info (get_type_name(), $sformatf ("axi monitor read address analysis FIFO is empty"),UVM_HIGH);
  end
  else begin
    `uvm_info (get_type_name(), $sformatf ("axi_monitor_read_address_analysis_fifo:%0d",axi_master_driver_monitor_read_address_analysis_fifo.size() ),UVM_HIGH);
    `uvm_error (get_type_name(), $sformatf ("axi monitor read address analysis FIFO is not empty"));
  end

  if (axi_monitor_read_data_analysis_fifo.size() == 0) begin
    `uvm_info (get_type_name(), $sformatf ("axi monitor read data analysis FIFO is empty"),UVM_HIGH);
  end
  else begin
    `uvm_info (get_type_name(), $sformatf ("axi_monitor_read_data_analysis_fifo:%0d",axi_master_driver_monitor_read_data_analysis_fifo.size() ),UVM_HIGH);
    `uvm_error (get_type_name(), $sformatf ("axi monitor read data analysis FIFO is not empty"));
  end

  `uvm_info(get_type_name(),$sformatf("--\n----------------------------------------------END OF SCOREBOARD CHECK PHASE---------------------------------------"),UVM_HIGH);

endfunction : check_phase
`endif
