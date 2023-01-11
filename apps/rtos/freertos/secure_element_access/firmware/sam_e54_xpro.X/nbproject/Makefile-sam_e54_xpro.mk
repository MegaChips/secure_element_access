#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-sam_e54_xpro.mk)" "nbproject/Makefile-local-sam_e54_xpro.mk"
include nbproject/Makefile-local-sam_e54_xpro.mk
endif
endif

# Environment
MKDIR=gmkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=sam_e54_xpro
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/sam_e54_xpro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/sam_e54_xpro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED =\
${OBJECTDIR}/_ext/544748269/bsp.o\
${OBJECTDIR}/_ext/293059771/osal_freertos.o\
${OBJECTDIR}/_ext/2056749927/plib_clock.o\
${OBJECTDIR}/_ext/349294639/plib_cmcc.o\
${OBJECTDIR}/_ext/1950928424/plib_eic.o\
${OBJECTDIR}/_ext/2058899413/plib_evsys.o\
${OBJECTDIR}/_ext/348958103/plib_nvic.o\
${OBJECTDIR}/_ext/1986180951/plib_nvmctrl.o\
${OBJECTDIR}/_ext/348904952/plib_port.o\
${OBJECTDIR}/_ext/2060180706/plib_sercom7_i2c_master.o\
${OBJECTDIR}/_ext/2060180706/plib_sercom2_usart.o\
${OBJECTDIR}/_ext/498645085/xc32_monitor.o\
${OBJECTDIR}/_ext/68098787/initialization.o\
${OBJECTDIR}/_ext/68098787/interrupts.o\
${OBJECTDIR}/_ext/68098787/exceptions.o\
${OBJECTDIR}/_ext/68098787/startup_xc32.o\
${OBJECTDIR}/_ext/68098787/libc_syscalls.o\
${OBJECTDIR}/_ext/68098787/freertos_hooks.o\
${OBJECTDIR}/_ext/68098787/tasks.o\
${OBJECTDIR}/_ext/246609638/port.o\
${OBJECTDIR}/_ext/1665200909/heap_1.o\
${OBJECTDIR}/_ext/404212886/croutine.o\
${OBJECTDIR}/_ext/404212886/list.o\
${OBJECTDIR}/_ext/404212886/queue.o\
${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o\
${OBJECTDIR}/_ext/404212886/timers.o\
${OBJECTDIR}/_ext/404212886/event_groups.o\
${OBJECTDIR}/_ext/404212886/stream_buffer.o\
${OBJECTDIR}/_ext/1360937237/main.o\
${OBJECTDIR}/_ext/1360937237/atca_cert_chain.o\
${OBJECTDIR}/_ext/1360937237/CLI_task.o\
${OBJECTDIR}/_ext/1360937237/CLI_command_cryptoauthlib.o\
${OBJECTDIR}/_ext/1360937237/FreeRTOS_CLI.o 

CRYPTOAUTHLIB_OBJECTFILES_QUOTED_IF_SPACED =\
${OBJECTDIR}/_ext/323034064/atcacert_client.o\
${OBJECTDIR}/_ext/323034064/atcacert_date.o\
${OBJECTDIR}/_ext/323034064/atcacert_def.o\
${OBJECTDIR}/_ext/323034064/atcacert_der.o\
${OBJECTDIR}/_ext/323034064/atcacert_host_hw.o\
${OBJECTDIR}/_ext/323034064/atcacert_host_sw.o\
${OBJECTDIR}/_ext/323034064/atcacert_pem.o\
${OBJECTDIR}/_ext/1351323508/calib_aes.o\
${OBJECTDIR}/_ext/1351323508/calib_aes_gcm.o\
${OBJECTDIR}/_ext/1351323508/calib_basic.o\
${OBJECTDIR}/_ext/1351323508/calib_checkmac.o\
${OBJECTDIR}/_ext/1351323508/calib_command.o\
${OBJECTDIR}/_ext/1351323508/calib_counter.o\
${OBJECTDIR}/_ext/1351323508/calib_derivekey.o\
${OBJECTDIR}/_ext/1351323508/calib_ecdh.o\
${OBJECTDIR}/_ext/1351323508/calib_execution.o\
${OBJECTDIR}/_ext/1351323508/calib_gendig.o\
${OBJECTDIR}/_ext/1351323508/calib_genkey.o\
${OBJECTDIR}/_ext/1351323508/calib_hmac.o\
${OBJECTDIR}/_ext/1351323508/calib_info.o\
${OBJECTDIR}/_ext/1351323508/calib_kdf.o\
${OBJECTDIR}/_ext/1351323508/calib_lock.o\
${OBJECTDIR}/_ext/1351323508/calib_mac.o\
${OBJECTDIR}/_ext/1351323508/calib_nonce.o\
${OBJECTDIR}/_ext/1351323508/calib_privwrite.o\
${OBJECTDIR}/_ext/1351323508/calib_random.o\
${OBJECTDIR}/_ext/1351323508/calib_read.o\
${OBJECTDIR}/_ext/1351323508/calib_secureboot.o\
${OBJECTDIR}/_ext/1351323508/calib_selftest.o\
${OBJECTDIR}/_ext/1351323508/calib_sha.o\
${OBJECTDIR}/_ext/1351323508/calib_sign.o\
${OBJECTDIR}/_ext/1351323508/calib_updateextra.o\
${OBJECTDIR}/_ext/1351323508/calib_verify.o\
${OBJECTDIR}/_ext/1351323508/calib_write.o\
${OBJECTDIR}/_ext/1499975313/sha1_routines.o\
${OBJECTDIR}/_ext/1499975313/sha2_routines.o\
${OBJECTDIR}/_ext/1074738748/atca_crypto_hw_aes_cbc.o\
${OBJECTDIR}/_ext/1074738748/atca_crypto_hw_aes_cmac.o\
${OBJECTDIR}/_ext/1074738748/atca_crypto_hw_aes_ctr.o\
${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_ecdsa.o\
${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_rand.o\
${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_sha1.o\
${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_sha2.o\
${OBJECTDIR}/_ext/2146650376/ATECC608_0.o\
${OBJECTDIR}/_ext/2146650376/atca_hal.o\
${OBJECTDIR}/_ext/2146650376/hal_freertos.o\
${OBJECTDIR}/_ext/2146650376/hal_i2c_harmony.o\
${OBJECTDIR}/_ext/2146650376/hal_harmony_init.o\
${OBJECTDIR}/_ext/2146650376/hal_cortex_m_delay.o\
${OBJECTDIR}/_ext/2121638429/atca_host.o\
${OBJECTDIR}/_ext/2146647764/atca_jwt.o\
${OBJECTDIR}/_ext/1439798406/pkcs11_attrib.o\
${OBJECTDIR}/_ext/1439798406/pkcs11_cert.o\
${OBJECTDIR}/_ext/1439798406/pkcs11_config.o\
${OBJECTDIR}/_ext/1439798406/pkcs11_debug.o\
${OBJECTDIR}/_ext/1439798406/pkcs11_digest.o\
${OBJECTDIR}/_ext/1439798406/pkcs11_find.o\
${OBJECTDIR}/_ext/1439798406/pkcs11_info.o\
${OBJECTDIR}/_ext/1439798406/pkcs11_init.o\
${OBJECTDIR}/_ext/1439798406/pkcs11_key.o\
${OBJECTDIR}/_ext/1439798406/pkcs11_main.o\
${OBJECTDIR}/_ext/1439798406/pkcs11_mech.o\
${OBJECTDIR}/_ext/1439798406/pkcs11_object.o\
${OBJECTDIR}/_ext/1439798406/pkcs11_os.o\
${OBJECTDIR}/_ext/1439798406/pkcs11_session.o\
${OBJECTDIR}/_ext/1439798406/pkcs11_signature.o\
${OBJECTDIR}/_ext/1439798406/pkcs11_slot.o\
${OBJECTDIR}/_ext/1439798406/pkcs11_token.o\
${OBJECTDIR}/_ext/1439798406/pkcs11_util.o\
${OBJECTDIR}/_ext/1657315084/atca_basic.o\
${OBJECTDIR}/_ext/1657315084/atca_cfgs.o\
${OBJECTDIR}/_ext/1657315084/atca_command.o\
${OBJECTDIR}/_ext/1657315084/atca_debug.o\
${OBJECTDIR}/_ext/1657315084/atca_device.o\
${OBJECTDIR}/_ext/1657315084/atca_helpers.o\
${OBJECTDIR}/_ext/1657315084/atca_iface.o\
${OBJECTDIR}/_ext/1657315084/atca_utils_sizes.o 

# Object Files
OBJECTFILES=${OBJECTFILES_QUOTED_IF_SPACED}
CRYPTOAUTHLIB_OBJECTFILES=${CRYPTOAUTHLIB_OBJECTFILES_QUOTED_IF_SPACED}

# Includes 
COMMON_INCLUDE = -I"../src" -I"../src/config/sam_e54_xpro" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F"
CRYPTOAUTHLIB_SRC_DIR = ../src/config/sam_e54_xpro/library/cryptoauthlib
CRYPTOAUTHLIB_INCLUDE = ${COMMON_INCLUDE} -I"${CRYPTOAUTHLIB_SRC_DIR}" -I"${CRYPTOAUTHLIB_SRC_DIR}/crypto" -I"${CRYPTOAUTHLIB_SRC_DIR}/pkcs11"

# Pack Options 
PACK_COMMON_OPTIONS=-I "${CMSIS_DIR}/CMSIS/Core/Include"

# Common Options 
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
COMMON_OPTION = -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -O1 -MP -MMD $(COMPARISON_BUILD) ${PACK_COMMON_OPTIONS} -DXPRJ_sam_e54_xpro=$(CND_CONF) -D__DEBUG 
else
COMMON_OPTION = -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -O1 -MP -MMD $(COMPARISON_BUILD) ${PACK_COMMON_OPTIONS} -DXPRJ_sam_e54_xpro=$(CND_CONF)
endif


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-sam_e54_xpro.mk dist/${CND_CONF}/${IMAGE_TYPE}/sam_e54_xpro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATSAME54P20A
MP_LINKER_FILE_OPTION=,--script="..\src\config\sam_e54_xpro\ATSAME54P20A.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
${OBJECTDIR}/_ext/544748269/bsp.o: ../src/config/sam_e54_xpro/bsp/bsp.c   
	@${MKDIR} "${OBJECTDIR}/_ext/544748269" 
	@${RM} ${OBJECTDIR}/_ext/544748269/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/544748269/bsp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/544748269/bsp.o.d" -o ${OBJECTDIR}/_ext/544748269/bsp.o ../src/config/sam_e54_xpro/bsp/bsp.c    
	
${OBJECTDIR}/_ext/293059771/osal_freertos.o: ../src/config/sam_e54_xpro/osal/osal_freertos.c   
	@${MKDIR} "${OBJECTDIR}/_ext/293059771" 
	@${RM} ${OBJECTDIR}/_ext/293059771/osal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/293059771/osal_freertos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/293059771/osal_freertos.o.d" -o ${OBJECTDIR}/_ext/293059771/osal_freertos.o ../src/config/sam_e54_xpro/osal/osal_freertos.c    
	
${OBJECTDIR}/_ext/2056749927/plib_clock.o: ../src/config/sam_e54_xpro/peripheral/clock/plib_clock.c   
	@${MKDIR} "${OBJECTDIR}/_ext/2056749927" 
	@${RM} ${OBJECTDIR}/_ext/2056749927/plib_clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/2056749927/plib_clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/2056749927/plib_clock.o.d" -o ${OBJECTDIR}/_ext/2056749927/plib_clock.o ../src/config/sam_e54_xpro/peripheral/clock/plib_clock.c    
	
${OBJECTDIR}/_ext/349294639/plib_cmcc.o: ../src/config/sam_e54_xpro/peripheral/cmcc/plib_cmcc.c   
	@${MKDIR} "${OBJECTDIR}/_ext/349294639" 
	@${RM} ${OBJECTDIR}/_ext/349294639/plib_cmcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/349294639/plib_cmcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/349294639/plib_cmcc.o.d" -o ${OBJECTDIR}/_ext/349294639/plib_cmcc.o ../src/config/sam_e54_xpro/peripheral/cmcc/plib_cmcc.c    
	
${OBJECTDIR}/_ext/1950928424/plib_eic.o: ../src/config/sam_e54_xpro/peripheral/eic/plib_eic.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1950928424" 
	@${RM} ${OBJECTDIR}/_ext/1950928424/plib_eic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1950928424/plib_eic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/1950928424/plib_eic.o.d" -o ${OBJECTDIR}/_ext/1950928424/plib_eic.o ../src/config/sam_e54_xpro/peripheral/eic/plib_eic.c    
	
${OBJECTDIR}/_ext/2058899413/plib_evsys.o: ../src/config/sam_e54_xpro/peripheral/evsys/plib_evsys.c   
	@${MKDIR} "${OBJECTDIR}/_ext/2058899413" 
	@${RM} ${OBJECTDIR}/_ext/2058899413/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/2058899413/plib_evsys.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/2058899413/plib_evsys.o.d" -o ${OBJECTDIR}/_ext/2058899413/plib_evsys.o ../src/config/sam_e54_xpro/peripheral/evsys/plib_evsys.c    
	
${OBJECTDIR}/_ext/348958103/plib_nvic.o: ../src/config/sam_e54_xpro/peripheral/nvic/plib_nvic.c   
	@${MKDIR} "${OBJECTDIR}/_ext/348958103" 
	@${RM} ${OBJECTDIR}/_ext/348958103/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/348958103/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/348958103/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/348958103/plib_nvic.o ../src/config/sam_e54_xpro/peripheral/nvic/plib_nvic.c    
	
${OBJECTDIR}/_ext/1986180951/plib_nvmctrl.o: ../src/config/sam_e54_xpro/peripheral/nvmctrl/plib_nvmctrl.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1986180951" 
	@${RM} ${OBJECTDIR}/_ext/1986180951/plib_nvmctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1986180951/plib_nvmctrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/1986180951/plib_nvmctrl.o.d" -o ${OBJECTDIR}/_ext/1986180951/plib_nvmctrl.o ../src/config/sam_e54_xpro/peripheral/nvmctrl/plib_nvmctrl.c    
	
${OBJECTDIR}/_ext/348904952/plib_port.o: ../src/config/sam_e54_xpro/peripheral/port/plib_port.c   
	@${MKDIR} "${OBJECTDIR}/_ext/348904952" 
	@${RM} ${OBJECTDIR}/_ext/348904952/plib_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/348904952/plib_port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/348904952/plib_port.o.d" -o ${OBJECTDIR}/_ext/348904952/plib_port.o ../src/config/sam_e54_xpro/peripheral/port/plib_port.c    
	
${OBJECTDIR}/_ext/2060180706/plib_sercom7_i2c_master.o: ../src/config/sam_e54_xpro/peripheral/sercom/i2c_master/plib_sercom7_i2c_master.c   
	@${MKDIR} "${OBJECTDIR}/_ext/2060180706" 
	@${RM} ${OBJECTDIR}/_ext/2060180706/plib_sercom7_i2c_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/2060180706/plib_sercom7_i2c_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/2060180706/plib_sercom7_i2c_master.o.d" -o ${OBJECTDIR}/_ext/2060180706/plib_sercom7_i2c_master.o ../src/config/sam_e54_xpro/peripheral/sercom/i2c_master/plib_sercom7_i2c_master.c    
	
${OBJECTDIR}/_ext/2060180706/plib_sercom2_usart.o: ../src/config/sam_e54_xpro/peripheral/sercom/usart/plib_sercom2_usart.c   
	@${MKDIR} "${OBJECTDIR}/_ext/2060180706" 
	@${RM} ${OBJECTDIR}/_ext/2060180706/plib_sercom2_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/2060180706/plib_sercom2_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/2060180706/plib_sercom2_usart.o.d" -o ${OBJECTDIR}/_ext/2060180706/plib_sercom2_usart.o ../src/config/sam_e54_xpro/peripheral/sercom/usart/plib_sercom2_usart.c    
	
${OBJECTDIR}/_ext/498645085/xc32_monitor.o: ../src/config/sam_e54_xpro/stdio/xc32_monitor.c   
	@${MKDIR} "${OBJECTDIR}/_ext/498645085" 
	@${RM} ${OBJECTDIR}/_ext/498645085/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/498645085/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/498645085/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/498645085/xc32_monitor.o ../src/config/sam_e54_xpro/stdio/xc32_monitor.c    
	
${OBJECTDIR}/_ext/68098787/initialization.o: ../src/config/sam_e54_xpro/initialization.c   
	@${MKDIR} "${OBJECTDIR}/_ext/68098787" 
	@${RM} ${OBJECTDIR}/_ext/68098787/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/68098787/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/68098787/initialization.o.d" -o ${OBJECTDIR}/_ext/68098787/initialization.o ../src/config/sam_e54_xpro/initialization.c    
	
${OBJECTDIR}/_ext/68098787/interrupts.o: ../src/config/sam_e54_xpro/interrupts.c   
	@${MKDIR} "${OBJECTDIR}/_ext/68098787" 
	@${RM} ${OBJECTDIR}/_ext/68098787/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/68098787/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/68098787/interrupts.o.d" -o ${OBJECTDIR}/_ext/68098787/interrupts.o ../src/config/sam_e54_xpro/interrupts.c    
	
${OBJECTDIR}/_ext/68098787/exceptions.o: ../src/config/sam_e54_xpro/exceptions.c   
	@${MKDIR} "${OBJECTDIR}/_ext/68098787" 
	@${RM} ${OBJECTDIR}/_ext/68098787/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/68098787/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/68098787/exceptions.o.d" -o ${OBJECTDIR}/_ext/68098787/exceptions.o ../src/config/sam_e54_xpro/exceptions.c    
	
${OBJECTDIR}/_ext/68098787/startup_xc32.o: ../src/config/sam_e54_xpro/startup_xc32.c   
	@${MKDIR} "${OBJECTDIR}/_ext/68098787" 
	@${RM} ${OBJECTDIR}/_ext/68098787/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/68098787/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/68098787/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/68098787/startup_xc32.o ../src/config/sam_e54_xpro/startup_xc32.c    
	
${OBJECTDIR}/_ext/68098787/libc_syscalls.o: ../src/config/sam_e54_xpro/libc_syscalls.c   
	@${MKDIR} "${OBJECTDIR}/_ext/68098787" 
	@${RM} ${OBJECTDIR}/_ext/68098787/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/68098787/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/68098787/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/68098787/libc_syscalls.o ../src/config/sam_e54_xpro/libc_syscalls.c    
	
${OBJECTDIR}/_ext/68098787/freertos_hooks.o: ../src/config/sam_e54_xpro/freertos_hooks.c   
	@${MKDIR} "${OBJECTDIR}/_ext/68098787" 
	@${RM} ${OBJECTDIR}/_ext/68098787/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/_ext/68098787/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/68098787/freertos_hooks.o.d" -o ${OBJECTDIR}/_ext/68098787/freertos_hooks.o ../src/config/sam_e54_xpro/freertos_hooks.c    
	
${OBJECTDIR}/_ext/68098787/tasks.o: ../src/config/sam_e54_xpro/tasks.c   
	@${MKDIR} "${OBJECTDIR}/_ext/68098787" 
	@${RM} ${OBJECTDIR}/_ext/68098787/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/68098787/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/68098787/tasks.o.d" -o ${OBJECTDIR}/_ext/68098787/tasks.o ../src/config/sam_e54_xpro/tasks.c    
	
${OBJECTDIR}/_ext/246609638/port.o: ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c   
	@${MKDIR} "${OBJECTDIR}/_ext/246609638" 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/246609638/port.o.d" -o ${OBJECTDIR}/_ext/246609638/port.o ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c    
	
${OBJECTDIR}/_ext/1665200909/heap_1.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1665200909" 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/1665200909/heap_1.o.d" -o ${OBJECTDIR}/_ext/1665200909/heap_1.o ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c    
	
${OBJECTDIR}/_ext/404212886/croutine.o: ../src/third_party/rtos/FreeRTOS/Source/croutine.c   
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/404212886/croutine.o.d" -o ${OBJECTDIR}/_ext/404212886/croutine.o ../src/third_party/rtos/FreeRTOS/Source/croutine.c    
	
${OBJECTDIR}/_ext/404212886/list.o: ../src/third_party/rtos/FreeRTOS/Source/list.c   
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/404212886/list.o.d" -o ${OBJECTDIR}/_ext/404212886/list.o ../src/third_party/rtos/FreeRTOS/Source/list.c    
	
${OBJECTDIR}/_ext/404212886/queue.o: ../src/third_party/rtos/FreeRTOS/Source/queue.c   
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/404212886/queue.o.d" -o ${OBJECTDIR}/_ext/404212886/queue.o ../src/third_party/rtos/FreeRTOS/Source/queue.c    
	
${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o: ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c   
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d" -o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c    
	
${OBJECTDIR}/_ext/404212886/timers.o: ../src/third_party/rtos/FreeRTOS/Source/timers.c   
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/404212886/timers.o.d" -o ${OBJECTDIR}/_ext/404212886/timers.o ../src/third_party/rtos/FreeRTOS/Source/timers.c    
	
${OBJECTDIR}/_ext/404212886/event_groups.o: ../src/third_party/rtos/FreeRTOS/Source/event_groups.c   
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/404212886/event_groups.o.d" -o ${OBJECTDIR}/_ext/404212886/event_groups.o ../src/third_party/rtos/FreeRTOS/Source/event_groups.c    
	
${OBJECTDIR}/_ext/404212886/stream_buffer.o: ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c   
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/404212886/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c    
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    
	
${OBJECTDIR}/_ext/1360937237/atca_cert_chain.o: ../src/atca_cert_chain.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/atca_cert_chain.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/atca_cert_chain.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} ${CRYPTOAUTHLIB_INCLUDE} -Werror -Wall -MF "${OBJECTDIR}/_ext/1360937237/atca_cert_chain.o.d" -o ${OBJECTDIR}/_ext/1360937237/atca_cert_chain.o ../src/atca_cert_chain.c    
	
${OBJECTDIR}/_ext/1360937237/CLI_task.o: ../src/CLI_task.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/CLI_task.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/CLI_task.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} ${CRYPTOAUTHLIB_INCLUDE} -I"../src/FreeRTOS-Plus-CLI/" -Werror -Wall -MF "${OBJECTDIR}/_ext/1360937237/CLI_task.o.d" -o ${OBJECTDIR}/_ext/1360937237/CLI_task.o ../src/CLI_task.c     
	
${OBJECTDIR}/_ext/1360937237/CLI_command_cryptoauthlib.o: ../src/CLI_command_cryptoauthlib.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/CLI_command_cryptoauthlib.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/CLI_command_cryptoauthlib.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} ${CRYPTOAUTHLIB_INCLUDE} -I"../src/FreeRTOS-Plus-CLI/" -Werror -Wall -MF "${OBJECTDIR}/_ext/1360937237/CLI_command_cryptoauthlib.o.d" -o ${OBJECTDIR}/_ext/1360937237/CLI_command_cryptoauthlib.o ../src/CLI_command_cryptoauthlib.c    
	
${OBJECTDIR}/_ext/1360937237/FreeRTOS_CLI.o: ../src/FreeRTOS-Plus-CLI/FreeRTOS_CLI.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/FreeRTOS_CLI.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/FreeRTOS_CLI.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION} -ffunction-sections -fdata-sections ${COMMON_INCLUDE} -I"../src/FreeRTOS-Plus-CLI/" -Werror -Wall -MF "${OBJECTDIR}/_ext/1360937237/FreeRTOS_CLI.o.d" -o ${OBJECTDIR}/_ext/1360937237/FreeRTOS_CLI.o ../src/FreeRTOS-Plus-CLI/FreeRTOS_CLI.c
	
# cryptoauthlib 
${OBJECTDIR}/_ext/1870220980/trust_pkcs11_config.o: ${CRYPTOAUTHLIB_SRC_DIR}/app/pkcs11/trust_pkcs11_config.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1870220980" 
	@${RM} ${OBJECTDIR}/_ext/1870220980/trust_pkcs11_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1870220980/trust_pkcs11_config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1870220980/trust_pkcs11_config.o.d" -o ${OBJECTDIR}/_ext/1870220980/trust_pkcs11_config.o ${CRYPTOAUTHLIB_SRC_DIR}/app/pkcs11/trust_pkcs11_config.c    
	
${OBJECTDIR}/_ext/323034064/atcacert_client.o: ${CRYPTOAUTHLIB_SRC_DIR}/atcacert/atcacert_client.c   
	@${MKDIR} "${OBJECTDIR}/_ext/323034064" 
	@${RM} ${OBJECTDIR}/_ext/323034064/atcacert_client.o.d 
	@${RM} ${OBJECTDIR}/_ext/323034064/atcacert_client.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/323034064/atcacert_client.o.d" -o ${OBJECTDIR}/_ext/323034064/atcacert_client.o ${CRYPTOAUTHLIB_SRC_DIR}/atcacert/atcacert_client.c    
	
${OBJECTDIR}/_ext/323034064/atcacert_date.o: ${CRYPTOAUTHLIB_SRC_DIR}/atcacert/atcacert_date.c   
	@${MKDIR} "${OBJECTDIR}/_ext/323034064" 
	@${RM} ${OBJECTDIR}/_ext/323034064/atcacert_date.o.d 
	@${RM} ${OBJECTDIR}/_ext/323034064/atcacert_date.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/323034064/atcacert_date.o.d" -o ${OBJECTDIR}/_ext/323034064/atcacert_date.o ${CRYPTOAUTHLIB_SRC_DIR}/atcacert/atcacert_date.c    
	
${OBJECTDIR}/_ext/323034064/atcacert_def.o: ${CRYPTOAUTHLIB_SRC_DIR}/atcacert/atcacert_def.c   
	@${MKDIR} "${OBJECTDIR}/_ext/323034064" 
	@${RM} ${OBJECTDIR}/_ext/323034064/atcacert_def.o.d 
	@${RM} ${OBJECTDIR}/_ext/323034064/atcacert_def.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/323034064/atcacert_def.o.d" -o ${OBJECTDIR}/_ext/323034064/atcacert_def.o ${CRYPTOAUTHLIB_SRC_DIR}/atcacert/atcacert_def.c    
	
${OBJECTDIR}/_ext/323034064/atcacert_der.o: ${CRYPTOAUTHLIB_SRC_DIR}/atcacert/atcacert_der.c   
	@${MKDIR} "${OBJECTDIR}/_ext/323034064" 
	@${RM} ${OBJECTDIR}/_ext/323034064/atcacert_der.o.d 
	@${RM} ${OBJECTDIR}/_ext/323034064/atcacert_der.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/323034064/atcacert_der.o.d" -o ${OBJECTDIR}/_ext/323034064/atcacert_der.o ${CRYPTOAUTHLIB_SRC_DIR}/atcacert/atcacert_der.c    
	
${OBJECTDIR}/_ext/323034064/atcacert_host_hw.o: ${CRYPTOAUTHLIB_SRC_DIR}/atcacert/atcacert_host_hw.c   
	@${MKDIR} "${OBJECTDIR}/_ext/323034064" 
	@${RM} ${OBJECTDIR}/_ext/323034064/atcacert_host_hw.o.d 
	@${RM} ${OBJECTDIR}/_ext/323034064/atcacert_host_hw.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/323034064/atcacert_host_hw.o.d" -o ${OBJECTDIR}/_ext/323034064/atcacert_host_hw.o ${CRYPTOAUTHLIB_SRC_DIR}/atcacert/atcacert_host_hw.c    
	
${OBJECTDIR}/_ext/323034064/atcacert_host_sw.o: ${CRYPTOAUTHLIB_SRC_DIR}/atcacert/atcacert_host_sw.c   
	@${MKDIR} "${OBJECTDIR}/_ext/323034064" 
	@${RM} ${OBJECTDIR}/_ext/323034064/atcacert_host_sw.o.d 
	@${RM} ${OBJECTDIR}/_ext/323034064/atcacert_host_sw.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/323034064/atcacert_host_sw.o.d" -o ${OBJECTDIR}/_ext/323034064/atcacert_host_sw.o ${CRYPTOAUTHLIB_SRC_DIR}/atcacert/atcacert_host_sw.c    
	
${OBJECTDIR}/_ext/323034064/atcacert_pem.o: ${CRYPTOAUTHLIB_SRC_DIR}/atcacert/atcacert_pem.c   
	@${MKDIR} "${OBJECTDIR}/_ext/323034064" 
	@${RM} ${OBJECTDIR}/_ext/323034064/atcacert_pem.o.d 
	@${RM} ${OBJECTDIR}/_ext/323034064/atcacert_pem.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/323034064/atcacert_pem.o.d" -o ${OBJECTDIR}/_ext/323034064/atcacert_pem.o ${CRYPTOAUTHLIB_SRC_DIR}/atcacert/atcacert_pem.c    
	
${OBJECTDIR}/_ext/1351323508/calib_aes.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_aes.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_aes.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_aes.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_aes.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_aes.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_aes.c    
	
${OBJECTDIR}/_ext/1351323508/calib_aes_gcm.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_aes_gcm.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_aes_gcm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_aes_gcm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_aes_gcm.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_aes_gcm.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_aes_gcm.c    
	
${OBJECTDIR}/_ext/1351323508/calib_basic.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_basic.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_basic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_basic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_basic.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_basic.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_basic.c    
	
${OBJECTDIR}/_ext/1351323508/calib_checkmac.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_checkmac.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_checkmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_checkmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_checkmac.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_checkmac.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_checkmac.c    
	
${OBJECTDIR}/_ext/1351323508/calib_command.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_command.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_command.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_command.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_command.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_command.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_command.c    
	
${OBJECTDIR}/_ext/1351323508/calib_counter.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_counter.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_counter.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_counter.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_counter.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_counter.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_counter.c    
	
${OBJECTDIR}/_ext/1351323508/calib_derivekey.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_derivekey.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_derivekey.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_derivekey.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_derivekey.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_derivekey.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_derivekey.c    
	
${OBJECTDIR}/_ext/1351323508/calib_ecdh.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_ecdh.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_ecdh.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_ecdh.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_ecdh.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_ecdh.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_ecdh.c    
	
${OBJECTDIR}/_ext/1351323508/calib_execution.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_execution.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_execution.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_execution.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_execution.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_execution.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_execution.c    
	
${OBJECTDIR}/_ext/1351323508/calib_gendig.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_gendig.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_gendig.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_gendig.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_gendig.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_gendig.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_gendig.c    
	
${OBJECTDIR}/_ext/1351323508/calib_genkey.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_genkey.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_genkey.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_genkey.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_genkey.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_genkey.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_genkey.c    
	
${OBJECTDIR}/_ext/1351323508/calib_hmac.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_hmac.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_hmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_hmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_hmac.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_hmac.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_hmac.c    
	
${OBJECTDIR}/_ext/1351323508/calib_info.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_info.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_info.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_info.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_info.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_info.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_info.c    
	
${OBJECTDIR}/_ext/1351323508/calib_kdf.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_kdf.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_kdf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_kdf.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_kdf.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_kdf.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_kdf.c    
	
${OBJECTDIR}/_ext/1351323508/calib_lock.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_lock.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_lock.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_lock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_lock.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_lock.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_lock.c    
	
${OBJECTDIR}/_ext/1351323508/calib_mac.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_mac.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_mac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_mac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_mac.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_mac.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_mac.c    
	
${OBJECTDIR}/_ext/1351323508/calib_nonce.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_nonce.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_nonce.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_nonce.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_nonce.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_nonce.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_nonce.c    
	
${OBJECTDIR}/_ext/1351323508/calib_privwrite.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_privwrite.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_privwrite.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_privwrite.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_privwrite.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_privwrite.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_privwrite.c    
	
${OBJECTDIR}/_ext/1351323508/calib_random.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_random.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_random.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_random.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_random.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_random.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_random.c    
	
${OBJECTDIR}/_ext/1351323508/calib_read.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_read.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_read.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_read.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_read.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_read.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_read.c    
	
${OBJECTDIR}/_ext/1351323508/calib_secureboot.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_secureboot.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_secureboot.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_secureboot.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_secureboot.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_secureboot.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_secureboot.c    
	
${OBJECTDIR}/_ext/1351323508/calib_selftest.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_selftest.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_selftest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_selftest.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_selftest.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_selftest.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_selftest.c    
	
${OBJECTDIR}/_ext/1351323508/calib_sha.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_sha.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_sha.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_sha.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_sha.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_sha.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_sha.c    
	
${OBJECTDIR}/_ext/1351323508/calib_sign.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_sign.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_sign.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_sign.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_sign.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_sign.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_sign.c    
	
${OBJECTDIR}/_ext/1351323508/calib_updateextra.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_updateextra.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_updateextra.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_updateextra.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_updateextra.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_updateextra.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_updateextra.c    
	
${OBJECTDIR}/_ext/1351323508/calib_verify.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_verify.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_verify.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_verify.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_verify.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_verify.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_verify.c    
	
${OBJECTDIR}/_ext/1351323508/calib_write.o: ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_write.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1351323508" 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_write.o.d 
	@${RM} ${OBJECTDIR}/_ext/1351323508/calib_write.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1351323508/calib_write.o.d" -o ${OBJECTDIR}/_ext/1351323508/calib_write.o ${CRYPTOAUTHLIB_SRC_DIR}/calib/calib_write.c    
	
${OBJECTDIR}/_ext/1499975313/sha1_routines.o: ${CRYPTOAUTHLIB_SRC_DIR}/crypto/hashes/sha1_routines.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1499975313" 
	@${RM} ${OBJECTDIR}/_ext/1499975313/sha1_routines.o.d 
	@${RM} ${OBJECTDIR}/_ext/1499975313/sha1_routines.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1499975313/sha1_routines.o.d" -o ${OBJECTDIR}/_ext/1499975313/sha1_routines.o ${CRYPTOAUTHLIB_SRC_DIR}/crypto/hashes/sha1_routines.c    
	
${OBJECTDIR}/_ext/1499975313/sha2_routines.o: ${CRYPTOAUTHLIB_SRC_DIR}/crypto/hashes/sha2_routines.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1499975313" 
	@${RM} ${OBJECTDIR}/_ext/1499975313/sha2_routines.o.d 
	@${RM} ${OBJECTDIR}/_ext/1499975313/sha2_routines.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1499975313/sha2_routines.o.d" -o ${OBJECTDIR}/_ext/1499975313/sha2_routines.o ${CRYPTOAUTHLIB_SRC_DIR}/crypto/hashes/sha2_routines.c    
	
${OBJECTDIR}/_ext/1074738748/atca_crypto_hw_aes_cbc.o: ${CRYPTOAUTHLIB_SRC_DIR}/crypto/atca_crypto_hw_aes_cbc.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1074738748" 
	@${RM} ${OBJECTDIR}/_ext/1074738748/atca_crypto_hw_aes_cbc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1074738748/atca_crypto_hw_aes_cbc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1074738748/atca_crypto_hw_aes_cbc.o.d" -o ${OBJECTDIR}/_ext/1074738748/atca_crypto_hw_aes_cbc.o ${CRYPTOAUTHLIB_SRC_DIR}/crypto/atca_crypto_hw_aes_cbc.c    
	
${OBJECTDIR}/_ext/1074738748/atca_crypto_hw_aes_cmac.o: ${CRYPTOAUTHLIB_SRC_DIR}/crypto/atca_crypto_hw_aes_cmac.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1074738748" 
	@${RM} ${OBJECTDIR}/_ext/1074738748/atca_crypto_hw_aes_cmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/1074738748/atca_crypto_hw_aes_cmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1074738748/atca_crypto_hw_aes_cmac.o.d" -o ${OBJECTDIR}/_ext/1074738748/atca_crypto_hw_aes_cmac.o ${CRYPTOAUTHLIB_SRC_DIR}/crypto/atca_crypto_hw_aes_cmac.c    
	
${OBJECTDIR}/_ext/1074738748/atca_crypto_hw_aes_ctr.o: ${CRYPTOAUTHLIB_SRC_DIR}/crypto/atca_crypto_hw_aes_ctr.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1074738748" 
	@${RM} ${OBJECTDIR}/_ext/1074738748/atca_crypto_hw_aes_ctr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1074738748/atca_crypto_hw_aes_ctr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1074738748/atca_crypto_hw_aes_ctr.o.d" -o ${OBJECTDIR}/_ext/1074738748/atca_crypto_hw_aes_ctr.o ${CRYPTOAUTHLIB_SRC_DIR}/crypto/atca_crypto_hw_aes_ctr.c    
	
${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_ecdsa.o: ${CRYPTOAUTHLIB_SRC_DIR}/crypto/atca_crypto_sw_ecdsa.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1074738748" 
	@${RM} ${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_ecdsa.o.d 
	@${RM} ${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_ecdsa.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_ecdsa.o.d" -o ${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_ecdsa.o ${CRYPTOAUTHLIB_SRC_DIR}/crypto/atca_crypto_sw_ecdsa.c    
	
${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_rand.o: ${CRYPTOAUTHLIB_SRC_DIR}/crypto/atca_crypto_sw_rand.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1074738748" 
	@${RM} ${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_rand.o.d 
	@${RM} ${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_rand.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_rand.o.d" -o ${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_rand.o ${CRYPTOAUTHLIB_SRC_DIR}/crypto/atca_crypto_sw_rand.c    
	
${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_sha1.o: ${CRYPTOAUTHLIB_SRC_DIR}/crypto/atca_crypto_sw_sha1.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1074738748" 
	@${RM} ${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_sha1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_sha1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_sha1.o.d" -o ${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_sha1.o ${CRYPTOAUTHLIB_SRC_DIR}/crypto/atca_crypto_sw_sha1.c    
	
${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_sha2.o: ${CRYPTOAUTHLIB_SRC_DIR}/crypto/atca_crypto_sw_sha2.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1074738748" 
	@${RM} ${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_sha2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_sha2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_sha2.o.d" -o ${OBJECTDIR}/_ext/1074738748/atca_crypto_sw_sha2.o ${CRYPTOAUTHLIB_SRC_DIR}/crypto/atca_crypto_sw_sha2.c    
	
${OBJECTDIR}/_ext/2146650376/ATECC608_0.o: ${CRYPTOAUTHLIB_SRC_DIR}/hal/ATECC608_0.c   
	@${MKDIR} "${OBJECTDIR}/_ext/2146650376" 
	@${RM} ${OBJECTDIR}/_ext/2146650376/ATECC608_0.o.d 
	@${RM} ${OBJECTDIR}/_ext/2146650376/ATECC608_0.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/2146650376/ATECC608_0.o.d" -o ${OBJECTDIR}/_ext/2146650376/ATECC608_0.o ${CRYPTOAUTHLIB_SRC_DIR}/hal/ATECC608_0.c    
	
${OBJECTDIR}/_ext/2146650376/atca_hal.o: ${CRYPTOAUTHLIB_SRC_DIR}/hal/atca_hal.c   
	@${MKDIR} "${OBJECTDIR}/_ext/2146650376" 
	@${RM} ${OBJECTDIR}/_ext/2146650376/atca_hal.o.d 
	@${RM} ${OBJECTDIR}/_ext/2146650376/atca_hal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/2146650376/atca_hal.o.d" -o ${OBJECTDIR}/_ext/2146650376/atca_hal.o ${CRYPTOAUTHLIB_SRC_DIR}/hal/atca_hal.c    
	
${OBJECTDIR}/_ext/2146650376/hal_freertos.o: ${CRYPTOAUTHLIB_SRC_DIR}/hal/hal_freertos.c   
	@${MKDIR} "${OBJECTDIR}/_ext/2146650376" 
	@${RM} ${OBJECTDIR}/_ext/2146650376/hal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/2146650376/hal_freertos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/2146650376/hal_freertos.o.d" -o ${OBJECTDIR}/_ext/2146650376/hal_freertos.o ${CRYPTOAUTHLIB_SRC_DIR}/hal/hal_freertos.c    
	
${OBJECTDIR}/_ext/2146650376/hal_i2c_harmony.o: ${CRYPTOAUTHLIB_SRC_DIR}/hal/hal_i2c_harmony.c   
	@${MKDIR} "${OBJECTDIR}/_ext/2146650376" 
	@${RM} ${OBJECTDIR}/_ext/2146650376/hal_i2c_harmony.o.d 
	@${RM} ${OBJECTDIR}/_ext/2146650376/hal_i2c_harmony.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/2146650376/hal_i2c_harmony.o.d" -o ${OBJECTDIR}/_ext/2146650376/hal_i2c_harmony.o ${CRYPTOAUTHLIB_SRC_DIR}/hal/hal_i2c_harmony.c    
	
${OBJECTDIR}/_ext/2146650376/hal_harmony_init.o: ${CRYPTOAUTHLIB_SRC_DIR}/hal/hal_harmony_init.c   
	@${MKDIR} "${OBJECTDIR}/_ext/2146650376" 
	@${RM} ${OBJECTDIR}/_ext/2146650376/hal_harmony_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/2146650376/hal_harmony_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/2146650376/hal_harmony_init.o.d" -o ${OBJECTDIR}/_ext/2146650376/hal_harmony_init.o ${CRYPTOAUTHLIB_SRC_DIR}/hal/hal_harmony_init.c    
	
${OBJECTDIR}/_ext/2146650376/hal_cortex_m_delay.o: ${CRYPTOAUTHLIB_SRC_DIR}/hal/hal_cortex_m_delay.c   
	@${MKDIR} "${OBJECTDIR}/_ext/2146650376" 
	@${RM} ${OBJECTDIR}/_ext/2146650376/hal_cortex_m_delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/2146650376/hal_cortex_m_delay.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/2146650376/hal_cortex_m_delay.o.d" -o ${OBJECTDIR}/_ext/2146650376/hal_cortex_m_delay.o ${CRYPTOAUTHLIB_SRC_DIR}/hal/hal_cortex_m_delay.c    
	
${OBJECTDIR}/_ext/2121638429/atca_host.o: ${CRYPTOAUTHLIB_SRC_DIR}/host/atca_host.c   
	@${MKDIR} "${OBJECTDIR}/_ext/2121638429" 
	@${RM} ${OBJECTDIR}/_ext/2121638429/atca_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/2121638429/atca_host.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/2121638429/atca_host.o.d" -o ${OBJECTDIR}/_ext/2121638429/atca_host.o ${CRYPTOAUTHLIB_SRC_DIR}/host/atca_host.c    
	
${OBJECTDIR}/_ext/2146647764/atca_jwt.o: ${CRYPTOAUTHLIB_SRC_DIR}/jwt/atca_jwt.c   
	@${MKDIR} "${OBJECTDIR}/_ext/2146647764" 
	@${RM} ${OBJECTDIR}/_ext/2146647764/atca_jwt.o.d 
	@${RM} ${OBJECTDIR}/_ext/2146647764/atca_jwt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/2146647764/atca_jwt.o.d" -o ${OBJECTDIR}/_ext/2146647764/atca_jwt.o ${CRYPTOAUTHLIB_SRC_DIR}/jwt/atca_jwt.c    
	
${OBJECTDIR}/_ext/1439798406/pkcs11_attrib.o: ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_attrib.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1439798406" 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_attrib.o.d 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_attrib.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1439798406/pkcs11_attrib.o.d" -o ${OBJECTDIR}/_ext/1439798406/pkcs11_attrib.o ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_attrib.c    
	
${OBJECTDIR}/_ext/1439798406/pkcs11_cert.o: ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_cert.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1439798406" 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_cert.o.d 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_cert.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1439798406/pkcs11_cert.o.d" -o ${OBJECTDIR}/_ext/1439798406/pkcs11_cert.o ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_cert.c    
	
${OBJECTDIR}/_ext/1439798406/pkcs11_config.o: ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_config.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1439798406" 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1439798406/pkcs11_config.o.d" -o ${OBJECTDIR}/_ext/1439798406/pkcs11_config.o ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_config.c    
	
${OBJECTDIR}/_ext/1439798406/pkcs11_debug.o: ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_debug.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1439798406" 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1439798406/pkcs11_debug.o.d" -o ${OBJECTDIR}/_ext/1439798406/pkcs11_debug.o ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_debug.c    
	
${OBJECTDIR}/_ext/1439798406/pkcs11_digest.o: ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_digest.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1439798406" 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_digest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_digest.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1439798406/pkcs11_digest.o.d" -o ${OBJECTDIR}/_ext/1439798406/pkcs11_digest.o ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_digest.c    
	
${OBJECTDIR}/_ext/1439798406/pkcs11_find.o: ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_find.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1439798406" 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_find.o.d 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_find.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1439798406/pkcs11_find.o.d" -o ${OBJECTDIR}/_ext/1439798406/pkcs11_find.o ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_find.c    
	
${OBJECTDIR}/_ext/1439798406/pkcs11_info.o: ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_info.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1439798406" 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_info.o.d 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_info.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1439798406/pkcs11_info.o.d" -o ${OBJECTDIR}/_ext/1439798406/pkcs11_info.o ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_info.c    
	
${OBJECTDIR}/_ext/1439798406/pkcs11_init.o: ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_init.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1439798406" 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1439798406/pkcs11_init.o.d" -o ${OBJECTDIR}/_ext/1439798406/pkcs11_init.o ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_init.c    
	
${OBJECTDIR}/_ext/1439798406/pkcs11_key.o: ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_key.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1439798406" 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_key.o.d 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_key.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1439798406/pkcs11_key.o.d" -o ${OBJECTDIR}/_ext/1439798406/pkcs11_key.o ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_key.c    
	
${OBJECTDIR}/_ext/1439798406/pkcs11_main.o: ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_main.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1439798406" 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1439798406/pkcs11_main.o.d" -o ${OBJECTDIR}/_ext/1439798406/pkcs11_main.o ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_main.c    
	
${OBJECTDIR}/_ext/1439798406/pkcs11_mech.o: ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_mech.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1439798406" 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_mech.o.d 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_mech.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1439798406/pkcs11_mech.o.d" -o ${OBJECTDIR}/_ext/1439798406/pkcs11_mech.o ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_mech.c    
	
${OBJECTDIR}/_ext/1439798406/pkcs11_object.o: ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_object.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1439798406" 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_object.o.d 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_object.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1439798406/pkcs11_object.o.d" -o ${OBJECTDIR}/_ext/1439798406/pkcs11_object.o ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_object.c    
	
${OBJECTDIR}/_ext/1439798406/pkcs11_os.o: ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_os.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1439798406" 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_os.o.d 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_os.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1439798406/pkcs11_os.o.d" -o ${OBJECTDIR}/_ext/1439798406/pkcs11_os.o ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_os.c    
	
${OBJECTDIR}/_ext/1439798406/pkcs11_session.o: ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_session.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1439798406" 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_session.o.d 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_session.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1439798406/pkcs11_session.o.d" -o ${OBJECTDIR}/_ext/1439798406/pkcs11_session.o ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_session.c    
	
${OBJECTDIR}/_ext/1439798406/pkcs11_signature.o: ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_signature.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1439798406" 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_signature.o.d 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_signature.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1439798406/pkcs11_signature.o.d" -o ${OBJECTDIR}/_ext/1439798406/pkcs11_signature.o ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_signature.c    
	
${OBJECTDIR}/_ext/1439798406/pkcs11_slot.o: ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_slot.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1439798406" 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_slot.o.d 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_slot.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1439798406/pkcs11_slot.o.d" -o ${OBJECTDIR}/_ext/1439798406/pkcs11_slot.o ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_slot.c    
	
${OBJECTDIR}/_ext/1439798406/pkcs11_token.o: ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_token.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1439798406" 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_token.o.d 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_token.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1439798406/pkcs11_token.o.d" -o ${OBJECTDIR}/_ext/1439798406/pkcs11_token.o ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_token.c    
	
${OBJECTDIR}/_ext/1439798406/pkcs11_util.o: ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_util.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1439798406" 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_util.o.d 
	@${RM} ${OBJECTDIR}/_ext/1439798406/pkcs11_util.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1439798406/pkcs11_util.o.d" -o ${OBJECTDIR}/_ext/1439798406/pkcs11_util.o ${CRYPTOAUTHLIB_SRC_DIR}/pkcs11/pkcs11_util.c    
	
${OBJECTDIR}/_ext/1657315084/atca_basic.o: ${CRYPTOAUTHLIB_SRC_DIR}/atca_basic.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1657315084" 
	@${RM} ${OBJECTDIR}/_ext/1657315084/atca_basic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1657315084/atca_basic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1657315084/atca_basic.o.d" -o ${OBJECTDIR}/_ext/1657315084/atca_basic.o ${CRYPTOAUTHLIB_SRC_DIR}/atca_basic.c    
	
${OBJECTDIR}/_ext/1657315084/atca_cfgs.o: ${CRYPTOAUTHLIB_SRC_DIR}/atca_cfgs.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1657315084" 
	@${RM} ${OBJECTDIR}/_ext/1657315084/atca_cfgs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1657315084/atca_cfgs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1657315084/atca_cfgs.o.d" -o ${OBJECTDIR}/_ext/1657315084/atca_cfgs.o ${CRYPTOAUTHLIB_SRC_DIR}/atca_cfgs.c    
	
${OBJECTDIR}/_ext/1657315084/atca_command.o: ${CRYPTOAUTHLIB_SRC_DIR}/atca_command.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1657315084" 
	@${RM} ${OBJECTDIR}/_ext/1657315084/atca_command.o.d 
	@${RM} ${OBJECTDIR}/_ext/1657315084/atca_command.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1657315084/atca_command.o.d" -o ${OBJECTDIR}/_ext/1657315084/atca_command.o ${CRYPTOAUTHLIB_SRC_DIR}/atca_command.c    
	
${OBJECTDIR}/_ext/1657315084/atca_debug.o: ${CRYPTOAUTHLIB_SRC_DIR}/atca_debug.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1657315084" 
	@${RM} ${OBJECTDIR}/_ext/1657315084/atca_debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1657315084/atca_debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1657315084/atca_debug.o.d" -o ${OBJECTDIR}/_ext/1657315084/atca_debug.o ${CRYPTOAUTHLIB_SRC_DIR}/atca_debug.c    
	
${OBJECTDIR}/_ext/1657315084/atca_device.o: ${CRYPTOAUTHLIB_SRC_DIR}/atca_device.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1657315084" 
	@${RM} ${OBJECTDIR}/_ext/1657315084/atca_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/1657315084/atca_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1657315084/atca_device.o.d" -o ${OBJECTDIR}/_ext/1657315084/atca_device.o ${CRYPTOAUTHLIB_SRC_DIR}/atca_device.c    
	
${OBJECTDIR}/_ext/1657315084/atca_helpers.o: ${CRYPTOAUTHLIB_SRC_DIR}/atca_helpers.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1657315084" 
	@${RM} ${OBJECTDIR}/_ext/1657315084/atca_helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1657315084/atca_helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1657315084/atca_helpers.o.d" -o ${OBJECTDIR}/_ext/1657315084/atca_helpers.o ${CRYPTOAUTHLIB_SRC_DIR}/atca_helpers.c    
	
${OBJECTDIR}/_ext/1657315084/atca_iface.o: ${CRYPTOAUTHLIB_SRC_DIR}/atca_iface.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1657315084" 
	@${RM} ${OBJECTDIR}/_ext/1657315084/atca_iface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1657315084/atca_iface.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1657315084/atca_iface.o.d" -o ${OBJECTDIR}/_ext/1657315084/atca_iface.o ${CRYPTOAUTHLIB_SRC_DIR}/atca_iface.c    
	
${OBJECTDIR}/_ext/1657315084/atca_utils_sizes.o: ${CRYPTOAUTHLIB_SRC_DIR}/atca_utils_sizes.c   
	@${MKDIR} "${OBJECTDIR}/_ext/1657315084" 
	@${RM} ${OBJECTDIR}/_ext/1657315084/atca_utils_sizes.o.d 
	@${RM} ${OBJECTDIR}/_ext/1657315084/atca_utils_sizes.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  ${COMMON_OPTION}  ${CRYPTOAUTHLIB_INCLUDE}  -MF "${OBJECTDIR}/_ext/1657315084/atca_utils_sizes.o.d" -o ${OBJECTDIR}/_ext/1657315084/atca_utils_sizes.o ${CRYPTOAUTHLIB_SRC_DIR}/atca_utils_sizes.c    
	

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/sam_e54_xpro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES} ${CRYPTOAUTHLIB_OBJECTFILES} nbproject/Makefile-${CND_CONF}.mk ../src/config/sam_e54_xpro/ATSAME54P20A.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o dist/${CND_CONF}/${IMAGE_TYPE}/sam_e54_xpro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED} ${CRYPTOAUTHLIB_OBJECTFILES_QUOTED_IF_SPACED}         -DXPRJ_sam_e54_xpro=$(CND_CONF)     $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/sam_e54_xpro.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES} ${CRYPTOAUTHLIB_OBJECTFILES} nbproject/Makefile-${CND_CONF}.mk ../src/config/sam_e54_xpro/ATSAME54P20A.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o dist/${CND_CONF}/${IMAGE_TYPE}/sam_e54_xpro.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED} ${CRYPTOAUTHLIB_OBJECTFILES_QUOTED_IF_SPACED}        -DXPRJ_sam_e54_xpro=$(CND_CONF)      $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	${MP_BIN2HEX} dist/${CND_CONF}/${IMAGE_TYPE}/sam_e54_xpro.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/sam_e54_xpro
	${RM} -r dist/sam_e54_xpro
