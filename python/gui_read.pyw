from gui_utils import *

class ReadDeviceInfos(Tk):
    
    def __init__(self, **kwargs):
        super().__init__(**kwargs) 
        self.title(TITLE_TEXT_READ_DEVICE_INFOS)
        self.port_selector = PortSelector(self, padding=10)
        file_type = [FILE_TYPE_CSV, FILE_TYPE_ALL]
        self.file_selector = FileSelector(self, LABEL_TEXT_DEVICE_TABLE, file_type, padding=10)
        self.log_monitor = LogMonitor(self, padding=10)
        self.job_runner = JobRunner(self, command=self.read_device_infos, padding=10)

        # Widget placement 
        self.port_selector.pack(side=TOP, fill=X)
        self.file_selector.pack(side=TOP)
        self.log_monitor.pack(side=TOP)
        self.job_runner.pack(side=TOP)

    def read_device_infos(self):
        serial_port = self.port_selector.get_selected_port()
        table_file_path = self.file_selector.get_file_path()
        try:
            command.read_device_infos(serial_port, table_file_path)
        except SerialException:
            self.log_monitor.log_error(ERR_LOG_CANNOT_OPEN_PORT)
        except ValueError:
            self.log_monitor.log_error(ERR_LOG_FAIL_READ)
        except FileNotFoundError:
            self.log_monitor.log_error(ERR_LOG_FILE_NOT_FOUND)
        except PermissionError:
            self.log_monitor.log_error(ERR_LOG_CANNOT_OPEN_FILE)
        else:
            # Outputs a success message if none of the errors occur
            self.log_monitor.log_info(INFO_LOG_SUCCESS_WRITE_TO_FILE)

if __name__ == "__main__":
    root = ReadDeviceInfos()
    root.mainloop()