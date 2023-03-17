import binascii
import argparse

def ihex2bin(input="", output=""):
    BINARY_MAX_SIZE = 1024 * 1024

    IHEX_TYPE_DATA = 0
    IHEX_TYPE_EOF = 1
    IHEX_TYPE_SEG = 2
    IHEX_TYPE_LINEAR = 4

    is_addr_linear = False
    finalize = False
    segment_addr = 0
    linear_addr = 0
    physical_addr = 0
    binary_len = 0

    data_buff = ["FF"] * BINARY_MAX_SIZE
    data_idx = 0

    try:
        fr = open(input, 'r')
        fw = open(output, 'wb')

        while True:
            line = fr.readline()
            if not line:
                break

            # Remove newline character
            line = line.strip()
            # Remove start code and checksum
            line = line[1:len(line)-2]
    
            # Get each item
            address = int(line[2:6], 16)
            linetype = int(line[6:8], 16)
            data = line[8:len(line)]
    
            if (linetype == IHEX_TYPE_DATA):
                if (is_addr_linear == False):
                    physical_addr = (segment_addr << 4) & int("0xFFFF0", 16)
                elif (is_addr_linear == True):
                    physical_addr = (linear_addr << 16) & int("0xFFFF0000", 16)
                physical_addr = physical_addr + (address & int("0xFFFF", 16))

                # Only flash area is output
                if (physical_addr < int("0x100000", 16)):
                    data_idx = physical_addr

                    for i in range(0, len(data), 2):
                        data_buff[data_idx] = data[i:i+2]
                        data_idx = data_idx + 1
                    
                    binary_len = physical_addr + len(data)

            elif (linetype == IHEX_TYPE_EOF):
                finalize = True
                break
            elif (linetype == IHEX_TYPE_SEG):
                is_addr_linear = False
                segment_addr = int(data, 16)
            elif (linetype == IHEX_TYPE_LINEAR):
                is_addr_linear = True
                linear_addr = int(data, 16)

        fr.close()
        
        if (finalize == True):
            del data_buff[binary_len:BINARY_MAX_SIZE]
            data_buff = binascii.a2b_hex("".join(data_buff))
            fw.write(data_buff)
        
        fw.close()
         
    except FileNotFoundError:
        print("Cannnot find files.")
    except PermissionError:
        print("Cannnot access files.")


def main():
    ihex_file = ""
    bin_file = ""

    parser = argparse.ArgumentParser()
    
    parser.add_argument("--input", help="", type=str)
    parser.add_argument("--output", help="", type=str)
    args = parser.parse_args()

    if hasattr(args, "input"):
        ihex_file = args.input
    else:
        return
    
    if hasattr(args, "output"):
        bin_file = args.output
    else:
        return

    ihex2bin(ihex_file, bin_file)

if __name__ == "__main__":
    main()
