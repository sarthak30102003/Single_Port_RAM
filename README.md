# 🧠 Single Port RAM in Verilog

A simple and parameterized **Single Port RAM** module implemented in Verilog and tested using **Vivado 2023.1**. This design supports read and write operations on the same port with edge-triggered clock control.

---

## 🔧 Features

- ✅ **Single-port** memory with read/write capability
- 🛠️ **Parameterized**:
  - `addr_width`: Address width (default 6 → 64 memory locations)
  - `data_width`: Data bus width (default 8-bit)
  - `depth`: Memory depth (default 64)
- ⏱️ **Clock-synchronous** behavior (positive edge-triggered)
- 📘 Behavioral simulation with full waveform analysis
- ✅ Fully synthesizable design

---

## 📁 File Structure
```
single-port-ram/
├── src/
│   └── single_port_ram.v
├── sim/
│   ├── tb_single_port_ram.v
│   ├── single_port_ram_waveform.png
│   ├── simplified_schematic.png    
│   └── detailed_schematic.pdf      
└── README.md
```


---

## 📷 Waveform Snapshot

![Simulation Waveform](sim/single_port_ram_waveform.png) <!-- Replace with actual path if uploading -->

---

## 🧪 How It Works

- **Write Mode**: When `we = 1`, data at input `data` is written to the address `addr` on the rising edge of `clk`.
- **Read Mode**: When `we = 0`, data from address `addr` is read into output `q`.

### Sample Waveform Explanation

| Time (ns) | we | addr | data (write) | q (read) |
|-----------|----|------|--------------|----------|
| 10        | 1  | 0x0A | 0xAA         | --       |
| 30        | 0  | 0x0A | --           | 0xAA     |

---

## ✅ Simulation Tool

- **Vivado 2023.1**
- Behavioral simulation using built-in waveform viewer

---

## 👨‍💻 Author

**Sarthak Aggarwal**  
📘 B.Tech ECE, Delhi Technological University  
🔗 [LinkedIn](https://www.linkedin.com/in/sarthak-aggarwal-486b60240/)  
📧 [sarthakaggarwal30102003@gmail.com]

---



