# 101 Sequence Detector (Overlapping)

## 📌 Overview
This project implements an overlapping `101` sequence detector using a Moore Finite State Machine (FSM) written in Verilog HDL.

The design uses a clean 3-block FSM structure with fully registered state and output logic.

---

## 🧠 Design Highlights

- 3-block FSM implementation (state register, next-state logic, output logic)
- Registered state transitions using non-blocking assignments
- Registered output based on `next_state`
- Asynchronous active-high reset
- Supports overlapping sequence detection

---

## 🔁 State Description

| State | Description |
|-------|------------|
| S0 | Idle state |
| S1 | Detected `1` |
| S2 | Detected `10` |
| S3 | Detected `101` (Output asserted) |

The output is asserted for one clock cycle when the sequence `101` is detected.

---

## 📊 Example Behavior

For input: 1111010111

The output generates two single-cycle pulses corresponding to the two overlapping occurrences of `101`.

---

## 🛠 Tools Used

- Verilog HDL
- ModelSim (Intel FPGA Edition)

---

## 📷 Simulation Result

<img width="1632" height="750" alt="waveform" src="https://github.com/user-attachments/assets/1eaa53b4-7ad2-437f-9ce4-5323b11c4eeb" />


---

## 🎯 Key Learnings

- FSM implementation using structured RTL coding style
- Proper use of blocking vs non-blocking assignments
- Understanding of Verilog event scheduling
- Importance of synchronous testbench stimulus
- Clock-aligned sequence detection
