AES-128 Encryption & Decryption on ZCU104
Overview
This project implements an AES-128 encryption and decryption core in Verilog, packaged as a custom Vivado IP. The design was integrated into a block design on the Xilinx ZCU104 board and verified in hardware.

Features
AES-128 algorithm with 128-bit key

Supports both encryption and decryption

Packaged as reusable Vivado IP (aes_ip_v1_0)

Integrated into a Zynq UltraScale+ MPSoC block design

Tested with Vitis for functional verification.

How to Rebuild the Project in Vivado
Open Vivado (tested on version 2022.2).

Create a new project targeting the ZCU104 board.

Add the ip_repo/ folder to the IP repository path (Settings → IP → Repository).

Add the .bd file into the project sources.

Generate bitstream and export hardware with .xsa for Vitis.
