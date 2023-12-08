parameter OKAY=0;
parameter SLVERR=1;

// AXI MASTER SCOREBOARD IS THE USER DEFINED CLASS WHICH EXTENDS FROM UVM SCOREBOARD (PREDEFINED SCOREBOARD CLASS)
axi4_master_scoreboard extends uvm_scoreboard;

// FACTORY REGISTRATION
// REGISTERING THE USER DEFINED CLASS IN THE LUT
`uvm_component_utils (axi4_master_scoreboard)

// PORT DECLARATIONS FOR CONNECTION BETWEEN MONITOR AND SCOREBOARD
uvm_analysis_imp#(req, axi4_master_scoreboard)axi_seq_item_imp;

// DECLARING EXTERNAL FUNCTION "NEW" (CLASS CONSTRUCTOR)
extern function new(string name = " axi4_master_scoreboard ", uvm_component parent = null);

// DECLARING EXTERNAL FUNCTION WRITE
extern virtual function void write(input axi_master_sequence_item req);

// DEFINING THE CLASS CONSTRUCTOR OUTSIDE THE CLASS USING SCOPE RESOLUTION OPERATOR

function axi4_master_driver::new(string name = " axi4_master_scoreboard ", uvm_component parent = null);
super.new(name, parent);
axi_seq_item_imp = new("axi_seq_item_imp",this);

endfunction: new

//DECLARE ASSOCIATIVE ARRAY OF INDEX INT TYPE
bit[127:0] write_success[int];
bit[127:0] read_success[int];
bit[127:0] write_fail[int];
bit[127:0] read_fail[int];

int temp_write[$];
int temp_read[$];
int burst_size;

function axi_master_scoreboard::write(input axi_master_sequence_item req);
//WRITE
if(s_axi_awburst == 0) begin
  if(bresp == OKAY) begin
    write_success[awaddr] = wdata[awlen];
  end
  else if(bresp == SLVERR) begin
	write_fail[awaddr] = wdata[awlen];
   end
end
else if(s_axi_awburst == 1) begin
  temp_write.push(awaddr);
  for(int i = 1; i <= awlen; i++) begin
    burst_size = 2**awsize;
    temp_write.push(awaddr + (temp_write.size())*burst_size);
   end
   if(bresp == OKAY) begin
	for(int i = 0; i <= awlen; i++) begin
	  write_success[temp_write.pop_front()] = wdata[i];
	end
   else if(bresp == SLVERR) begin
	for(int i = 0; i <= awlen; i++) begin
	  write_fail[temp_write.pop_front()] = wdata[i];
	end
   end
end

//READ
if(s_axi_arburst == 0) begin
  if(rresp == OKAY) begin
    read_success[araddr] = rddata[arlen];
  end
  else if(rresp == SLVERR) begin
	read_fail[araddr] = rddata[arlen];
   end
end
else if(s_axi_arburst == 1) begin
  temp_read.push(araddr);
  for(int i = 1; i <= arlen; i++) begin
    burst_size = 2**arsize;
    temp_read.push(araddr + (temp_read.size())*burst_size);
   end
   if(rresp == OKAY) begin
	for(int i = 0; i <= arlen; i++) begin
	  read_success[temp_read.pop_front()] = rddata[i];
	end
   else if(rresp == SLVERR) begin
	read_fail[temp_read.pop_front()] = rddata[i];
   end
end
endfunction


    
  









