import serial
import time 
import re 

BYTES_OF_MAC_ADDRESS = 6 
PEM_FORMAT = '-----BEGIN .+-----(.+)-----END .+-----'

class Device:

    INTERVAL_SEND = 0.01
    DEVICE_COMMAND_INPUT_BUFFER_SIZE = 32

    def __init__(self, port):
        self.serial_port = serial.Serial(port=port, baudrate=115200, timeout=3)

    def send(self, commands):

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
        return(responce.strip())

    def execute_command(self, command, *command_args, execute_interval_s=0.1):

        # Format into a single string.
        # Separate each command or argument with a space.
        commands = command 
        for argument in command_args :
            commands = commands + ' ' + argument 
        if '\n' in commands or '\r' in commands:
            raise ValueError('Commands and arguments must not contain CR/LF.')
        commands += '\n' 

        # Send commands and receive a response
        self.send(commands)
        time.sleep(execute_interval_s)
        return self.recieve()

    def read_mac_address(self):
        mac_address = self.execute_command('read_mac_address')
        if len(mac_address) != BYTES_OF_MAC_ADDRESS * 2:
            raise ValueError('Not the expected number of characters.')
        return(mac_address)

    def read_certificate(self):
        certificate = self.execute_command('read_certificate', execute_interval_s=0.5)
        if not re.fullmatch(PEM_FORMAT, certificate, re.DOTALL):
            raise ValueError('Not in the correct format.')
        return(certificate)

    def write_public_key(self, public_key_pem):
        # Remove CR/LF contained in PEM.
        filterd_public_key_pem = re.sub("\n|\r", "", public_key_pem) 
        # Remove PEM header and footer.
        base64_encoded_public_key = re.findall(PEM_FORMAT, filterd_public_key_pem, re.DOTALL)
        if not base64_encoded_public_key :
            raise ValueError('Not in the correct format.')

        status = self.execute_command('write_public_key', base64_encoded_public_key[0], execute_interval_s=0.5)
        if status != 'Successfully write public key.':
            raise CommandExecutionError

    def lock_slot(self, slot_number):
        status = self.execute_command('lock_slot', slot_number)
        if status != 'Successfully Locked the slot.':
            raise CommandExecutionError

    def close(self):
        self.serial_port.close()

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        self.close()

class CommandExecutionError(Exception):
    '''Errors encountered during processing in firmware'''
