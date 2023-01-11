
#include <string.h>
#include <FreeRTOS.h>
#include "FreeRTOS_CLI.h"
#include "CLI_command_cryptoauthlib.h" 
#include "cryptoauthlib.h" 
#include "atca_cert_chain.h"
#include "atcacert/atcacert_client.h"
#include "atcacert/atcacert_pem.h"

extern ATCAIfaceCfg atecc608_0_init_data; 

static BaseType_t prvCLICommandCryptoauthlib_info( char *pcWriteBuffer, size_t xWriteBufferLen, const char *pcCommandString );
static const CLI_Command_Definition_t xCLICommand_info =
{
    "info",
    "\r\ninfo\r\n    Read device infomation.\r\n",
    prvCLICommandCryptoauthlib_info, 
    0
};

static BaseType_t prvCLICommandCryptoauthlib_read_certificate( char *pcWriteBuffer, size_t xWriteBufferLen, const char *pcCommandString );
static const CLI_Command_Definition_t xCLICommand_read_certificate =
{
    "read_certificate",
    "\r\nread_certificate\r\n    Read device certificate.\r\n",
    prvCLICommandCryptoauthlib_read_certificate, 
    0
};

static BaseType_t prvCLICommandCryptoauthlib_read_mac_address( char *pcWriteBuffer, size_t xWriteBufferLen, const char *pcCommandString );
static const CLI_Command_Definition_t xCLICommand_read_mac_address =
{
    "read_mac_address",
    "\r\nread_mac_address\r\n    Read device mac_address.\r\n",
    prvCLICommandCryptoauthlib_read_mac_address, 
    0
};

/*-----------------------------------------------------------*/

void CLICommandCryptoauthlib_RegisterCommands( void )
{
    FreeRTOS_CLIRegisterCommand( &xCLICommand_info );
    FreeRTOS_CLIRegisterCommand( &xCLICommand_read_certificate );
    FreeRTOS_CLIRegisterCommand( &xCLICommand_read_mac_address );
}

/*-----------------------------------------------------------*/

static BaseType_t prvCLICommandCryptoauthlib_info( char *pcWriteBuffer, size_t xWriteBufferLen, const char *pcCommandString )
{
    uint8_t revision[4];
    const uint8_t expected_response_atecc608b[4] = { 0x00, 0x00, 0x60, 0x03 };
    ATCA_STATUS ret;
 
    ret = atcab_info( revision );
 
    if( ret != ATCA_SUCCESS )
    {
        strncpy( pcWriteBuffer, (const char*)"Info command error.\r\n", xWriteBufferLen );
    }
    else
    {
        if( memcmp( revision, expected_response_atecc608b, 4 ) == 0 )
        {
            strncpy( pcWriteBuffer, (const char*)"This device is ATECC608B.\r\n", xWriteBufferLen );
        }
    }
 
    return pdFALSE; 
}

static BaseType_t prvCLICommandCryptoauthlib_read_certificate( char *pcWriteBuffer, size_t xWriteBufferLen, const char *pcCommandString )
{
    uint8_t* der_cert = NULL;
    size_t der_cert_size;
    uint8_t ca_public_key[64];
    // Since the size of the certificate in PEM format is not known, a sufficient amount of buffer should be provided.
    char pem_cert[1024];
    size_t pem_cert_size;
    int ret;
 
    ret = atcab_read_pubkey( g_cert_def_3_device.ca_cert_def->public_key_dev_loc.slot, ca_public_key );
 
    // Get certificate size from ATECC608B-TNGTLS certificate definition (templateID = 3) 
    if( ret == ATCA_SUCCESS )
    {
        ret = atcacert_read_cert_size( &g_cert_def_3_device, &der_cert_size );
    }
 
    der_cert = pvPortMalloc( der_cert_size );
 
    if( ret == ATCA_SUCCESS )
    {
        ret = atcacert_read_cert( &g_cert_def_3_device, ca_public_key, der_cert, &der_cert_size);
    }
 
    if( ret == ATCA_SUCCESS )
    {
        // The size of the buffer is passed to the pem_cert_size input.
        // The actual size of the buffer is returned in the output pem_cert_size. 
        pem_cert_size = sizeof( pem_cert );
        ret = atcacert_encode_pem_cert( der_cert, der_cert_size, pem_cert, &pem_cert_size );
    }
 
    vPortFree( der_cert );
 
    if( ret != ATCA_SUCCESS )
    {
        strncpy( pcWriteBuffer, (const char*)"Read certificate command error.\r\n", xWriteBufferLen );
    }
    else
    {
        strncpy( pcWriteBuffer, pem_cert, xWriteBufferLen );
    }
 
    return pdFALSE; 
}

static BaseType_t prvCLICommandCryptoauthlib_read_mac_address( char *pcWriteBuffer, size_t xWriteBufferLen, const char *pcCommandString )
{
    uint8_t* mac_address = NULL;
    size_t mac_address_size;
    atcacert_device_loc_t mac_address_loc;
    ATCA_STATUS ret;

    mac_address_loc = g_cert_def_3_device.cert_elements[2].device_loc;
    mac_address_size = mac_address_loc.count;
    mac_address = pvPortMalloc( mac_address_size );

    ret = atcab_read_bytes_zone( mac_address_loc.zone, mac_address_loc.slot, mac_address_loc.offset, mac_address, mac_address_size );

    if( ret != ATCA_SUCCESS )
    {
        strncpy( pcWriteBuffer, (const char*)"Read mac address command error.\r\n", xWriteBufferLen );
    }
    else
    {
        strncpy( pcWriteBuffer, (char*)mac_address, xWriteBufferLen );
        strncpy( pcWriteBuffer + mac_address_size, (const char*)"\r\n", xWriteBufferLen );
    }

    return pdFALSE; 
}