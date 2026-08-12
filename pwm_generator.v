module PWM_Generator (
    input  clk,
    input  increase_duty,
    input  decrease_duty,
    output PWM_OUT
);

    wire slow_clk_enable;

    reg [30:0] counter_debounce = 0;

    wire tmp1, tmp2, duty_inc;
    wire tmp3, tmp4, duty_dec;

    reg [3:0] counter_PWM = 0;
    reg [3:0] DUTY_CYCLE = 5;

    // Debounce clock enable generation
    always @(posedge clk)
    begin
        counter_debounce <= counter_debounce + 1;

        if (counter_debounce >= 1)
            counter_debounce <= 0;
    end

    assign slow_clk_enable = (counter_debounce == 1);

    // Debounce increasing button
    DFF_PWM PWM_DFF1 (
        .clk(clk),
        .en(slow_clk_enable),
        .D(increase_duty),
        .Q(tmp1)
    );

    DFF_PWM PWM_DFF2 (
        .clk(clk),
        .en(slow_clk_enable),
        .D(tmp1),
        .Q(tmp2)
    );

    assign duty_inc = tmp1 & (~tmp2) & slow_clk_enable;

    // Debounce decreasing button
    DFF_PWM PWM_DFF3 (
        .clk(clk),
        .en(slow_clk_enable),
        .D(decrease_duty),
        .Q(tmp3)
    );

    DFF_PWM PWM_DFF4 (
        .clk(clk),
        .en(slow_clk_enable),
        .D(tmp3),
        .Q(tmp4)
    );

    assign duty_dec = tmp3 & (~tmp4) & slow_clk_enable;

    // Duty cycle control
    always @(posedge clk)
    begin
        if (duty_inc && DUTY_CYCLE <= 9)
            DUTY_CYCLE <= DUTY_CYCLE + 1;
        else if (duty_dec && DUTY_CYCLE >= 1)
            DUTY_CYCLE <= DUTY_CYCLE - 1;
    end

    // PWM counter
    always @(posedge clk)
    begin
        counter_PWM <= counter_PWM + 1;

        if (counter_PWM >= 9)
            counter_PWM <= 0;
    end

    // PWM output
    assign PWM_OUT = (counter_PWM < DUTY_CYCLE);

endmodule


module DFF_PWM (
    input  clk,
    input  en,
    input  D,
    output reg Q
);

    always @(posedge clk)
    begin
        if (en)
            Q <= D;
    end

endmodule
