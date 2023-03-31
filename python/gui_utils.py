import os
from datetime import datetime
from serial.serialutil import SerialException 
from tkinter import *
from tkinter import ttk
from tkinter import filedialog
from tkinter.scrolledtext import ScrolledText

import command 

# Texts embedded in widget 
LABEL_TEXT_PORT                 = 'ポート'
LABEL_TEXT_DEVICE_TABLE         = '管理テーブル'
LABEL_TEXT_PUBLIC_KEY           = '公開鍵'
LABEL_TEXT_LOCK_CONFIG          = '公開鍵書き込み後にスロットをロックする'
BUTTON_TEXT_BROWSE              = "参照"
BUTTON_TEXT_EXECUTION           = "実行"    
TITLE_TEXT_READ_DEVICE_INFOS    = "セキュアエレメントデータ読み出し"    
TITLE_TEXT_WRITE_PUBLIC_KEY     = "公開鍵書き込み"    
FILE_TYPE_CSV                   = ("CSVファイル", "*.csv")
FILE_TYPE_PEM                   = ("PEMファイル", "*.pem")
FILE_TYPE_PUB                   = ("公開鍵", "*.pub")
FILE_TYPE_ALL                   = ("すべてのファイル", "*.*")

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
        self.port_list = command.get_port_list() 

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
