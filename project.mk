#=============================================
# SDK CONFIG
#=============================================
#USE_SDRAM = 1
#SWO_DEBUG_OUT_ENA = 1
WEB_INA219_DRV = 1
#WEB_MLX90614_DRV = 1
WEB_ADC_DRV = 1
#USE_SDCARD = 1
#USE_UVC = 1
#USE_AT = 1
#USE_FATFS = 1
#USE_SDIOH = 1
#USE_POLARSSL = 1
#USE_P2P_WPS = 1
#USE_GCC_LIB = 1
USE_MBED = 1

ifndef USE_AT
USE_NEWCONSOLE = 1
USE_WIFI_API = 1
endif

ifdef USE_SDCARD
USE_FATFS = 1
USE_SDIOH = 1
endif

#RTOSDIR=freertos_v8.1.2
RTOSDIR=freertos_v9.0.0
LWIPDIR=lwip_v1.4.1


ifdef USE_UVC
USE_SDRAM = 1
USE_GCC_LIB = 1
endif

include $(SDK_PATH)sdkset.mk
#CFLAGS += -DDEFAULT_BAUDRATE=1562500
CFLAGS += -DLOGUART_STACK_SIZE=1024
#=============================================
# User Files
#=============================================
#user main
ADD_SRC_C += project/src/user/main.c
ADD_SRC_C += project/src/user/user_start.c
# components
DRAM_C += project/src/console/atcmd_user.c
DRAM_C += project/src/console/wifi_console.c
#ADD_SRC_C += project/src/console/acl_tst.c
#DRAM_C += project/src/console/wlan_tst.c
#ADD_SRC_C += project/src/console/pwm_tst.c
#ADD_SRC_C += project/src/WS2812/ws2812_tst.c 
#ADD_SRC_C += project/src/WS2812/WS2812.c 

ifdef USE_SDCARD
ADD_SRC_C += project/src/console/sd_fat.c
endif

ifdef USE_UVC
ADD_SRC_C += project/src/console/uvc_capture_tst.c
endif

ifdef WEB_INA219_DRV
ADD_SRC_C += project/src/driver/i2c_drv.c
CFLAGS += -DUSE_I2C_CONSOLE=1
ADD_SRC_C += project/src/ina219/ina219drv.c
CFLAGS += -DWEB_INA219_DRV=1
endif

ifdef WEB_MLX90614_DRV
ADD_SRC_C += project/src/driver/i2c_drv.c
CFLAGS += -DUSE_I2C_CONSOLE=1
ADD_SRC_C += project/src/MLX90614/MLX90614.c
CFLAGS += -DWEB_MLX90614_DRV=1
endif

ifdef WEB_ADC_DRV
ADD_SRC_C += project/src/driver/adc_drv.c
ADD_SRC_C += project/src/adc_ws/adc_ws.c
CFLAGS += -DWEB_ADC_DRV=1
endif

#Web
INCLUDES += project/inc/web
ADD_SRC_C += project/src/tcpsrv/tcp_srv_conn.c
ADD_SRC_C += project/src/webfs/webfs.c

ifdef COMPILE_SCI
ADD_SRC_C += project/src/web/web_srv.c
ADD_SRC_C += project/src/web/web_utils.c
ADD_SRC_C += project/src/web/web_websocket.c
ADD_SRC_C += project/src/web/websock.c
ADD_SRC_C += project/src/web/web_auth.c
ADD_SRC_C += project/src/web/web_int_callbacks.c
ADD_SRC_C += project/src/web/web_int_vars.c
else
ADD_SRC_C += project/src/web/_sci_web.c
ADD_SRC_C += project/src/web/_sci_web_user.c
endif

ifdef SWO_DEBUG_OUT_ENA
CFLAGS += -DSWO_DEBUG_OUT_ENA=1
endif
