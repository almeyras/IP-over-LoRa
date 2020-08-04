# IP over LoRa
>>Warning: Always comply with your national usage restrictions in your frequency band. Pay special attention to: EIRP (max Tx power + ant gain), bandwidth, and duty cycle/LBT).

The pinout used for EBYTE E22 / E32 modules is:
- M0 → GPIO22
- M1 → GPIO27
- AUX → GPIO4

Files included:
- **tncattach.sh; tncattach.py**: sample script (check IPs in both hosts) for point-to-point communication using Mark Qvist's "tncattach".


### Interesting projects
- [LoRa-AX25-IP-Network](https://github.com/dmahony/LoRa-AX25-IP-Network) by Daniel Weiber.
- [TNC Attach](https://github.com/markqvist/tncattach) by Mark Qvist.
