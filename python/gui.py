
import os
import argparse 
import csv 
from datetime import datetime
from serial.tools import list_ports 
from serial.serialutil import SerialException 
from tkinter import *
from tkinter import ttk
from tkinter import filedialog
from tkinter.scrolledtext import ScrolledText

import device 

# Texts embedded in widget 
LABEL_TEXT_PORT                 = 'ポート'
LABEL_TEXT_DEVICE_TABLE         = '管理テーブル'
LABEL_TEXT_PUBLIC_KEY           = '公開鍵'
LABEL_TEXT_LOCK_CONFIG          = '公開鍵書き込み後にスロットをロックする'
BUTTON_TEXT_BROWSE              = "参照"
BUTTON_TEXT_EXECUTION           = "実行"    
TITLE_TEXT_REGISTER_DEVICE_INFO = "セキュアエレメントデータ読み出し"    
TITLE_TEXT_WRITE_PUBLIC_KEY     = "公開鍵書き込み"    
FILE_TYPE_CSV                   = [("CSVファイル", "*.csv")]
FILE_TYPE_PEM                   = [("PEMファイル", "*.pem")]

# Messages output to the log monitor
ERR_LOG_CANNOT_OPEN_PORT         = 'ポートが開けません。'
ERR_LOG_FAIL_READ                = 'データの読み込みに失敗しました。' 
ERR_LOG_FAIL_WRITE               = 'データの書き込みに失敗しました。' 
ERR_LOG_FILE_NOT_FOUND           = '指定したファイルが存在しません。'
ERR_LOG_CANNOT_OPEN_FILE         = 'ファイルが開けません。'
ERR_LOG_INVALID_INPUT            = 'テキストの形式が正しくありません。'
INFO_LOG_SUCCESS_WRITE_TO_FILE   = 'ファイルへの書き込みに成功しました。' 
INFO_LOG_SUCCESS_WRITE_TO_DEVICE = 'デバイスへの書き込みに成功しました。' 

class PortSelector(ttk.Frame):

    def __init__(self, master, **kwargs):
        super().__init__(master, **kwargs) 
        self.set_port_list()
        self.port_label = ttk.Label(self, text=LABEL_TEXT_PORT)
        self.combobox = ttk.Combobox(self, state="readonly", values=self.port_list, width=15)
        self.port_label.pack(side=LEFT, padx=5)
        self.combobox.pack(side=LEFT)

    def set_port_list(self):
        ports = list_ports.comports()
        self.port_list = [info.device for info in ports] 

    def get_selected_port(self):
        return self.combobox.get()

class FileSelector(ttk.Frame):
    
    def __init__(self, master, label_text, file_type, **kwargs):
        super().__init__(master, **kwargs) 
        self.file_label = ttk.Label(self, text=label_text)
        self.file_path = StringVar()
        self.file_path_entry = ttk.Entry(self, state="readonly", textvariable=self.file_path, width=50)
        self.browse_button = ttk.Button(self, text=BUTTON_TEXT_BROWSE, command=self.select_file)
        self.file_type = file_type 

        # Widget placement 
        self.file_label.pack(side=LEFT)
        self.browse_button.pack(side=RIGHT)
        self.file_path_entry.pack(expand=True, padx=10)

    def get_file_path(self):
        return self.file_path.get()

    def select_file(self):
        current_dir = os.path.dirname(__file__)
        file_path = filedialog.askopenfilename(filetype=self.file_type, initialdir=current_dir)
        self.file_path.set(file_path)

class LogMonitor(ttk.Frame):
    
    def __init__(self, master, **kwargs):
        super().__init__(master, **kwargs) 
        self.scrolled_text = ScrolledText(self, state="disable", height=10, width=70)
        self.scrolled_text.tag_config('ERROR', foreground='red')
        self.scrolled_text.pack()

    def write(self, message, tag = ''):
        message += '\n'
        self.scrolled_text.configure(state="normal")
        self.scrolled_text.insert('end', message, tag)
        self.scrolled_text.configure(state="disable")
        self.scrolled_text.yview('end')

    def log_info(self, info_message):
        now = datetime.now()
        message = f'{now:%Y-%m-%d %H:%M:%S}' + ' [INFO] ' + info_message
        self.write(message, 'INFO')

    def log_error(self, error_message):
        now = datetime.now()
        message = f'{now:%Y-%m-%d %H:%M:%S}' + ' [ERROR] ' + error_message
        self.write(message, 'ERROR')

class JobRunner(ttk.Frame):
    
    def __init__(self, master, command, **kwargs):
        super().__init__(master, **kwargs) 
        self.execution_button = ttk.Button(self, text=BUTTON_TEXT_EXECUTION, command=command)
        self.execution_button.pack()

class BoolConfigurator(ttk.Frame):
    
    def __init__(self, master, label_text, **kwargs):
        super().__init__(master, **kwargs) 
        self.bool_configuration = BooleanVar() 
        self.check_button = ttk.Checkbutton(self, text=label_text, variable=self.bool_configuration)
        self.check_button.pack(side=LEFT, padx=5)

    def get_boolean(self):
        return self.bool_configuration.get()

class RegisterDeviceInfo(Tk):
    
    def __init__(self, **kwargs):
        super().__init__(**kwargs) 
        self.title(TITLE_TEXT_REGISTER_DEVICE_INFO)
        self.port_selector = PortSelector(self, padding=10)
        self.file_selector = FileSelector(self, LABEL_TEXT_DEVICE_TABLE, FILE_TYPE_CSV, padding=10)
        self.log_monitor = LogMonitor(self, padding=10)
        self.job_runner = JobRunner(self, command=self.register_device_info, padding=10)

        # Widget placement 
        self.port_selector.pack(side=TOP, fill=X)
        self.file_selector.pack(side=TOP)
        self.log_monitor.pack(side=TOP)
        self.job_runner.pack(side=TOP)

    def register_device_info(self):

        # Read data from the device
        serial_port = self.port_selector.get_selected_port()
        try:
            with device.Device(port=serial_port) as d:
                certificate = d.read_certificate()
                mac_address = d.read_mac_address()
        except SerialException:
            self.log_monitor.log_error(ERR_LOG_CANNOT_OPEN_PORT)
            return
        except ValueError:
            self.log_monitor.log_error(ERR_LOG_FAIL_READ)
            return
    
        # Write the read data to the selected file
        table_file_path = self.file_selector.get_file_path()
        try:
            with open(table_file_path, 'a', newline="") as table :
                writer = csv.writer(table)
                writer.writerow([certificate, mac_address])
        except FileNotFoundError:
            self.log_monitor.log_error(ERR_LOG_FILE_NOT_FOUND)
            return
        except PermissionError:
            self.log_monitor.log_error(ERR_LOG_CANNOT_OPEN_FILE)
            return
    
        # Outputs a success message if none of the errors occur
        self.log_monitor.log_info(INFO_LOG_SUCCESS_WRITE_TO_FILE)


class WritePublicKey(Tk):
    
    def __init__(self, **kwargs):
        super().__init__(**kwargs) 
        self.title(TITLE_TEXT_WRITE_PUBLIC_KEY)
        self.port_selector = PortSelector(self, padding=10)
        self.bool_configurator = BoolConfigurator(self, LABEL_TEXT_LOCK_CONFIG, padding=10)
        self.file_selector = FileSelector(self, LABEL_TEXT_PUBLIC_KEY, FILE_TYPE_PEM, padding=10)
        self.log_monitor = LogMonitor(self, padding=10)
        self.job_runner = JobRunner(self, command=self.write_public_key, padding=10)

        # Widget placement 
        self.port_selector.pack(side=TOP, fill=X)
        self.bool_configurator.pack(side=TOP, fill=X)
        self.file_selector.pack(side=TOP)
        self.log_monitor.pack(side=TOP)
        self.job_runner.pack(side=TOP)

    def write_public_key(self):

        # Read the public key from the selected file
        key_file_path = self.file_selector.get_file_path()
        try:
            with open(key_file_path, 'r', newline="") as key :
                public_key = key.read()
        except FileNotFoundError:
            self.log_monitor.log_error(ERR_LOG_FILE_NOT_FOUND)
            return
        except PermissionError:
            self.log_monitor.log_error(ERR_LOG_CANNOT_OPEN_FILE)
            return
    
        # Write the public key to the device
        serial_port = self.port_selector.get_selected_port()
        slot_is_locked = self.bool_configurator.get_boolean()
        try:
            with device.Device(port=serial_port) as d:
                d.write_public_key(public_key)
                if slot_is_locked:
                    d.lock_slot('8')
        except SerialException:
            self.log_monitor.log_error(ERR_LOG_CANNOT_OPEN_PORT)
            return
        except ValueError:
            self.log_monitor.log_error(ERR_LOG_INVALID_INPUT)
            return
        except device.CommandExecutionError:
            self.log_monitor.log_error(ERR_LOG_FAIL_WRITE)
            return
    
        # Outputs a success message if none of the errors occur
        self.log_monitor.log_info(INFO_LOG_SUCCESS_WRITE_TO_DEVICE)

def main():

    parser = argparse.ArgumentParser()
    parser.add_argument("mode", help='select the operation mode', choices=['read', 'write'])
    args = parser.parse_args()

    if args.mode == 'read' :
        root = RegisterDeviceInfo()
    elif args.mode == 'write' :
        root = WritePublicKey()

    root.mainloop()

if __name__ == "__main__":
    main()
