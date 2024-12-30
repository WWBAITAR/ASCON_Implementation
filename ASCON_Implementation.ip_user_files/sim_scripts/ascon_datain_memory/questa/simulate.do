onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib ascon_datain_memory_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {ascon_datain_memory.udo}

run 1000ns

quit -force
