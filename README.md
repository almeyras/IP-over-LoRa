# IP over LoRa

aaaa

Collection of scripts aimed for configuring EBYTE E22 / E32 UART LoRa modules along with Raspbian for serial transmission using LoRa modulation. EBYTE modules are kind of different from typical modules: they use serial UART protocol instead of the SPI protocol of barebone LoRa modules. They include an MCU on top of the barebone LoRa radio for making UART conversion possible and managing config and Tx/Rx buffers. 

The pinout used for connecting the EBYTE modules to the Raspi is:

EBYTE | Raspberry
- Vcc |  5V
- Tx | Rx
- Rx | Tx
- GND | 0V
- M0 | GPIO 22
- M1 | GPIO 27
- AUX | GPIO 4
    
If you have a [Waveshare LoRa HAT](https://www.waveshare.com/wiki/SX1262_868M_LoRa_HAT), then lucky you, I chose the same pinout.

## EBYTE chip configuration

Keep in mind that EBYTE chips are configured via UART just like a normal binary frame transmission but setting M0=1, M1=0 before. You can do it via GPIO (3.3V for high) or jumper wires.

If you use E22 and have Windows installed, you can go for the easy option with the app [RFSetting](http://www.ebyte.com/en/pdf-down.aspx?id=1516). In other case, you will have to send the configuration frame using the config scripts below. Refer to the [user manual](http://www.ebyte.com/en/data-download.aspx) of your precise module for detailed information.

>**Warning:** Always comply with your national usage restrictions. Unlicensed ISM bands are also regulated. When configuring your radio settings, pay special attention to: EIRP (max Tx power + ant gain), bandwidth, and duty cycle/LBT).

## Scripts
Before you start:
- Transmission modes require M0=0, M1=0, which are handled by the script.
- EBYTE modules use an addressing system for layer 2. Just may it to broadcast mode for your tests.
- Change tty line _(/dev/ttyS0, ttyAMA0...)_ according to your Raspberry Pi model and configuration (Bluetooth disabled in order to avoid mini-UART). Check [UART configuration](https://www.raspberrypi.org/documentation/configuration/uart.md) and available lines using `ls /dev/tty*` and `ls -l /dev/serial*`.
- Tweak tty baud rates according to your configuration.
- MTU is configured in sizes lower than the buffer (240 bytes for E22, 512 bytes for E32). MTU = buffer - overhead. For example, if you use an E22 with tncattach ptp mode (4 overhead bytes), then MTU = 240 - 4 = 236
- Select different IP addresses.

Now, for the IP over LoRa scripts...

Fully commented configuration scripts. In order to the modules to communicate in the same network, these scripts have to be configured with similar parameters:
- E22 TBD
- E32 TBD

Point to point transmission with TNC Attach:
- **tncattach.sh**: sample script (check IPs in both hosts and verify cabling) for point-to-point communication using Mark Qvist's "tncattach".
- **tncattach.py**: same thing, but written in Python.

Point to point transmission with PPPD:
- TBD

Point to point transmission with Serial Line Internet Protocol Attach (SLIP attach, slattach):
- TBD

Point to multipoint transmission with TNC Attach:
- TBD

## Interesting links
- [LoRa-AX25-IP-Network](https://github.com/dmahony/LoRa-AX25-IP-Network) by Daniel Weiber.
- [TNC Attach](https://github.com/markqvist/tncattach) by Mark Qvist. Github page.
- [TNC Attach](https://unsigned.io/ethernet-and-ip-over-packet-radio-tncs/) blog post at unsigned.io.
- [IP over LoRa at 868 MHz (EU) using tncattach](https://asciinema.org/a/350743). Video recorded by me using tncattach and early versions of these scripts.
- Wikipedia: [KISS](https://en.wikipedia.org/wiki/KISS_(TNC)), a protocol (keep it simple, stupid) that establishes a command code system for TNC (Terminal Node Controllers / serial modems) used in amateur radio.
- Wikipedia: [AX.25](https://en.wikipedia.org/wiki/AX.25), a packet switching system used in amateur radio. It is layer 2 protocol. It is frequently used on top of KISS.
