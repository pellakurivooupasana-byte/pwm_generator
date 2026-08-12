module tb_PWM_Generator;

    // Inputs
    reg clk;
    reg increase_duty;
    reg decrease_duty;

    // Output
    wire PWM_OUT;

    // DUT Instantiation
    PWM_Generator PWM_Generator_Unit (
        .clk(clk),
        .increase_duty(increase_duty),
        .decrease_duty(decrease_duty),
        .PWM_OUT(PWM_OUT)
    );

    // 100 MHz Clock (Period = 10 ns)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin

        increase_duty = 0;
        decrease_duty = 0;

        #100;

        // Increase duty cycle 3 times
        increase_duty = 1;
        #100;
        increase_duty = 0;

        #100;

        increase_duty = 1;
        #100;
        increase_duty = 0;

        #100;

        increase_duty = 1;
        #100;
        increase_duty = 0;

        #100;

        // Decrease duty cycle 3 times
        decrease_duty = 1;
        #100;
        decrease_duty = 0;

        #100;

        decrease_duty = 1;
        #100;
        decrease_duty = 0;

        #100;

        decrease_duty = 1;
        #100;
        decrease_duty = 0;

        #200;

        $finish;

    end

endmodule
