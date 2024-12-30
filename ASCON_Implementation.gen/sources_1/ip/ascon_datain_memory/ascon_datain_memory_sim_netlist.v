// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Fri Sep 22 11:00:06 2023
// Host        : GCP-E101-26 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/eleves/Documents/Vivado_Design_Suite/ASCON_Implementation/ASCON_Implementation.gen/sources_1/ip/ascon_datain_memory/ascon_datain_memory_sim_netlist.v
// Design      : ascon_datain_memory
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ascon_datain_memory,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module ascon_datain_memory
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [2:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [63:0]douta;

  wire [2:0]addra;
  wire clka;
  wire [63:0]douta;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [63:0]NLW_U0_doutb_UNCONNECTED;
  wire [2:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [2:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "3" *) 
  (* C_ADDRB_WIDTH = "3" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     6.370399 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "ascon_datain_memory.mem" *) 
  (* C_INIT_FILE_NAME = "ascon_datain_memory.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "5" *) 
  (* C_READ_DEPTH_B = "5" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "64" *) 
  (* C_READ_WIDTH_B = "64" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "5" *) 
  (* C_WRITE_DEPTH_B = "5" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "64" *) 
  (* C_WRITE_WIDTH_B = "64" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  ascon_datain_memory_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[63:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[2:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[2:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 29088)
`pragma protect data_block
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
mBr0CJUJ6wdioDk3Gmstia3n
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
