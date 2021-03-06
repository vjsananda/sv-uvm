`include "heartbeat.svh"

  function heartbeat::new(string name, uvm_component parent);
      super.new(name,parent);
      alive =  1'b1 ;
      pulse_interval = 1000ns ;
  endfunction
  
  function void heartbeat::build_phase( uvm_phase phase);
      super.build_phase(phase);
  endfunction

  function void heartbeat::connect_phase(uvm_phase phase) ;
      super.connect_phase(phase);
  endfunction

  task heartbeat::tick();
      alive = 1'b1 ;
  endtask // tick

  task heartbeat::main_phase(uvm_phase phase);
      phase.raise_objection(this);

      while (alive)
	begin
	   alive = 1'b0;
	   #(pulse_interval);
	end
      
     phase.drop_objection(this);       
  endtask // reset_phase
  
