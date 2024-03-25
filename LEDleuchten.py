#!/usr/bin/env python3

import spidev
spi = spidev.SpiDev()
spi.open(0,0)

g = 0b00000000
r = 0b00000001
b = 0b00010001
x = []

for v in range(0, 8):
	if (g >> v & 1)  == 1:
		x.append(0xF8)

	else:
		x.append(0x80)
print(x)

for v in range(0, 8):
	if (r >> v & 1)  == 1:

		x.append(0xF8)

	else:
		x.append(0x80)
print(x)
for v in range(0, 8):
	if (b >> v & 1)  == 1:
		x.append(0xF8)

	else:
		x.append(0x80)
for v in range(0, 8):
        if (g >> v & 1)  == 1:
                x.append(0xF8)

        else:
                x.append(0x80)
print(x)

for v in range(0, 8):
        if (r >> v & 1)  == 1:

                x.append(0xF8)

        else:
                x.append(0x80)
print(x)
for v in range(0, 8):
        if (b >> v & 1)  == 1:
                x.append(0xF8)

        else:
                x.append(0x80)


print(x)
spi.xfer(x, 6400000)





spi.close()
