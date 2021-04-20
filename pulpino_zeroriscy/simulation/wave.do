onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /pulp_soc_tb/programmer_spi_scs
add wave -noupdate -radix hexadecimal /pulp_soc_tb/programmer_spi_sck
add wave -noupdate -radix hexadecimal /pulp_soc_tb/programmer_spi_s2m
add wave -noupdate -radix hexadecimal /pulp_soc_tb/programmer_spi_m2s
add wave -noupdate -radix hexadecimal /pulp_soc_tb/programmer_i/addr_target
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/pc_if
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/gpio
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/sp_ram_wrap_i/state
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/if_stage_i/rst_n
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/if_stage_i/pc_if_o
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/if_stage_i/pc_id_o
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/if_stage_i/instr_rdata_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/if_stage_i/instr_addr_o
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/sp_ram_wrap_i/error_flag
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_ram_mux_i/port1_we_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_ram_mux_i/port1_wdata_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_ram_mux_i/port1_req_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_ram_mux_i/port1_rdata_o
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_ram_mux_i/port1_addr_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_ram_mux_i/port0_we_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_ram_mux_i/port0_wdata_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_ram_mux_i/port0_req_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_ram_mux_i/port0_rdata_o
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_ram_mux_i/port0_addr_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_ram_mux_i/state
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/sp_ram_wrap_i/we_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/sp_ram_wrap_i/wdata_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/sp_ram_wrap_i/stat_done_o
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/sp_ram_wrap_i/rvalid_o
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/sp_ram_wrap_i/rst_n
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/sp_ram_wrap_i/rdata_o
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/sp_ram_wrap_i/en_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/sp_ram_wrap_i/clk
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/sp_ram_wrap_i/ck_o
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/sp_ram_wrap_i/bypass_en_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/sp_ram_wrap_i/be_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/sp_ram_wrap_i/addr_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/we_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/wdata_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/rvalid_o
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/rst_n
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/rdata_o
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/ram_stat_done_o
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/en_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/clk
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/ck_o
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/bypass_en_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/be_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/instr_mem/addr_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/if_stage_i/prefetch_buffer_i/fifo_ready
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/if_stage_i/prefetch_buffer_i/branch_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/if_stage_i/prefetch_buffer_i/fifo_i/valid_Q
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/if_stage_i/fetch_valid
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/if_stage_i/fetch_ready
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/if_stage_i/fetch_rdata
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/if_stage_i/fetch_addr
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/if_stage_i/req_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/if_stage_i/if_valid_o
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/if_stage_i/if_ready
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/if_stage_i/halt_if_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/if_stage_i/valid
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/if_stage_i/id_ready_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/id_stage_i/load_stall
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/id_stage_i/id_wb_fsm_cs
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/id_stage_i/data_req_id
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/id_stage_i/ex_ready_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/ex_block_i/multdiv_ready
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/ex_block_i/multdiv_en
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/ex_block_i/lsu_ready_ex_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/CORE/RISCV_CORE/ex_block_i/lsu_en_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/core_data_rvalid
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/core_axi_rvalid
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/data_ram_mux_i/state
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/data_ram_mux_i/ram_rvalid_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/data_ram_mux_i/port1_rvalid_o
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/data_ram_mux_i/port1_req_i
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/data_ram_mux_i/port1_rdata_o
add wave -noupdate -radix hexadecimal /pulp_soc_tb/soc/pulpino_i/core_region_i/data_ram_mux_i/port1_addr_i
add wave -noupdate /pulp_soc_tb/soc/pulpino_i/core_region_i/data_mem/select
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5297809323 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 275
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ms
update
WaveRestoreZoom {5297783845 ps} {5297825694 ps}
