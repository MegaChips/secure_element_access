import re 
import device 
import csv 
import argparse 
from serial.tools import list_ports 

BYTES_OF_MAC_ADDRESS = 6 
PEM_FORMAT = '-----BEGIN .+-----(.+)-----END .+-----'

def get_port_list():
    ports = list_ports.comports()
    port_list = [info.device for info in ports] 
    return port_list

def read_mac_address(port):
    mac_address = device.execute_command(port, 'read_mac_address')
    if len(mac_address) != BYTES_OF_MAC_ADDRESS * 2:
        raise ValueError('Not the expected number of characters.')
    return(mac_address)

def read_certificate(port):
    certificate = device.execute_command(port, 'read_certificate', execute_interval_s=0.5)
    if not re.fullmatch(PEM_FORMAT, certificate, re.DOTALL):
        raise ValueError('Not in the correct format.')
    return(certificate)

def read_device_infos(port, table_file_path):
    certificate = read_certificate(port)
    mac_address = read_mac_address(port)
    with open(table_file_path, 'a', newline="") as table :
        writer = csv.writer(table)
        writer.writerow([certificate, mac_address])

def write_public_key(port, public_key_pem):
    # Remove CR/LF contained in PEM.
    filterd_public_key_pem = re.sub("\n|\r", "", public_key_pem) 
    # Remove PEM header and footer.
    base64_encoded_public_key = re.findall(PEM_FORMAT, filterd_public_key_pem, re.DOTALL)
    if not base64_encoded_public_key :
        raise ValueError('Not in the correct format.')

    status = device.execute_command(port, 'write_public_key', base64_encoded_public_key[0], execute_interval_s=0.5)
    if status != 'Successfully write public key.':
        raise device.CommandExecutionError

def write_public_key_from_file(port, public_key_file_path):
    with open(public_key_file_path, 'r', newline="") as file :
        public_key_pem = file.read()
    write_public_key(port, public_key_pem)

def lock_slot(port, slot_number):
    status = device.execute_command(port, 'lock_slot', slot_number)
    if status != 'Successfully Locked the slot.':
        raise device.CommandExecutionError


if __name__ == "__main__":

    parser = argparse.ArgumentParser(description='Secure element access tool command')
    sub_parser = parser.add_subparsers(dest='command')

    get_port_list_parser = sub_parser.add_parser('get_port_list', help='show available port list')

    read_mac_address_parser = sub_parser.add_parser('read_mac_address', help='read MAC address from device')
    read_mac_address_parser.add_argument('port', help='select the serial port') 

    read_certificate_parser = sub_parser.add_parser('read_certificate', help='read certificate from device')
    read_certificate_parser.add_argument('port', help='select the serial port') 

    register_device_info_parser = sub_parser.add_parser('read_device_infos',
                                                         help='read data from device and write it in csv file')
    register_device_info_parser.add_argument('port', help='select the serial port') 
    register_device_info_parser.add_argument('file_path', help='path of csv file') 

    write_public_key__parser = sub_parser.add_parser('write_public_key', 
                                                     help='write public key read from file to the device')
    write_public_key__parser.add_argument('port', help='select the serial port') 
    write_public_key__parser.add_argument('file_path', help='path of public key pem file') 

    lock_slot_parser = sub_parser.add_parser('lock_slot', help='lock selected slot')
    lock_slot_parser.add_argument('port', help='select the serial port') 
    lock_slot_parser.add_argument('slot_number', help='number of slot to be locked') 

    args = parser.parse_args()

    if args.command == 'get_port_list':
        port_list = get_port_list()
        for port in port_list :
            print(port)
    elif args.command == 'read_mac_address':
        mac_address = read_mac_address(args.port)
        print(mac_address)
    elif args.command == 'read_certificate':
        certificate = read_certificate(args.port)
        print(certificate)
    elif args.command == 'read_device_infos':
        read_device_infos(args.port, args.file_path)
    elif args.command == 'write_public_key':
        write_public_key_from_file(args.port, args.file_path)
    elif args.command == 'lock_slot':
        lock_slot(args.port, args.slot_number)
