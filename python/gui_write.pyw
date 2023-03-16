from gui_utils import *
import device

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

        serial_port = self.port_selector.get_selected_port()
        public_key_file_path = self.file_selector.get_file_path()
        slot_is_locked = self.bool_configurator.get_boolean()
        try:
            command.write_public_key_from_file(serial_port, public_key_file_path)
            if slot_is_locked:
                command.lock_slot('8')
        except FileNotFoundError:
            self.log_monitor.log_error(ERR_LOG_FILE_NOT_FOUND)
        except PermissionError:
            self.log_monitor.log_error(ERR_LOG_CANNOT_OPEN_FILE)
        except SerialException:
            self.log_monitor.log_error(ERR_LOG_CANNOT_OPEN_PORT)
        except ValueError:
            self.log_monitor.log_error(ERR_LOG_INVALID_INPUT)
        except device.CommandExecutionError:
            self.log_monitor.log_error(ERR_LOG_FAIL_WRITE)
        else:
            # Outputs a success message if none of the errors occur
            self.log_monitor.log_info(INFO_LOG_SUCCESS_WRITE_TO_DEVICE)

if __name__ == "__main__":
    root = WritePublicKey()
    root.mainloop()