#!/usr/bin/python3
def write2812(spi, color) :
    tx=[]
    for rgb in color:
        for byte in [rgb[1],rgb[0],rgb[2]]:
            for ibit in range(7,-1,-1):
                tx.append( 0x80 if (byte>>ibit) &1 == 0 else 0xF8 )
    spi.xfer(tx, int(8/1.25e-6))

import spidev
spi = spidev.SpiDev()
spi.open(0,0)
nLED=8
write2812(spi, [[0,5,100]]*nLED)
