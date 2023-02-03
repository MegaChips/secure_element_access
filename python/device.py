import serial
import time 
import re 

BYTES_OF_MAC_ADDRESS = 12
PEM_FORMAT = '-----BEGIN CERTIFICATE-----(.+)-----END CERTIFICATE-----'

class Device:

    SEND_INTERVAL = 0.01
    BOARD_COMMAND_INPUT_BUFFER_SIZE = 32

    READ_MAC_ADDRESS_EXECUTE_INTERVAL = 0.1
    READ_CERTIFICATE_EXECUTE_INTERVAL = 0.5

    def __init__(self, port):
        self.serial_port = serial.Serial(port=port, baudrate=115200, timeout=3)

    def write(self, write_bytes):
        # Ensure that the command input buffer of the MCU does not overflow
        while (write_bytes): 
            first_bytes = write_bytes[:self.BOARD_COMMAND_INPUT_BUFFER_SIZE]
            write_bytes = write_bytes[self.BOARD_COMMAND_INPUT_BUFFER_SIZE:]
            self.serial_port.write(first_bytes.encode())
            time.sleep(self.SEND_INTERVAL)

    def read(self):
        # Read all data stored in the buffer
        read_bytes = self.serial_port.read(self.serial_port.in_waiting) 
        return(read_bytes.decode())

    def read_mac_address(self):
        self.write('read_mac_address\n')
        time.sleep(self.READ_MAC_ADDRESS_EXECUTE_INTERVAL)
        mac_address = self.read()
        return(parse_mac_address(mac_address))

    def read_certificate(self):
        self.write('read_certificate\n')
        time.sleep(self.READ_CERTIFICATE_EXECUTE_INTERVAL)
        certificate = self.read()
        return(parse_certificate(certificate))

    def close(self):
        self.serial_port.close()

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        self.close()

def parse_mac_address(mac_address_string):
    mac_address = mac_address_string.strip() 
    if len(mac_address) != BYTES_OF_MAC_ADDRESS:
        raise ValueError('Not the expected number of characters.')
    return(mac_address)

def parse_certificate(certificate_string):
    certificate = certificate_string.strip() 
    if not re.fullmatch(PEM_FORMAT, certificate, re.DOTALL):
        raise ValueError('Not in the correct format.')
    return(certificate)
