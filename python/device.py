import serial
import time 
import re 

BYTES_OF_MAC_ADDRESS = 12
PEM_FORMAT = '-----BEGIN .+-----(.+)-----END .+-----'

class Device:

    INTERVAL_SEND = 0.01
    DEVICE_COMMAND_INPUT_BUFFER_SIZE = 32

    EXECUTE_INTERVAL_READ_MAC_ADDRESS = 0.1
    EXECUTE_INTERVAL_READ_CERTIFICATE = 0.5
    EXECUTE_INTERVAL_WRITE_PUBLIC_KEY = 0.5
    EXECUTE_INTERVAL_LOCK_SLOT = 0.1

    def __init__(self, port):
        self.serial_port = serial.Serial(port=port, baudrate=115200, timeout=3)

    def send(self, command, *args):

        # Format into a single string.
        # Separate each command or argument with a space.
        commands = command 
        for argument in args :
            commands = commands + ' ' + argument 
        if '\n' in commands or '\r' in commands:
            raise ValueError('Commands and arguments must not contain CR/LF.')
        commands += '\n' 

        # Encoding into byte sequence.
        command_bytes = commands.encode()

        # Ensure that the command input buffer of the MCU does not overflow.
        while (command_bytes): 
            first_bytes   = command_bytes[:self.DEVICE_COMMAND_INPUT_BUFFER_SIZE-1]
            command_bytes = command_bytes[self.DEVICE_COMMAND_INPUT_BUFFER_SIZE-1:]
            self.serial_port.write(first_bytes)
            time.sleep(self.INTERVAL_SEND)

    def recieve(self):
        # Read all data stored in the buffer.
        responce_bytes = self.serial_port.read(self.serial_port.in_waiting) 
        responce = responce_bytes.decode()
        return(responce)

    def read_mac_address(self):
        self.send('read_mac_address')
        time.sleep(self.EXECUTE_INTERVAL_READ_MAC_ADDRESS)
        mac_address = self.recieve()
        return(parse_mac_address(mac_address))

    def read_certificate(self):
        self.send('read_certificate')
        time.sleep(self.EXECUTE_INTERVAL_READ_CERTIFICATE)
        certificate = self.recieve()
        return(parse_certificate(certificate))

    def write_public_key(self, public_key_pem):
        # Remove CR/LF contained in PEM.
        filterd_public_key_pem = re.sub("\n|\r", "", public_key_pem) 
        # Remove PEM header and footer.
        base64_encoded_public_key = re.findall(PEM_FORMAT, filterd_public_key_pem, re.DOTALL)

        self.send('write_public_key', base64_encoded_public_key[0])
        time.sleep(self.EXECUTE_INTERVAL_WRITE_PUBLIC_KEY)
        status = self.recieve()

    def lock_slot(self, slot_number):
        self.send('lock_slot', slot_number)
        time.sleep(self.EXECUTE_INTERVAL_LOCK_SLOT)
        status = self.recieve()

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
