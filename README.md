# cpu_risc
Verilog implementation of 16-bit RISC Processor with 4-stage pipeline

### Architecture
![block diagram](https://github.com/sarthi92/cpu_risc/blob/master/risc_design.png)

### Pipeline Register Format
![pipe format](https://github.com/sarthi92/cpu_risc/blob/master/pipeline.png)

### Pipeline Control Logic
•	Data hazard detection is done through exir, and idir instruction registers present in write-back Pipe and execute Pipe respectively.  
•	Control hazard detection is done through idir, and ifir instruction registers present in execute Pipe and decode Pipe respectively and through zero signal from the comparator.  
•	Data forwarding is done by checking values in exir, and idir instruction registers.  
•	In the case of data hazard (RAW) arising from 2 ADD/AND instructions the processor does not need to stall or hold any instruction & this case is handled through data forwarding in the controller unit.  
•	In the case of RAW hazard arising from a BEQ instruction following an R-type instruction (ADD/AND), one bubble is inserted in the execute Pipe and a corresponding hold is enforced in PC register & decode Pipe.  
•	In the case of a control hazard arising from BEQ instruction, one bubble is inserted in the decode Pipe.  
•	In the case when both control and data hazard occur in conjunction, data hazard is handled in the present clock cycle & control hazard is handled in the next clock cycle.  
