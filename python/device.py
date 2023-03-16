import serial
import time 

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

    def close(self):
        self.serial_port.close()

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        self.close()

class CommandExecutionError(Exception):
    '''Errors encountered during processing in firmware'''

def execute_command(port, command, *command_args, execute_interval_s=0.1):

    # Format into a single string.
    # Separate each command or argument with a space.
    commands = command 
    for argument in command_args :
        commands = commands + ' ' + argument 
    if '\n' in commands or '\r' in commands:
        raise ValueError('Commands and arguments must not contain CR/LF.')
    commands += '\n' 

    # Send commands and receive a response
    with Device(port) as d:
        d.send(commands)
        time.sleep(execute_interval_s)
        return d.recieve()
