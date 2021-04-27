###########################################################################
## Makefile generated for component 'Fuzzy0'. 
## 
## Makefile     : Fuzzy0.mk
## Generated on : Sat Apr 24 14:36:37 2021
## Final product: $(RELATIVE_PATH_TO_ANCHOR)/Fuzzy0.elf
## Product type : executable
## 
###########################################################################

###########################################################################
## MACROS
###########################################################################

# Macro Descriptions:
# PRODUCT_NAME            Name of the system to build
# MAKEFILE                Name of this makefile
# COMPILER_COMMAND_FILE   Compiler command listing model reference header paths
# CMD_FILE                Command file

PRODUCT_NAME              = Fuzzy0
MAKEFILE                  = Fuzzy0.mk
MATLAB_ROOT               = D:/PROGRA~1/MATLAB/R2020b
MATLAB_BIN                = D:/PROGRA~1/MATLAB/R2020b/bin
MATLAB_ARCH_BIN           = $(MATLAB_BIN)/win64
START_DIR                 = D:/ONEDRI~1/4THYEA~1/Capstone/MATLAB/FUZZYL~1
SOLVER                    = 
SOLVER_OBJ                = 
CLASSIC_INTERFACE         = 0
TGT_FCN_LIB               = None
MODEL_HAS_DYNAMICALLY_LOADED_SFCNS = 0
RELATIVE_PATH_TO_ANCHOR   = ..
COMPILER_COMMAND_FILE     = Fuzzy0_comp.rsp
CMD_FILE                  = Fuzzy0.rsp
C_STANDARD_OPTS           = 
CPP_STANDARD_OPTS         = 

###########################################################################
## TOOLCHAIN SPECIFICATIONS
###########################################################################

# Toolchain Name:          GNU Tools for ARM Embedded Processors
# Supported Version(s):    
# ToolchainInfo Version:   2020b
# Specification Revision:  1.0
# 
#-------------------------------------------
# Macros assumed to be defined elsewhere
#-------------------------------------------

# TARGET_LOAD_CMD_ARGS
# TARGET_LOAD_CMD
# MW_GNU_ARM_TOOLS_PATH
# FDATASECTIONS_FLG

#-----------
# MACROS
#-----------

LIBGCC                = ${shell $(MW_GNU_ARM_TOOLS_PATH)/arm-none-eabi-gcc ${CFLAGS} -print-libgcc-file-name}
LIBC                  = ${shell $(MW_GNU_ARM_TOOLS_PATH)/arm-none-eabi-gcc ${CFLAGS} -print-file-name=libc.a}
LIBM                  = ${shell $(MW_GNU_ARM_TOOLS_PATH)/arm-none-eabi-gcc ${CFLAGS} -print-file-name=libm.a}
PRODUCT_BIN           = $(RELATIVE_PATH_TO_ANCHOR)/$(PRODUCT_NAME).bin
PRODUCT_HEX           = $(RELATIVE_PATH_TO_ANCHOR)/$(PRODUCT_NAME).hex
CPFLAGS               = -O binary
SHELL                 = %SystemRoot%/system32/cmd.exe

TOOLCHAIN_SRCS = 
TOOLCHAIN_INCS = 
TOOLCHAIN_LIBS = -lm

#------------------------
# BUILD TOOL COMMANDS
#------------------------

# Assembler: GNU ARM Assembler
AS_PATH = $(MW_GNU_ARM_TOOLS_PATH)
AS = "$(AS_PATH)/arm-none-eabi-gcc"

# C Compiler: GNU ARM C Compiler
CC_PATH = $(MW_GNU_ARM_TOOLS_PATH)
CC = "$(CC_PATH)/arm-none-eabi-gcc"

# Linker: GNU ARM Linker
LD_PATH = $(MW_GNU_ARM_TOOLS_PATH)
LD = "$(LD_PATH)/arm-none-eabi-g++"

# C++ Compiler: GNU ARM C++ Compiler
CPP_PATH = $(MW_GNU_ARM_TOOLS_PATH)
CPP = "$(CPP_PATH)/arm-none-eabi-g++"

# C++ Linker: GNU ARM C++ Linker
CPP_LD_PATH = $(MW_GNU_ARM_TOOLS_PATH)
CPP_LD = "$(CPP_LD_PATH)/arm-none-eabi-g++"

# Archiver: GNU ARM Archiver
AR_PATH = $(MW_GNU_ARM_TOOLS_PATH)
AR = "$(AR_PATH)/arm-none-eabi-ar"

# MEX Tool: MEX Tool
MEX_PATH = $(MATLAB_ARCH_BIN)
MEX = "$(MEX_PATH)/mex"

# Binary Converter: Binary Converter
OBJCOPYPATH = $(MW_GNU_ARM_TOOLS_PATH)
OBJCOPY = "$(OBJCOPYPATH)/arm-none-eabi-objcopy"

# Hex Converter: Hex Converter
OBJCOPYPATH = $(MW_GNU_ARM_TOOLS_PATH)
OBJCOPY = "$(OBJCOPYPATH)/arm-none-eabi-objcopy"

# Executable Size: Executable Size
EXESIZEPATH = $(MW_GNU_ARM_TOOLS_PATH)
EXESIZE = "$(EXESIZEPATH)/arm-none-eabi-size"

# Download: Download
DOWNLOAD =

# Execute: Execute
EXECUTE = $(PRODUCT)

# Builder: GMAKE Utility
MAKE_PATH = %MATLAB%\bin\win64
MAKE = "$(MAKE_PATH)/gmake"


#-------------------------
# Directives/Utilities
#-------------------------

ASDEBUG             = -g
AS_OUTPUT_FLAG      = -o
CDEBUG              = -g
C_OUTPUT_FLAG       = -o
LDDEBUG             = -g
OUTPUT_FLAG         = -o
CPPDEBUG            = -g
CPP_OUTPUT_FLAG     = -o
CPPLDDEBUG          = -g
OUTPUT_FLAG         = -o
ARDEBUG             =
STATICLIB_OUTPUT_FLAG =
MEX_DEBUG           = -g
RM                  = @del /f/q
ECHO                = @echo
MV                  = @move
RUN                 =

#----------------------------------------
# "Faster Builds" Build Configuration
#----------------------------------------

ARFLAGS              = ruvs
ASFLAGS              = -MMD -MP -MF"$(@:%.o=%.dep)" -MT"$@"  \
                       -Wall \
                       -x assembler-with-cpp \
                       $(ASFLAGS_ADDITIONAL) \
                       $(DEFINES) \
                       $(INCLUDES) \
                       -c
OBJCOPYFLAGS_BIN     = -O binary $(PRODUCT) $(PRODUCT_BIN)
CFLAGS               = $(FDATASECTIONS_FLG) \
                       -Wall \
                       -MMD -MP -MF"$(@:%.o=%.dep)" -MT"$@"  \
                       -c \
                       -O0
CPPFLAGS             = -std=gnu++14 \
                       -fno-rtti \
                       -fno-exceptions \
                       $(FDATASECTIONS_FLG) \
                       -Wall \
                       -MMD -MP -MF"$(@:%.o=%.dep)" -MT"$@"  \
                       -c \
                       -O0
CPP_LDFLAGS          = -Wl,--gc-sections \
                       -Wl,-Map="$(PRODUCT_NAME).map"
CPP_SHAREDLIB_LDFLAGS  =
DOWNLOAD_FLAGS       =
EXESIZE_FLAGS        = $(PRODUCT)
EXECUTE_FLAGS        =
OBJCOPYFLAGS_HEX     = -O ihex $(PRODUCT) $(PRODUCT_HEX)
LDFLAGS              = -Wl,--gc-sections \
                       -Wl,-Map="$(PRODUCT_NAME).map"
MEX_CPPFLAGS         =
MEX_CPPLDFLAGS       =
MEX_CFLAGS           =
MEX_LDFLAGS          =
MAKE_FLAGS           = -f $(MAKEFILE)
SHAREDLIB_LDFLAGS    =



###########################################################################
## OUTPUT INFO
###########################################################################

PRODUCT = $(RELATIVE_PATH_TO_ANCHOR)/Fuzzy0.elf
PRODUCT_TYPE = "executable"
BUILD_TYPE = "Top-Level Standalone Executable"

###########################################################################
## INCLUDE PATHS
###########################################################################

INCLUDES_BUILDINFO = 

INCLUDES = $(INCLUDES_BUILDINFO)

###########################################################################
## DEFINES
###########################################################################

DEFINES_ = -D__MW_TARGET_USE_HARDWARE_RESOURCES_H__
DEFINES_BUILD_ARGS = -DCLASSIC_INTERFACE=0 -DALLOCATIONFCN=0 -DTERMFCN=0 -DONESTEPFCN=1 -DMAT_FILE=0 -DMULTI_INSTANCE_CODE=0 -DINTEGER_CODE=0 -DMT=0
DEFINES_CUSTOM = 
DEFINES_OPTS = -DTID01EQ=0
DEFINES_SKIPFORSIL = -DNULL=0 -DEXIT_FAILURE=1 -DEXTMODE_DISABLEPRINTF -DEXTMODE_DISABLETESTING -DEXTMODE_DISABLE_ARGS_PROCESSING=1 -DTARGET_KL25Z -DTARGET_M0P -DTARGET_Freescale -DTOOLCHAIN_GCC_ARM -DTOOLCHAIN_GCC -D__CORTEX_M0PLUS -DARM_MATH_CM0PLUS -DTARGET_FF_ARDUINO -DTARGET_KLXX -DTARGET_CORTEX_M -DTARGET_LIKE_MBED -D__MBED__=1 -DTARGET_LIKE_CORTEX_M0 -DMBED_CONF_PLATFORM_DEFAULT_SERIAL_BAUD_RATE=9600 -DSTACK_SIZE=64 -DRT
DEFINES_STANDARD = -DMODEL=Fuzzy0 -DNUMST=1 -DNCSTATES=0 -DHAVESTDIO -DMODEL_HAS_DYNAMICALLY_LOADED_SFCNS=0

DEFINES = $(DEFINES_) $(DEFINES_BUILD_ARGS) $(DEFINES_CUSTOM) $(DEFINES_OPTS) $(DEFINES_SKIPFORSIL) $(DEFINES_STANDARD)

###########################################################################
## SOURCE FILES
###########################################################################

SRCS = $(START_DIR)/Fuzzy0_ert_rtw/Fuzzy0.c $(START_DIR)/Fuzzy0_ert_rtw/Fuzzy0_data.c C:/ProgramData/MATLAB/SupportPackages/R2020b/toolbox/target/supportpackages/freedomboard/src/BoardInit.c C:/ProgramData/MATLAB/SupportPackages/R2020b/toolbox/target/supportpackages/freedomboard/src/BufferedSerial.cpp C:/ProgramData/MATLAB/SupportPackages/R2020b/toolbox/target/supportpackages/armcortexmbase/scheduler/src/SysTickScheduler.c C:/ProgramData/MATLAB/SupportPackages/R2020b/toolbox/target/supportpackages/armcortexmbase/scheduler/src/m0m1m0plus_multitasking.c

MAIN_SRC = $(START_DIR)/Fuzzy0_ert_rtw/ert_main.c

ALL_SRCS = $(SRCS) $(MAIN_SRC)

###########################################################################
## OBJECTS
###########################################################################

OBJS = Fuzzy0.o Fuzzy0_data.o BoardInit.o BufferedSerial.o SysTickScheduler.o m0m1m0plus_multitasking.o

MAIN_OBJ = ert_main.o

ALL_OBJS = $(OBJS) $(MAIN_OBJ)

###########################################################################
## PREBUILT OBJECT FILES
###########################################################################

PREBUILT_OBJS = 

###########################################################################
## LIBRARIES
###########################################################################

LIBS = C:/ProgramData/MATLAB/SupportPackages/R2020b/3P.instrset/mbedlibrary-stm.instrset/0f02307a0877/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/libmbed.a C:/ProgramData/MATLAB/SupportPackages/R2020b/3P.instrset/cmsis.instrset/CMSIS/Lib/GCC/libarm_cortexM0l_math.a

###########################################################################
## SYSTEM LIBRARIES
###########################################################################

SYSTEM_LIBS = 

###########################################################################
## ADDITIONAL TOOLCHAIN FLAGS
###########################################################################

#---------------
# C Compiler
#---------------

CFLAGS_SKIPFORSIL = -mcpu=cortex-m0plus -mthumb -fno-exceptions -fno-common -fmessage-length=0 -DTARGET_KL25Z -D__MBED__=1 -DDEVICE_I2CSLAVE=1 -DTARGET_LIKE_MBED -DTARGET_Freescale -DDEVICE_PORTINOUT=1 -D__MBED_CMSIS_RTOS_CM -DTOOLCHAIN_object -D__CMSIS_RTOS -DTARGET_KLXX -DDEVICE_SPISLAVE=1 -DTARGET_CORTEX_M -DTARGET_M0P -DDEVICE_ANALOGOUT=1 -DTARGET_UVISOR_UNSUPPORTED -DDEVICE_SERIAL=1 -DDEVICE_INTERRUPTIN=1 -DDEVICE_I2C=1 -DDEVICE_PORTOUT=1 -D__CORTEX_M0PLUS -DDEVICE_STDIO_MESSAGES=1 -DTARGET_FF_ARDUINO -DTARGET_RELEASE -DTOOLCHAIN_GCC -DARM_MATH_CM0PLUS -DDEVICE_PORTIN=1 -DDEVICE_SLEEP=1 -DTOOLCHAIN_GCC_ARM -DDEVICE_SPI=1 -DDEVICE_ERROR_RED=1 -DDEVICE_ANALOGIN=1 -DDEVICE_PWMOUT=1 -DDEVICE_SEMIHOST=1 -DTARGET_LIKE_CORTEX_M0
CFLAGS_BASIC = $(DEFINES) $(INCLUDES) @$(COMPILER_COMMAND_FILE)

CFLAGS += $(CFLAGS_SKIPFORSIL) $(CFLAGS_BASIC)

#-----------------
# C++ Compiler
#-----------------

CPPFLAGS_SKIPFORSIL = -mcpu=cortex-m0plus -mthumb -fno-exceptions -fno-common -fmessage-length=0 -DTARGET_KL25Z -D__MBED__=1 -DDEVICE_I2CSLAVE=1 -DTARGET_LIKE_MBED -DTARGET_Freescale -DDEVICE_PORTINOUT=1 -D__MBED_CMSIS_RTOS_CM -DTOOLCHAIN_object -D__CMSIS_RTOS -DTARGET_KLXX -DDEVICE_SPISLAVE=1 -DTARGET_CORTEX_M -DTARGET_M0P -DDEVICE_ANALOGOUT=1 -DTARGET_UVISOR_UNSUPPORTED -DDEVICE_SERIAL=1 -DDEVICE_INTERRUPTIN=1 -DDEVICE_I2C=1 -DDEVICE_PORTOUT=1 -D__CORTEX_M0PLUS -DDEVICE_STDIO_MESSAGES=1 -DTARGET_FF_ARDUINO -DTARGET_RELEASE -DTOOLCHAIN_GCC -DARM_MATH_CM0PLUS -DDEVICE_PORTIN=1 -DDEVICE_SLEEP=1 -DTOOLCHAIN_GCC_ARM -DDEVICE_SPI=1 -DDEVICE_ERROR_RED=1 -DDEVICE_ANALOGIN=1 -DDEVICE_PWMOUT=1 -DDEVICE_SEMIHOST=1 -DTARGET_LIKE_CORTEX_M0
CPPFLAGS_BASIC = $(DEFINES) $(INCLUDES) @$(COMPILER_COMMAND_FILE)

CPPFLAGS += $(CPPFLAGS_SKIPFORSIL) $(CPPFLAGS_BASIC)

#---------------
# C++ Linker
#---------------

CPP_LDFLAGS_SKIPFORSIL = -mcpu=cortex-m0plus -mthumb --specs=nano.specs --specs=nosys.specs -T"C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/MKL25Z4.ld" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/cmsis_nvic.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/startup_MKL25Z4.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/mbed_retarget.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/system_MKL25Z4.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/analogin_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/analogout_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/gpio_irq_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/gpio_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/i2c_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/mbed_board.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/mbed_overrides.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/PeripheralPins.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/pinmap.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/port_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/pwmout_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/rtc_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/serial_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/sleep.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/spi_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/us_ticker.o"

CPP_LDFLAGS += $(CPP_LDFLAGS_SKIPFORSIL)

#------------------------------
# C++ Shared Library Linker
#------------------------------

CPP_SHAREDLIB_LDFLAGS_SKIPFORSIL = -mcpu=cortex-m0plus -mthumb --specs=nano.specs --specs=nosys.specs -T"C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/MKL25Z4.ld" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/cmsis_nvic.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/startup_MKL25Z4.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/mbed_retarget.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/system_MKL25Z4.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/analogin_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/analogout_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/gpio_irq_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/gpio_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/i2c_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/mbed_board.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/mbed_overrides.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/PeripheralPins.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/pinmap.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/port_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/pwmout_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/rtc_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/serial_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/sleep.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/spi_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/us_ticker.o"

CPP_SHAREDLIB_LDFLAGS += $(CPP_SHAREDLIB_LDFLAGS_SKIPFORSIL)

#-----------
# Linker
#-----------

LDFLAGS_SKIPFORSIL = -mcpu=cortex-m0plus -mthumb --specs=nano.specs --specs=nosys.specs -T"C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/MKL25Z4.ld" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/cmsis_nvic.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/startup_MKL25Z4.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/mbed_retarget.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/system_MKL25Z4.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/analogin_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/analogout_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/gpio_irq_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/gpio_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/i2c_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/mbed_board.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/mbed_overrides.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/PeripheralPins.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/pinmap.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/port_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/pwmout_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/rtc_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/serial_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/sleep.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/spi_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/us_ticker.o"

LDFLAGS += $(LDFLAGS_SKIPFORSIL)

#---------------------
# MEX C++ Compiler
#---------------------

MEX_CPP_Compiler_BASIC =  @$(COMPILER_COMMAND_FILE)

MEX_CPPFLAGS += $(MEX_CPP_Compiler_BASIC)

#-----------------
# MEX Compiler
#-----------------

MEX_Compiler_BASIC =  @$(COMPILER_COMMAND_FILE)

MEX_CFLAGS += $(MEX_Compiler_BASIC)

#--------------------------
# Shared Library Linker
#--------------------------

SHAREDLIB_LDFLAGS_SKIPFORSIL = -mcpu=cortex-m0plus -mthumb --specs=nano.specs --specs=nosys.specs -T"C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/MKL25Z4.ld" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/cmsis_nvic.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/startup_MKL25Z4.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/mbed_retarget.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/system_MKL25Z4.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/analogin_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/analogout_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/gpio_irq_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/gpio_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/i2c_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/mbed_board.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/mbed_overrides.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/PeripheralPins.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/pinmap.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/port_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/pwmout_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/rtc_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/serial_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/sleep.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/spi_api.o" "C:/PROGRA~3/MATLAB/SUPPOR~1/R2020b/3P778C~1.INS/MBEDLI~1.INS/0F0230~1/TARGET_KL25Z/TOOLCHAIN_GCC_ARM/us_ticker.o"

SHAREDLIB_LDFLAGS += $(SHAREDLIB_LDFLAGS_SKIPFORSIL)

###########################################################################
## INLINED COMMANDS
###########################################################################


ALL_DEPS:=$(patsubst %.o,%.dep,$(ALL_OBJS))
all:

ifndef DISABLE_GCC_FUNCTION_DATA_SECTIONS
FDATASECTIONS_FLG := -ffunction-sections -fdata-sections
endif



-include codertarget_assembly_flags.mk
-include ../codertarget_assembly_flags.mk
-include ../../codertarget_assembly_flags.mk
-include $(ALL_DEPS)


###########################################################################
## PHONY TARGETS
###########################################################################

.PHONY : all build buildobj clean info prebuild postbuild download execute


all : build postbuild
	@echo "### Successfully generated all binary outputs."


build : prebuild $(PRODUCT)


buildobj : prebuild $(OBJS) $(PREBUILT_OBJS) $(LIBS)
	@echo "### Successfully generated all binary outputs."


prebuild : 


postbuild : $(PRODUCT)
	@echo "### Invoking postbuild tool "Binary Converter" ..."
	$(OBJCOPY) $(OBJCOPYFLAGS_BIN)
	@echo "### Done invoking postbuild tool."
	@echo "### Invoking postbuild tool "Hex Converter" ..."
	$(OBJCOPY) $(OBJCOPYFLAGS_HEX)
	@echo "### Done invoking postbuild tool."
	@echo "### Invoking postbuild tool "Executable Size" ..."
	$(EXESIZE) $(EXESIZE_FLAGS)
	@echo "### Done invoking postbuild tool."


download : postbuild


execute : download
	@echo "### Invoking postbuild tool "Execute" ..."
	$(EXECUTE) $(EXECUTE_FLAGS)
	@echo "### Done invoking postbuild tool."


###########################################################################
## FINAL TARGET
###########################################################################

#-------------------------------------------
# Create a standalone executable            
#-------------------------------------------

$(PRODUCT) : $(OBJS) $(PREBUILT_OBJS) $(LIBS) $(MAIN_OBJ)
	@echo "### Creating standalone executable "$(PRODUCT)" ..."
	$(CPP_LD) $(CPP_LDFLAGS) -o $(PRODUCT) @$(CMD_FILE) $(LIBS) $(SYSTEM_LIBS) $(TOOLCHAIN_LIBS)
	@echo "### Created: $(PRODUCT)"


###########################################################################
## INTERMEDIATE TARGETS
###########################################################################

#---------------------
# SOURCE-TO-OBJECT
#---------------------

%.o : %.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : %.s
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.o : %.S
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.o : %.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : %.cc
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : %.C
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : %.cxx
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.s
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.S
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.cc
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.C
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.cxx
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/%.s
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/%.S
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/%.cc
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/%.C
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/%.cxx
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/Fuzzy0_ert_rtw/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/Fuzzy0_ert_rtw/%.s
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/Fuzzy0_ert_rtw/%.S
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/Fuzzy0_ert_rtw/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/Fuzzy0_ert_rtw/%.cc
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/Fuzzy0_ert_rtw/%.C
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/Fuzzy0_ert_rtw/%.cxx
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(MATLAB_ROOT)/rtw/c/src/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : $(MATLAB_ROOT)/rtw/c/src/%.s
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.o : $(MATLAB_ROOT)/rtw/c/src/%.S
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.o : $(MATLAB_ROOT)/rtw/c/src/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(MATLAB_ROOT)/rtw/c/src/%.cc
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(MATLAB_ROOT)/rtw/c/src/%.C
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(MATLAB_ROOT)/rtw/c/src/%.cxx
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(MATLAB_ROOT)/simulink/src/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : $(MATLAB_ROOT)/simulink/src/%.s
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.o : $(MATLAB_ROOT)/simulink/src/%.S
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.o : $(MATLAB_ROOT)/simulink/src/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(MATLAB_ROOT)/simulink/src/%.cc
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(MATLAB_ROOT)/simulink/src/%.C
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(MATLAB_ROOT)/simulink/src/%.cxx
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


Fuzzy0.o : $(START_DIR)/Fuzzy0_ert_rtw/Fuzzy0.c
	$(CC) $(CFLAGS) -o "$@" "$<"


Fuzzy0_data.o : $(START_DIR)/Fuzzy0_ert_rtw/Fuzzy0_data.c
	$(CC) $(CFLAGS) -o "$@" "$<"


ert_main.o : $(START_DIR)/Fuzzy0_ert_rtw/ert_main.c
	$(CC) $(CFLAGS) -o "$@" "$<"


BoardInit.o : C:/ProgramData/MATLAB/SupportPackages/R2020b/toolbox/target/supportpackages/freedomboard/src/BoardInit.c
	$(CC) $(CFLAGS) -o "$@" "$<"


BufferedSerial.o : C:/ProgramData/MATLAB/SupportPackages/R2020b/toolbox/target/supportpackages/freedomboard/src/BufferedSerial.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


SysTickScheduler.o : C:/ProgramData/MATLAB/SupportPackages/R2020b/toolbox/target/supportpackages/armcortexmbase/scheduler/src/SysTickScheduler.c
	$(CC) $(CFLAGS) -o "$@" "$<"


m0m1m0plus_multitasking.o : C:/ProgramData/MATLAB/SupportPackages/R2020b/toolbox/target/supportpackages/armcortexmbase/scheduler/src/m0m1m0plus_multitasking.c
	$(CC) $(CFLAGS) -o "$@" "$<"


###########################################################################
## DEPENDENCIES
###########################################################################

$(ALL_OBJS) : rtw_proj.tmw $(COMPILER_COMMAND_FILE) $(MAKEFILE)


###########################################################################
## MISCELLANEOUS TARGETS
###########################################################################

info : 
	@echo "### PRODUCT = $(PRODUCT)"
	@echo "### PRODUCT_TYPE = $(PRODUCT_TYPE)"
	@echo "### BUILD_TYPE = $(BUILD_TYPE)"
	@echo "### INCLUDES = $(INCLUDES)"
	@echo "### DEFINES = $(DEFINES)"
	@echo "### ALL_SRCS = $(ALL_SRCS)"
	@echo "### ALL_OBJS = $(ALL_OBJS)"
	@echo "### LIBS = $(LIBS)"
	@echo "### MODELREF_LIBS = $(MODELREF_LIBS)"
	@echo "### SYSTEM_LIBS = $(SYSTEM_LIBS)"
	@echo "### TOOLCHAIN_LIBS = $(TOOLCHAIN_LIBS)"
	@echo "### ASFLAGS = $(ASFLAGS)"
	@echo "### CFLAGS = $(CFLAGS)"
	@echo "### LDFLAGS = $(LDFLAGS)"
	@echo "### SHAREDLIB_LDFLAGS = $(SHAREDLIB_LDFLAGS)"
	@echo "### CPPFLAGS = $(CPPFLAGS)"
	@echo "### CPP_LDFLAGS = $(CPP_LDFLAGS)"
	@echo "### CPP_SHAREDLIB_LDFLAGS = $(CPP_SHAREDLIB_LDFLAGS)"
	@echo "### ARFLAGS = $(ARFLAGS)"
	@echo "### MEX_CFLAGS = $(MEX_CFLAGS)"
	@echo "### MEX_CPPFLAGS = $(MEX_CPPFLAGS)"
	@echo "### MEX_LDFLAGS = $(MEX_LDFLAGS)"
	@echo "### MEX_CPPLDFLAGS = $(MEX_CPPLDFLAGS)"
	@echo "### OBJCOPYFLAGS_BIN = $(OBJCOPYFLAGS_BIN)"
	@echo "### OBJCOPYFLAGS_HEX = $(OBJCOPYFLAGS_HEX)"
	@echo "### EXESIZE_FLAGS = $(EXESIZE_FLAGS)"
	@echo "### DOWNLOAD_FLAGS = $(DOWNLOAD_FLAGS)"
	@echo "### EXECUTE_FLAGS = $(EXECUTE_FLAGS)"
	@echo "### MAKE_FLAGS = $(MAKE_FLAGS)"


clean : 
	$(ECHO) "### Deleting all derived files..."
	$(RM) $(subst /,\,$(PRODUCT))
	$(RM) $(subst /,\,$(ALL_OBJS))
	$(RM) *.dep
	$(ECHO) "### Deleted all derived files."


