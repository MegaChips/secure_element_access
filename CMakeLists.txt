cmake_minimum_required(VERSION 3.18)

set(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_LIST_DIR}/xc32.cmake" CACHE INTERNAL "")

if("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_BINARY_DIR}")
    message(FATAL_ERROR "In-source build is not allowed, please use a separate build folder.")
endif()

project(secure_ic_access)

if(CMAKE_CROSSCOMPILING)
    enable_language(ASM)
endif()

set(TARGET_BOARD)

if ("${BOARD}" STREQUAL "same54_xpro")
    set(TARGET_BOARD "same54_xpro")
    set(mp_processor "ATSAME54P20A")
elseif("${BOARD}" STREQUAL "samd51_micromod")
    set(TARGET_BOARD "samd51_micromod")
    set(mp_processor "ATSAMD51J20A")
elseif("${BOARD}" STREQUAL "samd51_mcu")
    set(TARGET_BOARD "samd51_mcu")
    set(mp_processor "ATSAMD51J20A")
else()
    message(FATAL_ERROR "Board is not supported")
endif()

unset(BOARD CACHE)

set(exe_target secure_element_access)
set(CMAKE_EXECUTABLE_SUFFIX ".elf")

set(CMAKE_C_FLAGS_DEBUG "-D__DEBUG -g")

get_filename_component(__root_dir "${CMAKE_CURRENT_LIST_DIR}/firmware/src" ABSOLUTE)
set(xc32_dfp "${__root_dir}/packs/${mp_processor}_DFP")
set(cfg_dir "${__root_dir}/config/${TARGET_BOARD}")
set(rtos_dir "${__root_dir}/third_party/rtos/FreeRTOS/Source")
set(cli_dir "${__root_dir}/FreeRTOS-Plus-CLI")
set(lib_dir "${cfg_dir}/library/cryptoauthlib")
set(peripheral_dir "${cfg_dir}/peripheral")

set(c_flags
    "-mprocessor=${mp_processor}"
    "-O1"
    "-mdfp=${xc32_dfp}"
)

set(
    linker_flags
    "-mprocessor=${mp_processor}"
    "-mdfp=${xc32_dfp}"
    "-mno-newlib-nano"
    "-mno-device-startup-code"
    "-Wl,--defsym=__MPLAB_BUILD=1"
    "-Wl,--script=${cfg_dir}/${mp_processor}.ld"
    "-Wl,-Map=output.map"
    "-Wl,--report-mem"
    "-Wl,--defsym=_min_heap_size=1024"
    "-Wl,--defsym=_min_stack_size=1000"
    "-Wl,--gc-sections"
    "-Wl,-DROM_LENGTH=0xf0000"
    "-Wl,-DROM_ORIGIN=0x00000"
)

set(
    misc_src
    "${__root_dir}/atca_cert_chain.c"
    "${__root_dir}/CLI_command_cryptoauthlib.c"
    "${__root_dir}/CLI_task.c"
    "${__root_dir}/main.c"
    "${cfg_dir}/tasks.c"
    "${cfg_dir}/startup_xc32.c"
    "${cfg_dir}/libc_syscalls.c"
    "${cfg_dir}/initialization.c"
    "${cfg_dir}/interrupts.c"
    "${cfg_dir}/freertos_hooks.c"
    "${cfg_dir}/exceptions.c"
    "${cfg_dir}/bsp/bsp.c"
    "${cfg_dir}/osal/osal_freertos.c"
    "${cfg_dir}/stdio/xc32_monitor.c"
)

set(
    misc_inc
    "${__root_dir}"
    "${cfg_dir}"
    "${cfg_dir}/bsp"
    "${cfg_dir}/osal"
    "${xc32_dfp}"
)

set(
    rtos_src
    "${rtos_dir}/portable/GCC/SAM/ARM_CM4F/port.c"
    "${rtos_dir}/portable/MemMang/heap_1.c"
    "${rtos_dir}/croutine.c"
    "${rtos_dir}/event_groups.c"
    "${rtos_dir}/FreeRTOS_tasks.c"
    "${rtos_dir}/list.c"
    "${rtos_dir}/queue.c"
    "${rtos_dir}/stream_buffer.c"
    "${rtos_dir}/timers.c"
)

set(
    rtos_inc
    "${rtos_dir}/include"
    "${rtos_dir}/portable/GCC/SAM/ARM_CM4F"
)

set(
    cli_src
    "${cli_dir}/FreeRTOS_CLI.c"
)

set(
    cli_inc
    "${cli_dir}"
)

set(
    lib_src
    "${lib_dir}/app/pkcs11/trust_pkcs11_config.c"
    "${lib_dir}/atcacert/atcacert_client.c"
    "${lib_dir}/atcacert/atcacert_date.c"
    "${lib_dir}/atcacert/atcacert_def.c"
    "${lib_dir}/atcacert/atcacert_der.c"
    "${lib_dir}/atcacert/atcacert_host_hw.c"
    "${lib_dir}/atcacert/atcacert_host_sw.c"
    "${lib_dir}/atcacert/atcacert_pem.c"
    "${lib_dir}/calib/calib_aes.c"
    "${lib_dir}/calib/calib_aes_gcm.c"
    "${lib_dir}/calib/calib_basic.c"
    "${lib_dir}/calib/calib_checkmac.c"
    "${lib_dir}/calib/calib_command.c"
    "${lib_dir}/calib/calib_counter.c"
    "${lib_dir}/calib/calib_derivekey.c"
    "${lib_dir}/calib/calib_ecdh.c"
    "${lib_dir}/calib/calib_execution.c"
    "${lib_dir}/calib/calib_gendig.c"
    "${lib_dir}/calib/calib_genkey.c"
    "${lib_dir}/calib/calib_hmac.c"
    "${lib_dir}/calib/calib_info.c"
    "${lib_dir}/calib/calib_kdf.c"
    "${lib_dir}/calib/calib_lock.c"
    "${lib_dir}/calib/calib_mac.c"
    "${lib_dir}/calib/calib_nonce.c"
    "${lib_dir}/calib/calib_privwrite.c"
    "${lib_dir}/calib/calib_random.c"
    "${lib_dir}/calib/calib_read.c"
    "${lib_dir}/calib/calib_secureboot.c"
    "${lib_dir}/calib/calib_selftest.c"
    "${lib_dir}/calib/calib_sha.c"
    "${lib_dir}/calib/calib_sign.c"
    "${lib_dir}/calib/calib_updateextra.c"
    "${lib_dir}/calib/calib_verify.c"
    "${lib_dir}/calib/calib_write.c"
    "${lib_dir}/crypto/hashes/sha1_routines.c"
    "${lib_dir}/crypto/hashes/sha2_routines.c"
    "${lib_dir}/crypto/atca_crypto_hw_aes_cbc.c"
    "${lib_dir}/crypto/atca_crypto_hw_aes_cmac.c"
    "${lib_dir}/crypto/atca_crypto_hw_aes_ctr.c"
    "${lib_dir}/crypto/atca_crypto_sw_ecdsa.c"
    "${lib_dir}/crypto/atca_crypto_sw_rand.c"
    "${lib_dir}/crypto/atca_crypto_sw_sha1.c"
    "${lib_dir}/crypto/atca_crypto_sw_sha2.c"
    "${lib_dir}/hal/ATECC608_0.c"
    "${lib_dir}/hal/atca_hal.c"
    "${lib_dir}/hal/hal_freertos.c"
    "${lib_dir}/hal/hal_i2c_harmony.c"
    "${lib_dir}/hal/hal_harmony_init.c"
    "${lib_dir}/hal/hal_cortex_m_delay.c"
    "${lib_dir}/host/atca_host.c"
    "${lib_dir}/jwt/atca_jwt.c"
    "${lib_dir}/pkcs11/pkcs11_attrib.c"
    "${lib_dir}/pkcs11/pkcs11_cert.c"
    "${lib_dir}/pkcs11/pkcs11_config.c"
    "${lib_dir}/pkcs11/pkcs11_debug.c"
    "${lib_dir}/pkcs11/pkcs11_digest.c"
    "${lib_dir}/pkcs11/pkcs11_find.c"
    "${lib_dir}/pkcs11/pkcs11_info.c"
    "${lib_dir}/pkcs11/pkcs11_init.c"
    "${lib_dir}/pkcs11/pkcs11_key.c"
    "${lib_dir}/pkcs11/pkcs11_main.c"
    "${lib_dir}/pkcs11/pkcs11_mech.c"
    "${lib_dir}/pkcs11/pkcs11_object.c"
    "${lib_dir}/pkcs11/pkcs11_os.c"
    "${lib_dir}/pkcs11/pkcs11_session.c"
    "${lib_dir}/pkcs11/pkcs11_signature.c"
    "${lib_dir}/pkcs11/pkcs11_slot.c"
    "${lib_dir}/pkcs11/pkcs11_token.c"
    "${lib_dir}/pkcs11/pkcs11_util.c"
    "${lib_dir}/atca_basic.c"
    "${lib_dir}/atca_cfgs.c"
    "${lib_dir}/atca_command.c"
    "${lib_dir}/atca_debug.c"
    "${lib_dir}/atca_device.c"
    "${lib_dir}/atca_helpers.c"
    "${lib_dir}/atca_iface.c"
    "${lib_dir}/atca_utils_sizes.c"
)

set(
    lib_inc
    "${lib_dir}"
    "${lib_dir}/crypto"
    "${lib_dir}/pkcs11"
)

set(
    peripheral_src
    "${peripheral_dir}/clock/plib_clock.c"
    "${peripheral_dir}/cmcc/plib_cmcc.c"
    "${peripheral_dir}/eic/plib_eic.c"
    "${peripheral_dir}/evsys/plib_evsys.c"
    "${peripheral_dir}/nvic/plib_nvic.c"
    "${peripheral_dir}/nvmctrl/plib_nvmctrl.c"
    "${peripheral_dir}/port/plib_port.c"
)

if ("${TARGET_BOARD}" STREQUAL "same54_xpro")
    list(
        APPEND
        peripheral_src
        "${peripheral_dir}/sercom/i2c_master/plib_sercom7_i2c_master.c"
        "${peripheral_dir}/sercom/usart/plib_sercom2_usart.c"
    )
elseif("${TARGET_BOARD}" STREQUAL "samd51_micromod")
    list(
        APPEND
        peripheral_src
        "${peripheral_dir}/sercom/i2c_master/plib_sercom3_i2c_master.c"
        "${peripheral_dir}/sercom/usart/plib_sercom5_usart.c"
    )
    elseif("${TARGET_BOARD}" STREQUAL "samd51_mcu")
    list(
        APPEND
        peripheral_src
        "${peripheral_dir}/sercom/i2c_master/plib_sercom2_i2c_master.c"
        "${peripheral_dir}/sercom/usart/plib_sercom0_usart.c"
    )
else()
endif()

set(
    inc_dirs
    ${misc_inc}
    ${lib_inc}
    ${rtos_inc}
    ${cli_inc}
)

add_executable(
    ${exe_target}
    ${misc_src}
    ${peripheral_src}
    ${lib_src}
    ${rtos_src}
    ${cli_src}
)

target_compile_options(
    ${exe_target}
    PRIVATE
    $<$<NOT:$<COMPILE_LANGUAGE:ASM>>:${c_flags}>
)

target_include_directories(
    ${exe_target}
    PRIVATE
    $<$<NOT:$<COMPILE_LANGUAGE:ASM>>:${inc_dirs}>
)

target_link_options(
    ${exe_target}
    PRIVATE
        ${linker_flags}
)

set(ihex_file "$<TARGET_FILE_DIR:${exe_target}>/${exe_target}.hex")
add_custom_command(
    TARGET ${exe_target} POST_BUILD
    COMMAND "${COMPILER_OBJCOPY}" -O ihex "$<TARGET_FILE_DIR:${exe_target}>/${exe_target}${CMAKE_EXECUTABLE_SUFFIX}" "${ihex_file}"
)

find_package(PythonInterp REQUIRED)
set(bin_file "$<TARGET_FILE_DIR:${exe_target}>/${exe_target}.bin")
add_custom_command(
    TARGET ${exe_target} POST_BUILD
    COMMAND "${PYTHON_EXECUTABLE}" "${CMAKE_CURRENT_LIST_DIR}/python/ihex2bin.py" "--input=${ihex_file}" "--output=${bin_file}"
)