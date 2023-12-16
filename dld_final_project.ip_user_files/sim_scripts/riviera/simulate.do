onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+Top -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.Top xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {Top.udo}

run -all

endsim

quit -force
