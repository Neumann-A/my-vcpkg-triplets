include(FetchContent)
FetchContent_Declare(
  arduino_toolchain
  GIT_REPOSITORY https://github.com/a9183756-gh/Arduino-CMake-Toolchain.git
  GIT_TAG        953b2e63ddf434868bfba60244fb714262fce5f4 # release-1.1-dev
)
if(NOT arduino_toolchain_POPULATED)
  # Fetch the content using previously declared details
  FetchContent_Populate(arduino_toolchain)
endif()
include(CMakePrintHelpers)
find_program(CMAKE_C_COMPILER NAMES avr-gcc PATHS ENV ARDUINO_BIN_DIR)
find_program(CMAKE_CXX_COMPILER NAMES avr-gcc PATHS ENV ARDUINO_BIN_DIR)
find_program(CMAKE_AR NAMES avr-ar PATHS ENV ARDUINO_BIN_DIR)
find_program(CMAKE_OBBJDUMP NAMES avr-objdump PATHS ENV ARDUINO_BIN_DIR)
find_program(CMAKE_RANLIB NAMES avr-ranlib PATHS ENV ARDUINO_BIN_DIR)
find_program(CMAKE_STRIP NAMES avr-strip PATHS ENV ARDUINO_BIN_DIR)
find_program(CMAKE_NM NAMES avr-nm PATHS ENV ARDUINO_BIN_DIR)
find_program(CMAKE_AVRDUDE NAMES avrdude PATHS ENV ARDUINO_BIN_DIR)

file(TO_CMAKE_PATH $ENV{ARDUINO_ROOT} ARDUINO_INSTALL_PATH)
cmake_print_variables(ARDUINO_INSTALL_PATH)

# Copyright (c) 2020 Arduino CMake Toolchain

###############################################################################
# This is an automatically generated template file for board options.
# You may edit it to comment/uncomment selected board and board options.
# However do not change the structure of this template, which is fixed and 
# any change to the structure gets overwritten.

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# Arduino boards.
# Platform: Arduino AVR Boards
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# set(ARDUINO_BOARD "avr.yun") # Arduino Yn
set(ARDUINO_BOARD "avr.uno") # Arduino Uno
# set(ARDUINO_BOARD "avr.diecimila") # Arduino Duemilanove or Diecimila
# set(ARDUINO_BOARD "avr.nano") # Arduino Nano
# set(ARDUINO_BOARD "avr.mega") # Arduino Mega or Mega 2560
# set(ARDUINO_BOARD "avr.megaADK") # Arduino Mega ADK
# set(ARDUINO_BOARD "avr.leonardo") # Arduino Leonardo
# set(ARDUINO_BOARD "avr.leonardoeth") # Arduino Leonardo ETH
# set(ARDUINO_BOARD "avr.micro") # Arduino Micro
# set(ARDUINO_BOARD "avr.esplora") # Arduino Esplora
# set(ARDUINO_BOARD "avr.mini") # Arduino Mini
# set(ARDUINO_BOARD "avr.ethernet") # Arduino Ethernet
# set(ARDUINO_BOARD "avr.fio") # Arduino Fio
# set(ARDUINO_BOARD "avr.bt") # Arduino BT
# set(ARDUINO_BOARD "avr.LilyPadUSB") # LilyPad Arduino USB
# set(ARDUINO_BOARD "avr.lilypad") # LilyPad Arduino
# set(ARDUINO_BOARD "avr.pro") # Arduino Pro or Pro Mini
# set(ARDUINO_BOARD "avr.atmegang") # Arduino NG or older
# set(ARDUINO_BOARD "avr.robotControl") # Arduino Robot Control
# set(ARDUINO_BOARD "avr.robotMotor") # Arduino Robot Motor
# set(ARDUINO_BOARD "avr.gemma") # Arduino Gemma
# set(ARDUINO_BOARD "avr.circuitplay32u4cat") # Adafruit Circuit Playground
# set(ARDUINO_BOARD "avr.yunmini") # Arduino Yn Mini
# set(ARDUINO_BOARD "avr.chiwawa") # Arduino Industrial 101
# set(ARDUINO_BOARD "avr.one") # Linino One
# set(ARDUINO_BOARD "avr.unowifi") # Arduino Uno WiFi

#==============================================================================
# Menu options.
# Board: Arduino Yn [avr.yun]
#==============================================================================

#==============================================================================
# Menu options.
# Board: Arduino Uno [avr.uno]
#==============================================================================

#==============================================================================
# Menu options.
# Board: Arduino Duemilanove or Diecimila [avr.diecimila]
#==============================================================================

# Option: Processor
set(ARDUINO_AVR_DIECIMILA_MENU_CPU_ATMEGA328 TRUE) # ATmega328P
# set(ARDUINO_AVR_DIECIMILA_MENU_CPU_ATMEGA168 TRUE) # ATmega168

#==============================================================================
# Menu options.
# Board: Arduino Nano [avr.nano]
#==============================================================================

# Option: Processor
set(ARDUINO_AVR_NANO_MENU_CPU_ATMEGA328 TRUE) # ATmega328P
# set(ARDUINO_AVR_NANO_MENU_CPU_ATMEGA328OLD TRUE) # ATmega328P (Old Bootloader)
# set(ARDUINO_AVR_NANO_MENU_CPU_ATMEGA168 TRUE) # ATmega168

#==============================================================================
# Menu options.
# Board: Arduino Mega or Mega 2560 [avr.mega]
#==============================================================================

# Option: Processor
set(ARDUINO_AVR_MEGA_MENU_CPU_ATMEGA2560 TRUE) # ATmega2560 (Mega 2560)
# set(ARDUINO_AVR_MEGA_MENU_CPU_ATMEGA1280 TRUE) # ATmega1280

#==============================================================================
# Menu options.
# Board: Arduino Mega ADK [avr.megaADK]
#==============================================================================

#==============================================================================
# Menu options.
# Board: Arduino Leonardo [avr.leonardo]
#==============================================================================

#==============================================================================
# Menu options.
# Board: Arduino Leonardo ETH [avr.leonardoeth]
#==============================================================================

#==============================================================================
# Menu options.
# Board: Arduino Micro [avr.micro]
#==============================================================================

#==============================================================================
# Menu options.
# Board: Arduino Esplora [avr.esplora]
#==============================================================================

#==============================================================================
# Menu options.
# Board: Arduino Mini [avr.mini]
#==============================================================================

# Option: Processor
set(ARDUINO_AVR_MINI_MENU_CPU_ATMEGA328 TRUE) # ATmega328P
# set(ARDUINO_AVR_MINI_MENU_CPU_ATMEGA168 TRUE) # ATmega168

#==============================================================================
# Menu options.
# Board: Arduino Ethernet [avr.ethernet]
#==============================================================================

#==============================================================================
# Menu options.
# Board: Arduino Fio [avr.fio]
#==============================================================================

#==============================================================================
# Menu options.
# Board: Arduino BT [avr.bt]
#==============================================================================

# Option: Processor
set(ARDUINO_AVR_BT_MENU_CPU_ATMEGA328 TRUE) # ATmega328P
# set(ARDUINO_AVR_BT_MENU_CPU_ATMEGA168 TRUE) # ATmega168

#==============================================================================
# Menu options.
# Board: LilyPad Arduino USB [avr.LilyPadUSB]
#==============================================================================

#==============================================================================
# Menu options.
# Board: LilyPad Arduino [avr.lilypad]
#==============================================================================

# Option: Processor
set(ARDUINO_AVR_LILYPAD_MENU_CPU_ATMEGA328 TRUE) # ATmega328P
# set(ARDUINO_AVR_LILYPAD_MENU_CPU_ATMEGA168 TRUE) # ATmega168

#==============================================================================
# Menu options.
# Board: Arduino Pro or Pro Mini [avr.pro]
#==============================================================================

# Option: Processor
set(ARDUINO_AVR_PRO_MENU_CPU_16MHZATMEGA328 TRUE) # ATmega328P (5V, 16 MHz)
# set(ARDUINO_AVR_PRO_MENU_CPU_8MHZATMEGA328 TRUE) # ATmega328P (3.3V, 8 MHz)
# set(ARDUINO_AVR_PRO_MENU_CPU_16MHZATMEGA168 TRUE) # ATmega168 (5V, 16 MHz)
# set(ARDUINO_AVR_PRO_MENU_CPU_8MHZATMEGA168 TRUE) # ATmega168 (3.3V, 8 MHz)

#==============================================================================
# Menu options.
# Board: Arduino NG or older [avr.atmegang]
#==============================================================================

# Option: Processor
set(ARDUINO_AVR_ATMEGANG_MENU_CPU_ATMEGA168 TRUE) # ATmega168
# set(ARDUINO_AVR_ATMEGANG_MENU_CPU_ATMEGA8 TRUE) # ATmega8

#==============================================================================
# Menu options.
# Board: Arduino Robot Control [avr.robotControl]
#==============================================================================

#==============================================================================
# Menu options.
# Board: Arduino Robot Motor [avr.robotMotor]
#==============================================================================

#==============================================================================
# Menu options.
# Board: Arduino Gemma [avr.gemma]
#==============================================================================

#==============================================================================
# Menu options.
# Board: Adafruit Circuit Playground [avr.circuitplay32u4cat]
#==============================================================================

#==============================================================================
# Menu options.
# Board: Arduino Yn Mini [avr.yunmini]
#==============================================================================

#==============================================================================
# Menu options.
# Board: Arduino Industrial 101 [avr.chiwawa]
#==============================================================================

#==============================================================================
# Menu options.
# Board: Linino One [avr.one]
#==============================================================================

#==============================================================================
# Menu options.
# Board: Arduino Uno WiFi [avr.unowifi]
#==============================================================================

#******************************************************************************
# Arduino programmers.
# Platform: Arduino AVR Boards
#******************************************************************************
# set(ARDUINO_PROGRAMMER "avr.avrisp") # AVR ISP
# set(ARDUINO_PROGRAMMER "avr.avrispmkii") # AVRISP mkII
# set(ARDUINO_PROGRAMMER "avr.usbtinyisp") # USBtinyISP
# set(ARDUINO_PROGRAMMER "avr.arduinoisp") # ArduinoISP
# set(ARDUINO_PROGRAMMER "avr.arduinoisporg") # ArduinoISP.org
# set(ARDUINO_PROGRAMMER "avr.usbasp") # USBasp
# set(ARDUINO_PROGRAMMER "avr.parallel") # Parallel Programmer
# set(ARDUINO_PROGRAMMER "avr.arduinoasisp") # Arduino as ISP
# set(ARDUINO_PROGRAMMER "avr.arduinoasispatmega32u4") # Arduino as ISP (ATmega32U4)
# set(ARDUINO_PROGRAMMER "avr.usbGemma") # Arduino Gemma
# set(ARDUINO_PROGRAMMER "avr.buspirate") # BusPirate as ISP
# set(ARDUINO_PROGRAMMER "avr.stk500") # Atmel STK500 development board
# set(ARDUINO_PROGRAMMER "avr.jtag3isp") # Atmel JTAGICE3 (ISP mode)
# set(ARDUINO_PROGRAMMER "avr.jtag3") # Atmel JTAGICE3 (JTAG mode)
# set(ARDUINO_PROGRAMMER "avr.atmel_ice") # Atmel-ICE (AVR)


include("${arduino_toolchain_SOURCE_DIR}/Arduino-toolchain.cmake")