/*******************************************************************************
  System Initialization File

  File Name:
    initialization.c

  Summary:
    This file contains source code necessary to initialize the system.

  Description:
    This file contains source code necessary to initialize the system.  It
    implements the "SYS_Initialize" function, defines the configuration bits,
    and allocates any necessary global system resources,
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
* Copyright (C) 2018 Microchip Technology Inc. and its subsidiaries.
*
* Subject to your compliance with these terms, you may use Microchip software
* and any derivatives exclusively with Microchip products. It is your
* responsibility to comply with third party license terms applicable to your
* use of third party software (including open source software) that may
* accompany Microchip software.
*
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
* EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
* WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
* PARTICULAR PURPOSE.
*
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
* FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
* ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
* THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
 *******************************************************************************/
// DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************
#include "configuration.h"
#include "definitions.h"
#include "device.h"



// ****************************************************************************
// ****************************************************************************
// Section: Configuration Bits
// ****************************************************************************
// ****************************************************************************
#pragma config BOD33_DIS = SET
#pragma config BOD33USERLEVEL = 0x1c
#pragma config BOD33_ACTION = RESET
#pragma config BOD33_HYST = 0x2
#pragma config NVMCTRL_BOOTPROT = 0
#pragma config NVMCTRL_SEESBLK = 0x0
#pragma config NVMCTRL_SEEPSZ = 0x0
#pragma config RAMECC_ECCDIS = SET
#pragma config WDT_ENABLE = CLEAR
#pragma config WDT_ALWAYSON = CLEAR
#pragma config WDT_PER = CYC8192
#pragma config WDT_WINDOW = CYC8192
#pragma config WDT_EWOFFSET = CYC8192
#pragma config WDT_WEN = CLEAR
#pragma config NVMCTRL_REGION_LOCKS = 0xffffffff




// *****************************************************************************
// *****************************************************************************
// Section: Driver Initialization Data
// *****************************************************************************
// *****************************************************************************


// *****************************************************************************
// *****************************************************************************
// Section: System Data
// *****************************************************************************
// *****************************************************************************
/* Structure to hold the object handles for the modules in the system. */
SYSTEM_OBJECTS sysObj;

// *****************************************************************************
// *****************************************************************************
// Section: Library/Stack Initialization Data
// *****************************************************************************
// *****************************************************************************
/******************************************************
 * USB Driver Initialization
 ******************************************************/
 
/*  When designing a Self-powered USB Device, the application should make sure
    that USB_DEVICE_Attach() function is called only when VBUS is actively powered.
	Therefore, the firmware needs some means to detect when the Host is powering 
	the VBUS. A 5V tolerant I/O pin can be connected to VBUS (through a resistor)
	and can be used to detect when VBUS is high or low. The application can specify
	a VBUS Detect function through the USB Driver Initialize data structure. 
	The USB device stack will periodically call this function. If the VBUS is 
	detected, the USB_DEVICE_EVENT_POWER_DETECTED event is generated. If the VBUS 
	is removed (i.e., the device is physically detached from Host), the USB stack 
	will generate the event USB_DEVICE_EVENT_POWER_REMOVED. The application should 
	call USB_DEVICE_Detach() when VBUS is removed. 
    
    The following are the steps to generate the VBUS_SENSE Function through MHC     
        1) Navigate to MHC->Tools->Pin Configuration and Configure the pin used 
		   as VBUS_SENSE. Set this pin Function as "GPIO" and set as "Input". 
		   Provide a custom name to the pin.
        2) Select the USB Driver Component in MHC Project Graph and enable the  
		   "Enable VBUS Sense" Check-box.     
        3) Specify the custom name of the VBUS SENSE pin in the "VBUS SENSE Pin Name" box.  */ 
static DRV_USB_VBUS_LEVEL DRV_USBFSV1_VBUS_Comparator(void)
{
    DRV_USB_VBUS_LEVEL retVal = DRV_USB_VBUS_LEVEL_INVALID;
    
    if(true == USB_VBUS_SENSE_Get())
    {
        retVal = DRV_USB_VBUS_LEVEL_VALID;
    }
	return (retVal);

}


const DRV_USBFSV1_INIT drvUSBInit =
{
	/* Interrupt Source for USB module */
	.interruptSource = USB_OTHER_IRQn,
 
	/* Interrupt Source for USB module */
	.interruptSource1 = USB_SOF_HSOF_IRQn,
 
	/* Interrupt Source for USB module */
	.interruptSource2 = USB_TRCPT0_IRQn,
 
	/* Interrupt Source for USB module */
	.interruptSource3 = USB_TRCPT1_IRQn,

    /* System module initialization */
    .moduleInit = {0},

    /* USB Controller to operate as USB Device */
    .operationMode = DRV_USBFSV1_OPMODE_DEVICE,

    /* USB Full Speed Operation */
	.operationSpeed = USB_SPEED_FULL,
    
    /* Stop in idle */
    .runInStandby = true,

    /* Suspend in sleep */
    .suspendInSleep = false,

    /* Identifies peripheral (PLIB-level) ID */
    .usbID = USB_REGS,
	
    /* Function to check for VBus */
    .vbusComparator = DRV_USBFSV1_VBUS_Comparator
	
};




// *****************************************************************************
// *****************************************************************************
// Section: System Initialization
// *****************************************************************************
// *****************************************************************************
// <editor-fold defaultstate="collapsed" desc="SYS_CONSOLE Instance 1 Initialization Data">


/* These buffers are passed to the USB CDC Function Driver */
static uint8_t CACHE_ALIGN sysConsole1USBCdcRdBuffer[SYS_CONSOLE_USB_CDC_READ_WRITE_BUFFER_SIZE];
static uint8_t CACHE_ALIGN sysConsole1USBCdcWrBuffer[SYS_CONSOLE_USB_CDC_READ_WRITE_BUFFER_SIZE];

/* These are the USB CDC Ring Buffers. Data received from USB layer are copied to these ring buffer. */
static uint8_t sysConsole1USBCdcRdRingBuffer[SYS_CONSOLE_USB_CDC_RD_BUFFER_SIZE_IDX1];
static uint8_t sysConsole1USBCdcWrRingBuffer[SYS_CONSOLE_USB_CDC_WR_BUFFER_SIZE_IDX1];

/* Declared in console device implementation (sys_console_usb_cdc.c) */
extern const SYS_CONSOLE_DEV_DESC sysConsoleUSBCdcDevDesc;

const SYS_CONSOLE_USB_CDC_INIT_DATA sysConsole1USBCdcInitData =
{
	.cdcInstanceIndex			= 1,
	.cdcReadBuffer				= sysConsole1USBCdcRdBuffer,
	.cdcWriteBuffer				= sysConsole1USBCdcWrBuffer,
    .consoleReadBuffer 			= sysConsole1USBCdcRdRingBuffer,
    .consoleWriteBuffer 		= sysConsole1USBCdcWrRingBuffer,
    .consoleReadBufferSize 		= SYS_CONSOLE_USB_CDC_RD_BUFFER_SIZE_IDX1,
    .consoleWriteBufferSize 	= SYS_CONSOLE_USB_CDC_WR_BUFFER_SIZE_IDX1,
};

const SYS_CONSOLE_INIT sysConsole1Init =
{
    .deviceInitData = (const void*)&sysConsole1USBCdcInitData,
    .consDevDesc = &sysConsoleUSBCdcDevDesc,
    .deviceIndex = 1,
};


// </editor-fold>


const SYS_DEBUG_INIT debugInit =
{
    .moduleInit = {0},
    .errorLevel = SYS_DEBUG_GLOBAL_ERROR_LEVEL,
    .consoleIndex = 0,
};


// <editor-fold defaultstate="collapsed" desc="SYS_CONSOLE Instance 0 Initialization Data">


/* These buffers are passed to the USB CDC Function Driver */
static uint8_t CACHE_ALIGN sysConsole0USBCdcRdBuffer[SYS_CONSOLE_USB_CDC_READ_WRITE_BUFFER_SIZE];
static uint8_t CACHE_ALIGN sysConsole0USBCdcWrBuffer[SYS_CONSOLE_USB_CDC_READ_WRITE_BUFFER_SIZE];

/* These are the USB CDC Ring Buffers. Data received from USB layer are copied to these ring buffer. */
static uint8_t sysConsole0USBCdcRdRingBuffer[SYS_CONSOLE_USB_CDC_RD_BUFFER_SIZE_IDX0];
static uint8_t sysConsole0USBCdcWrRingBuffer[SYS_CONSOLE_USB_CDC_WR_BUFFER_SIZE_IDX0];

/* Declared in console device implementation (sys_console_usb_cdc.c) */
extern const SYS_CONSOLE_DEV_DESC sysConsoleUSBCdcDevDesc;

const SYS_CONSOLE_USB_CDC_INIT_DATA sysConsole0USBCdcInitData =
{
	.cdcInstanceIndex			= 0,
	.cdcReadBuffer				= sysConsole0USBCdcRdBuffer,
	.cdcWriteBuffer				= sysConsole0USBCdcWrBuffer,
    .consoleReadBuffer 			= sysConsole0USBCdcRdRingBuffer,
    .consoleWriteBuffer 		= sysConsole0USBCdcWrRingBuffer,
    .consoleReadBufferSize 		= SYS_CONSOLE_USB_CDC_RD_BUFFER_SIZE_IDX0,
    .consoleWriteBufferSize 	= SYS_CONSOLE_USB_CDC_WR_BUFFER_SIZE_IDX0,
};

const SYS_CONSOLE_INIT sysConsole0Init =
{
    .deviceInitData = (const void*)&sysConsole0USBCdcInitData,
    .consDevDesc = &sysConsoleUSBCdcDevDesc,
    .deviceIndex = 0,
};


// </editor-fold>




// *****************************************************************************
// *****************************************************************************
// Section: Local initialization functions
// *****************************************************************************
// *****************************************************************************



/*******************************************************************************
  Function:
    void SYS_Initialize ( void *data )

  Summary:
    Initializes the board, services, drivers, application and other modules.

  Remarks:
 */

void SYS_Initialize ( void* data )
{

    NVMCTRL_Initialize( );

  
    PORT_Initialize();

    CLOCK_Initialize();




    EVSYS_Initialize();

	BSP_Initialize();


    sysObj.sysConsole1 = SYS_CONSOLE_Initialize(SYS_CONSOLE_INDEX_1, (SYS_MODULE_INIT *)&sysConsole1Init);

    sysObj.sysDebug = SYS_DEBUG_Initialize(SYS_DEBUG_INDEX_0, (SYS_MODULE_INIT*)&debugInit);


    sysObj.sysConsole0 = SYS_CONSOLE_Initialize(SYS_CONSOLE_INDEX_0, (SYS_MODULE_INIT *)&sysConsole0Init);



	 /* Initialize the USB device layer */
    sysObj.usbDevObject0 = USB_DEVICE_Initialize (USB_DEVICE_INDEX_0 , ( SYS_MODULE_INIT* ) & usbDevInitData);
	
	

	/* Initialize USB Driver */ 
    sysObj.drvUSBFSV1Object = DRV_USBFSV1_Initialize(DRV_USBFSV1_INDEX_0, (SYS_MODULE_INIT *) &drvUSBInit);	


    APP_Initialize();


    NVIC_Initialize();

}


/*******************************************************************************
 End of File
*/
