
#include <string.h>
#include <FreeRTOS.h>
#include "FreeRTOS_CLI.h"
#include "CLI_command_cryptoauthlib.h" 
#include "cryptoauthlib.h" 
#include "atca_cert_chain.h"
#include "atcacert/atcacert_client.h"
#include "atcacert/atcacert_pem.h"

#define GENERAL_DATA_SLOT   8 
#define PUBLIC_KEY_DER_SIZE ( sizeof(ec_pubkey_asn1_header) + ATCA_PUB_KEY_SIZE ) 

extern ATCAIfaceCfg atecc608_0_init_data; 

/** ASN.1 Header for SECP256R1 public keys */
static const uint8_t ec_pubkey_asn1_header[] = {
    0x30, 0x59, 0x30, 0x13, 0x06, 0x07, 0x2A, 0x86,
    0x48, 0xCE, 0x3D, 0x02, 0x01, 0x06, 0x08, 0x2A,
    0x86, 0x48, 0xCE, 0x3D, 0x03, 0x01, 0x07, 0x03,
    0x42, 0x00, 0x04
};

static BaseType_t prvInfoCommand( char *pcWriteBuffer, size_t xWriteBufferLen, const char *pcCommandString );
static const CLI_Command_Definition_t xInfoCommand =
{
    "info",
    "\r\ninfo\r\n    Read device infomation.\r\n",
    prvInfoCommand, 
    0
};

static BaseType_t prvReadCertificateCommand( char *pcWriteBuffer, size_t xWriteBufferLen, const char *pcCommandString );
static const CLI_Command_Definition_t xReadCertificateCommand =
{
    "read_certificate",
    "\r\nread_certificate\r\n    Read device certificate.\r\n",
    prvReadCertificateCommand, 
    0
};

static BaseType_t prvReadMacAddressCommand( char *pcWriteBuffer, size_t xWriteBufferLen, const char *pcCommandString );
static const CLI_Command_Definition_t xReadMacAddressCommand =
{
    "read_mac_address",
    "\r\nread_mac_address\r\n    Read device MAC address.\r\n",
    prvReadMacAddressCommand, 
    0
};

static BaseType_t prvWritePublicKeyCommand( char *pcWriteBuffer, size_t xWriteBufferLen, const char *pcCommandString );
static const CLI_Command_Definition_t xWritePublicKeyCommand =
{
    "write_public_key",
    "\r\nwrite_public_key\r\n    Write pulic key to slot 8 of the device.\r\n",
    prvWritePublicKeyCommand, 
    1 
};

static BaseType_t prvLockSlotCommand( char *pcWriteBuffer, size_t xWriteBufferLen, const char *pcCommandString );
static const CLI_Command_Definition_t xLockSlotCommand =
{
    "lock_slot",
    "\r\nlock_slot\r\n    Lock the specified slot.\r\n",
    prvLockSlotCommand, 
    1 
};


/*-----------------------------------------------------------*/

void CLICommandCryptoauthlib_RegisterCommands( void )
{
    FreeRTOS_CLIRegisterCommand( &xInfoCommand            );
    FreeRTOS_CLIRegisterCommand( &xReadCertificateCommand );
    FreeRTOS_CLIRegisterCommand( &xReadMacAddressCommand  );
    FreeRTOS_CLIRegisterCommand( &xWritePublicKeyCommand  );
    FreeRTOS_CLIRegisterCommand( &xLockSlotCommand        );
}

/*-----------------------------------------------------------*/

static BaseType_t prvInfoCommand( char *pcWriteBuffer, size_t xWriteBufferLen, const char *pcCommandString )
{
    uint8_t ucRevision[4];
    const uint8_t ucExpectedResponseAtecc608b[4] = { 0x00, 0x00, 0x60, 0x03 };
    ATCA_STATUS xRet;
 
    xRet = atcab_info( ucRevision );
 
    if( xRet != ATCA_SUCCESS )
    {
        strncpy( pcWriteBuffer, (const char*)"Info command error.\r\n", xWriteBufferLen );
    }
    else
    {
        if( memcmp( ucRevision, ucExpectedResponseAtecc608b, 4 ) == 0 )
        {
            strncpy( pcWriteBuffer, (const char*)"This device is ATECC608B.\r\n", xWriteBufferLen );
        }
    }
 
    return pdFALSE; 
}

static BaseType_t prvReadCertificateCommand( char *pcWriteBuffer, size_t xWriteBufferLen, const char *pcCommandString )
{
    uint8_t* pucDerCert = NULL;
    size_t xDerCertSize;
    uint8_t ucCaPublicKey[64];
    // Since the size of the certificate in PEM format is not known, a sufficient amount of buffer should be provided.
    char cPemCert[1024];
    size_t xPemCertSize;
    int xRet;
 
    xRet = atcab_read_pubkey( g_cert_def_3_device.ca_cert_def->public_key_dev_loc.slot, ucCaPublicKey );
 
    // Get certificate size from ATECC608B-TNGTLS certificate definition (templateID = 3) 
    if( xRet == ATCA_SUCCESS )
    {
        xRet = atcacert_read_cert_size( &g_cert_def_3_device, &xDerCertSize );
    }
 
    pucDerCert = pvPortMalloc( xDerCertSize );
 
    if( xRet == ATCA_SUCCESS )
    {
        xRet = atcacert_read_cert( &g_cert_def_3_device, ucCaPublicKey, pucDerCert, &xDerCertSize);
    }
 
    if( xRet == ATCA_SUCCESS )
    {
        // The size of the buffer is passed to the pem_cert_size input.
        // The actual size of the buffer is returned in the output pem_cert_size. 
        xPemCertSize = sizeof( cPemCert );
        xRet = atcacert_encode_pem_cert( pucDerCert, xDerCertSize, cPemCert, &xPemCertSize );
    }
 
    vPortFree( pucDerCert );
 
    if( xRet != ATCA_SUCCESS )
    {
        strncpy( pcWriteBuffer, (const char*)"Read certificate command error.\r\n", xWriteBufferLen );
    }
    else
    {
        strncpy( pcWriteBuffer, cPemCert, xWriteBufferLen );
    }
 
    return pdFALSE; 
}

static BaseType_t prvReadMacAddressCommand( char *pcWriteBuffer, size_t xWriteBufferLen, const char *pcCommandString )
{
    uint8_t* pucMacAddress = NULL;
    size_t xMacAddressSize;
    atcacert_device_loc_t xMacAddressLoc;
    ATCA_STATUS xRet;

    xMacAddressLoc = g_cert_def_3_device.cert_elements[2].device_loc;
    xMacAddressSize = xMacAddressLoc.count;
    pucMacAddress = pvPortMalloc( xMacAddressSize );

    xRet = atcab_read_bytes_zone( xMacAddressLoc.zone, xMacAddressLoc.slot, xMacAddressLoc.offset, pucMacAddress, xMacAddressSize );

    if( xRet != ATCA_SUCCESS )
    {
        strncpy( pcWriteBuffer, (const char*)"Read mac address command error.\r\n", xWriteBufferLen );
    }
    else
    {
        strncpy( pcWriteBuffer, (char*)pucMacAddress, xWriteBufferLen );
        strncpy( pcWriteBuffer + xMacAddressSize, (const char*)"\r\n", xWriteBufferLen );
    }

    return pdFALSE; 
}

static BaseType_t prvWritePublicKeyCommand( char *pcWriteBuffer, size_t xWriteBufferLen, const char *pcCommandString )
{
    const char* pcPublicKeyBase64 = NULL;
    BaseType_t xPublicKeyBase64Size = 0;
    uint8_t ucPublicKeyDer[PUBLIC_KEY_DER_SIZE];
    size_t xPublicKeyDerSize = PUBLIC_KEY_DER_SIZE;
    uint8_t ucPublicKey[ATCA_PUB_KEY_SIZE];
    ATCA_STATUS xRet = ATCA_SUCCESS;
    bool xIsLocked;

    pcPublicKeyBase64 = FreeRTOS_CLIGetParameter(pcCommandString, 1, &xPublicKeyBase64Size);

    xRet = atcab_base64decode(pcPublicKeyBase64, xPublicKeyBase64Size, ucPublicKeyDer, &xPublicKeyDerSize);

    if( xRet == ATCA_SUCCESS )
    {
        if( memcmp(ec_pubkey_asn1_header, ucPublicKeyDer, sizeof(ec_pubkey_asn1_header)) == 0 )
        {
            memcpy(ucPublicKey, ucPublicKeyDer + sizeof(ec_pubkey_asn1_header), ATCA_PUB_KEY_SIZE);
        }
        else
        {
            xRet = ATCA_BAD_PARAM;
        }
    }

    if( xRet == ATCA_SUCCESS )
    {
        xRet = atcab_is_slot_locked(GENERAL_DATA_SLOT, &xIsLocked);
    }

    if( xRet == ATCA_SUCCESS )
    {
        xRet = atcab_write_pubkey(GENERAL_DATA_SLOT, ucPublicKey);
    }

    if( xRet != ATCA_SUCCESS )
    {
        strncpy( pcWriteBuffer, (const char*)"Write public key command error.\r\n", xWriteBufferLen );
    }
    else
    {
        strncpy( pcWriteBuffer, (const char*)"Successfully write public key.\r\n", xWriteBufferLen );
    }

    return pdFALSE; 
}

static BaseType_t prvLockSlotCommand( char *pcWriteBuffer, size_t xWriteBufferLen, const char *pcCommandString )
{
    const char * pcSlotNumberString;
    BaseType_t pxParameterStringLength;
    uint8_t ucSlotNumber;
    ATCA_STATUS xRet = ATCA_SUCCESS;

    pcSlotNumberString = FreeRTOS_CLIGetParameter(pcCommandString, 1, &pxParameterStringLength);

    if( strcmp(pcSlotNumberString, "2") == 0 )
    {
        ucSlotNumber = 2;
    }
    else if( strcmp(pcSlotNumberString, "3") == 0 )
    {
        ucSlotNumber = 3;
    }
    else if( strcmp(pcSlotNumberString, "4") == 0 )
    {
        ucSlotNumber = 4;
    }
    else if( strcmp(pcSlotNumberString, "6") == 0 )
    {
        ucSlotNumber = 6;
    }
    else if( strcmp(pcSlotNumberString, "8") == 0 )
    {
        ucSlotNumber = 8;
    }
    else
    {
        xRet = ATCA_BAD_PARAM;
    }

    if( xRet == ATCA_SUCCESS )
    {
        xRet = atcab_lock_data_slot( ucSlotNumber );
    }

    if( xRet != ATCA_SUCCESS )
    {
        strncpy( pcWriteBuffer, (const char*)"Lock slot command error.\r\n", xWriteBufferLen );
    }
    else 
    {
        strncpy( pcWriteBuffer, (const char*)"Successfully Locked the slot.\r\n", xWriteBufferLen );
    }

    return pdFALSE; 

}
