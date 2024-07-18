module mips_test;
    reg clk;
    reg reset;

    mips Mips (
        .clk(clk), 
        .reset(reset)
    );

    initial begin
        $dumpfile("mips_test.vcd");
        $dumpvars(0, clk, reset, Mips);

        // Add registers to the waveform
        for (integer i = 0; i < 8; i = i + 1)
            $dumpvars(0, Mips.Decode_Stage.Register_File.r_registers[i]);

        // Add memory to the waveform
        for (integer i = 0; i < 1024; i = i + 1)
            $dumpvars(0, Mips.Memory_Stage.Data_Memory.memory[i]);

        clk = 0;
        reset = 1;
        #10
        clk = 1;
        reset = 0;
        for (integer i = 0; i < 500; i = i + 1)
            #10 clk = ~clk;    
    end
           
endmodule
