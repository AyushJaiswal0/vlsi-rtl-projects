# 4-Bit Up/Down Counter (Verilog RTL)

## 📌 Overview

This project implements a 4-bit up/down counter using synthesizable Verilog RTL.

The counter supports:
- Asynchronous reset (active high)
- Enable control
- Direction control (up/down)
- Wrap-around behavior

The design was verified using ModelSim with a dedicated testbench.

---

## 🧠 Design Description

The counter is implemented using a sequential `always` block triggered on:

- Positive edge of clock
- Positive edge of asynchronous reset

On reset assertion:
q <= 4'b0000;


When enabled:
- If `dir = 1` → counter increments
- If `dir = 0` → counter decrements

Since the counter is 4-bit wide, it naturally wraps:
- `1111 + 1 → 0000`
- `0000 - 1 → 1111`

Non-blocking assignments (`<=`) are used to ensure proper sequential behavior.

---

## 📥 Inputs

| Signal | Description |
|--------|-------------|
| clk    | Clock input |
| arst   | Asynchronous reset (active high) |
| en     | Enable signal |
| dir    | Direction control (1 = up, 0 = down) |

---

## 📤 Output

| Signal | Description |
|--------|-------------|
| q[3:0] | 4-bit counter output |

---

## 🧪 Testbench

The testbench verifies:
- Reset initialization
- Counting up
- Counting down
- Enable control behavior
- Wrap-around functionality

Simulation time unit:
`timescale 1ns/1ps

---

## 📊 Simulation Result

<img width="1513" height="692" alt="waveform" src="https://github.com/user-attachments/assets/a74bff0f-1775-42ca-b047-74fbf069bed7" />


Example waveform demonstrates:
- Reset to 0000
- Up-counting
- Down-counting
- Proper wrap-around

---

## 🛠 Tools Used

- Verilog HDL
- ModelSim (Intel FPGA Edition)

---

## 🔎 Key Learning Outcomes

- Understanding of sequential logic in RTL
- Proper use of non-blocking assignments
- Reset handling in simulation
- Debugging unknown (`X`) states
- Time-scale awareness in simulation
