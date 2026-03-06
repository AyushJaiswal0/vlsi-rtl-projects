# VLSI RTL Projects

This repository documents my RTL design implementations using Verilog HDL.  
Each project includes synthesizable RTL code, a dedicated testbench, and simulation results verified in ModelSim.

The focus of this repository is to strengthen my understanding of:

- Register Transfer Level (RTL) design  
- Finite State Machine (FSM) modeling  
- Sequential and combinational logic  
- Testbench development  
- Waveform-based debugging  

---

## 📂 Repository Structure

    vlsi-rtl-projects/
        |--- 4-bit-up-down-counter/
        |   |--- rtl/
        |   |--- tb/
        |   |--- sim/
        |   |--- README.md
        |
        |--- sequence-detector-101/
        |   |--- rtl/
        |   |--- tb/
        |   |--- sim/
        |   |--- README.md
        |
        |--- README.md

---

## 🔹 Completed Projects

### 1️⃣ 4-Bit Up/Down Counter
- Asynchronous reset (active high)
- Enable control
- Direction control (up/down)
- Wrap-around behavior
- Fully synthesizable RTL
- Separate testbench included

---

### 2️⃣ 101 Sequence Detector (Overlapping)
- Moore FSM implementation (3-block structure)
- Registered state transitions using non-blocking assignments
- Registered output based on `next_state`
- Asynchronous active-high reset
- Supports overlapping sequence detection
- Fully synthesizable RTL
- Dedicated synchronous testbench

---

## 🛠 Tools Used
- Verilog HDL  
- ModelSim (Intel FPGA Edition)

---

## 📜 License
This repository is licensed under the MIT License.
