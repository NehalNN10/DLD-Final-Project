onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib VGA_Clock_opt

do {wave.do}

view wave
view structure
view signals

do {VGA_Clock.udo}

run -all

quit -force
