#
# Create work library
#
vlib work
#
# Compile sources
#
vlog  C:/Users/10128/Documents/AnlogicProjects/pulpino_zeroriscy/simulation/pulpino_zeroriscy_phy_sim.v
vlog  C:/Users/10128/Documents/AnlogicProjects/pulpino_zeroriscy/simulation/pulp_soc_tb.v
#
# Call vsim to invoke simulator
#
vsim -L D:/intelFPGA/20.1/modelsim_ase/AnLogic/EG4_ver -gui -sdftyp pulp_soc_tb/uut=C:/Users/10128/Documents/AnlogicProjects/pulpino_zeroriscy/simulation/pulpino_zeroriscy.sdf -novopt work.pulp_soc_tb
#
# Add waves
#
add wave *
#
# Run simulation
#
run 1000ns
#
# End