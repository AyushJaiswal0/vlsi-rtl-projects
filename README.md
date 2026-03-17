# VLSI RTL Projects

This repository documents my RTL design implementations using **Verilog HDL**.  
Each project includes synthesizable RTL code, a dedicated testbench, and simulation results verified in **ModelSim**.

The focus of this repository is to strengthen my understanding of:

* Register Transfer Level (RTL) design  
* Finite State Machine (FSM) modeling  
* Sequential and combinational logic  
* Communication protocol design  
* Testbench development  
* Waveform-based debugging  

---

## 📂 Repository Structure
    vlsi-rtl-projects/
    │
    ├── counter/
    │ ├── rtl/
    │ ├── tb/
    │ ├── sim/
    │ └── README.md
    │
    ├── sequence-detector-101/
    │ ├── rtl/
    │ ├── tb/
    │ ├── sim/
    │ └── README.md
    │
    ├── traffic-light-controller/
    │ ├── rtl/
    │ ├── tb/
    │ ├── sim/
    │ └── README.md
    │
    ├── uart/
    │ ├── rtl/
    │ ├── tb/
    │ ├── sim/
    │ └── README.md
    │
    ├── synchronous-fifo/
    │ ├── rtl/
    │ ├── tb/
    │ ├── sim/
    │ └── README.md
    │
    └── README.md

---

# 🔹 Completed Projects

## 1️⃣ 4-Bit Up/Down Counter

* Asynchronous reset (active high)  
* Enable control  
* Direction control (up/down)  
* Wrap-around behavior  
* Fully synthesizable RTL  
* Separate testbench included  

---

## 2️⃣ 101 Sequence Detector (Overlapping)

* Moore FSM implementation (3-block structure)  
* Registered state transitions using non-blocking assignments  
* Registered output based on `next_state`  
* Asynchronous active-high reset  
* Supports overlapping sequence detection  
* Fully synthesizable RTL  
* Dedicated synchronous testbench  

---

## 3️⃣ Traffic Light Controller (Moore FSM)

* Moore FSM implementation controlling a two-road intersection  
* 4-state FSM design with 2-bit state encoding  
* Registered state transitions  
* Registered traffic light outputs  
* Sequential traffic flow control between two roads  
* Asynchronous active-high reset  
* Fully synthesizable RTL  
* Dedicated simulation testbench  

Traffic sequence implemented:

    Road B Green → Road B Yellow → Road A Green → Road A Yellow → repeat

---

## 4️⃣ UART Transmitter and Receiver

Implementation of a **Universal Asynchronous Receiver Transmitter (UART)** communication module.

The project includes both **UART Transmitter (TX)** and **UART Receiver (RX)** designs.

### UART Transmitter

* FSM-based transmitter architecture  
* Parallel-to-serial data conversion  
* Baud rate generator for transmission timing  
* Shift register based serialization  
* Start bit, 8 data bits (LSB first), and stop bit transmission  
* `tx_busy` signal indicating active transmission  
* Fully synthesizable RTL with dedicated testbench  

### UART Receiver

* 16× oversampling based receiver architecture  
* Start bit edge detection  
* Mid-bit sampling for accurate reception  
* 2-Flip-Flop synchronizer for metastability protection  
* Serial-to-parallel conversion using shift register  
* Stop bit validation  
* `data_valid` signal indicating successful data reception  
* Fully synthesizable RTL with dedicated testbench  

---

## 5️⃣ Synchronous FIFO

Implementation of a **parameterized Synchronous FIFO (First-In First-Out)**.

The design stores data in a circular buffer and ensures correct sequential data flow.

### Features

* Parameterized **DEPTH** and **DATA_WIDTH**  
* Circular buffer implementation  
* Separate read and write pointers  
* Full and empty detection using **extra pointer bit technique**  
* Supports simultaneous read and write operations  
* Fully synthesizable RTL  

### Verification

* Task-based testbench (`write_data`, `read_data`)  
* Random stimulus generation  
* Reference queue (scoreboard) for verification  
* Automatic checking:
     data_out vs expected_data
* Timing-aware comparison using `#1` delay  
* Waveform-based validation in ModelSim  

---

## 🛠 Tools Used

* **Verilog HDL**  
* **ModelSim (Intel FPGA Edition)**  

---

## 🎯 Learning Goals

Through these projects I aim to:

* Build a strong foundation in **RTL design**  
* Understand **FSM-based hardware architectures**  
* Implement **communication protocols in hardware**  
* Improve **testbench development and verification**  
* Develop **debugging skills using simulation waveforms**  

---

## 📜 License

This repository is licensed under the **MIT License**.
