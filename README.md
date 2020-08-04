# IP over LoRa

Collection of scripts aimed for configuring EBYTE E22/E32 modules along with Raspbian for serial transmission using LoRa modulation.

The pinout used for EBYTE E22 / E32 modules is:

EBYTE | Raspberry
- Vcc → 5V
- Tx → Rx
- Rx → Tx
- GND → 0V
- M0 → GPIO22
- M1 → GPIO27
- AUX → GPIO4

### EBYTE chip configuration

Keep in mind that EBYTE chips are configured via UART (like a normal frame transmission) but setting M0=1, M1=0 via GPIO (3.3V) or jumper wires.

If you use E22 and have Windows installed, you can go for the easy option with the app [RFSetting](http://www.ebyte.com/en/pdf-down.aspx?id=1516). In other case, you will have to send the configuration frame manually with a Python script.

>**Warning:** Always comply with your national usage restrictions. Unlicensed ISM bands are also regulated. When configuring your radio settings, pay special attention to: EIRP (max Tx power + ant gain), bandwidth, and duty cycle/LBT).

### Files
- **tncattach.sh**: sample script (check IPs in both hosts and verify cabling) for point-to-point communication using Mark Qvist's "tncattach".
- **tncattach.py**: same thing, but written in Python.
>Transmission modes require M0=0, M1=0, which are handled by the script.


### Interesting links
- [LoRa-AX25-IP-Network](https://github.com/dmahony/LoRa-AX25-IP-Network) by Daniel Weiber.
- [TNC Attach](https://github.com/markqvist/tncattach) by Mark Qvist.
- [IP over LoRa at 868 MHz (EU) using tncattach](https://asciinema.org/a/350743). Video recorded by me using tncattach and early versions of these scripts.
