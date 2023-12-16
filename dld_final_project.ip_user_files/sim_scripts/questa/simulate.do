onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib Top_opt

do {wave.do}

view wave
view structure
view signals

do {Top.udo}

run -all

quit -force
