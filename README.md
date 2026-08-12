# PWM Generator

A digital **Pulse Width Modulation (PWM) Generator** designed using **Verilog HDL** and verified through simulation.

##  Project Overview

This project implements a PWM generator that produces a digital output signal with a controllable **duty cycle**. PWM is widely used in applications such as motor control, LED brightness control and power management.

The design was developed using **Verilog HDL** and its functionality was verified using a simulation testbench.

##  Working

The PWM generator uses a counter-based approach to generate the output waveform.

* The counter continuously increments with the clock.
* The counter value is compared with the selected duty-cycle value.
* The PWM output remains **HIGH** when the counter is below the duty-cycle value.
* The output becomes **LOW** when the counter exceeds the duty-cycle value.

By changing the duty-cycle value, the percentage of time the output remains HIGH can be controlled.

##  Tools & Technologies

* Verilog HDL
* ModelSim / Vivado Simulator
* RTL Design
* Digital Counters
* Pulse Width Modulation (PWM)

##  Project Files

* pwm_generator.v – Main Verilog design
* pwm_generator_tb.v – Verilog testbench
* pwm_generator_simulation.png-Simulation Waveform

##  Simulation

The design was simulated using a Verilog simulation environment to verify:

* Correct PWM waveform generation
* Different duty-cycle conditions
* Counter operation
* Reset operation
* Proper output switching

##  Expected Output

The simulation waveform shows a periodic PWM signal whose **HIGH-time changes according to the selected duty cycle**.

For example:

**25% Duty Cycle → 25% HIGH, 75% LOW**

**50% Duty Cycle → 50% HIGH, 50% LOW**

**75% Duty Cycle → 75% HIGH, 25% LOW**

## 👩‍💻 Author

**Voo Upasana**

