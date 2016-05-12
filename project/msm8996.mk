# top level project rules for the msm8996 project
#
LOCAL_DIR := $(GET_LOCAL_DIR)

TARGET := msm8996

MODULES += app/aboot
MODULES += app/mmutest

ifeq ($(TARGET_BUILD_VARIANT),user)
DEBUG := 0
else
DEBUG := 1
endif

EMMC_BOOT := 1
ENABLE_SDHCI_SUPPORT := 1
ENABLE_UFS_SUPPORT   := 1
ENABLE_BOOT_CONFIG_SUPPORT := 1
ENABLE_USB30_SUPPORT := 1
ENABLE_QGIC3 := 1
ENABLE_SECAPP_LOADER := 1
ENABLE_PARTIAL_GOODS_SUPPORT := 1
ENABLE_RPMB_SUPPORT := 1
ENABLE_GLINK_SUPPORT := 1
ENABLE_PWM_SUPPORT := true
ENABLE_LPAE_SUPPORT := 1
ENABLE_PSCI_SUPPORT := 1
ENABLE_EARLYDOMAIN_SUPPORT := 1

DEFINES +=VIRTIO=1

#DEFINES += WITH_DEBUG_DCC=1
DEFINES += WITH_DEBUG_UART=1
#DEFINES += WITH_DEBUG_FBCON=1
DEFINES += DEVICE_TREE=1
DEFINES += SPMI_CORE_V2=1
DEFINES += BAM_V170=1

DEFINES += ABOOT_IGNORE_BOOT_HEADER_ADDRS=1

DEFINES += ABOOT_FORCE_KERNEL_ADDR=0x80080000
DEFINES += ABOOT_FORCE_RAMDISK_ADDR=0x82200000
DEFINES += ABOOT_FORCE_TAGS_ADDR=0x82000000
DEFINES += ABOOT_FORCE_KERNEL64_ADDR=0x80080000

DEFINES += USB_RESET_FROM_CLK=1
DEFINES += USE_BOOTDEV_CMDLINE=1
DEFINES += USE_RPMB_FOR_DEVINFO=1
DEFINES += ENABLE_WBC=0
#Enable below flag to compile cmnlib64
#DEFINES += ENABLE_CMNLIB64_LOADING=1

ENABLE_HAP_VIB_SUPPORT := false

#Enable the feature of long press power on
DEFINES += LONG_PRESS_POWER_ON=1

#Disable thumb mode
ENABLE_THUMB := false

#enable fbcon display menu
ENABLE_FBCON_DISPLAY_MSG := 0

ifeq ($(ENABLE_FBCON_DISPLAY_MSG),1)
DEFINES += FBCON_DISPLAY_MSG=1
endif

ifeq ($(ENABLE_HAP_VIB_SUPPORT),true)
DEFINES += PON_VIB_SUPPORT=1
endif

ifeq ($(ENABLE_GLINK_SUPPORT),1)
DEFINES += GLINK_SUPPORT=1
endif

ifeq ($(EMMC_BOOT),1)
DEFINES += _EMMC_BOOT=1
endif

ifeq ($(ENABLE_SDHCI_SUPPORT),1)
DEFINES += MMC_SDHCI_SUPPORT=1
endif

ifeq ($(ENABLE_UFS_SUPPORT),1)
DEFINES += UFS_SUPPORT=1
endif

ifeq ($(ENABLE_USB30_SUPPORT),1)
DEFINES += USB30_SUPPORT=1
endif

ifeq ($(ENABLE_PARTIAL_GOODS_SUPPORT),1)
DEFINES += ENABLE_PARTIAL_GOODS_SUPPORT=1
endif

ENABLE_MDTP_SUPPORT := 1

ifeq ($(ENABLE_MDTP_SUPPORT),1)
DEFINES += MDTP_SUPPORT=1
endif

ifeq ($(ENABLE_LPAE_SUPPORT),1)
DEFINES += LPAE=1
endif

ifeq ($(ENABLE_PSCI_SUPPORT),1)
DEFINES += PSCI_SUPPORT=1
endif

ifeq ($(ENABLE_EARLYDOMAIN_SUPPORT),1)
DEFINES += EARLYDOMAIN_SUPPORT=1
endif

CFLAGS += -Werror

#enable user force reset feature
DEFINES += USER_FORCE_RESET_SUPPORT=1

#SCM call before entering DLOAD mode
DEFINES += PLATFORM_USE_SCM_DLOAD=1

#Enable the external reboot functions
ENABLE_REBOOT_MODULE := 1
#fuse for Qusb tun2 config
DEFINES += QFPROM_CORR_CALIB_ROW12_MSB=0x0007424C
#Use misc settings for qmp
DEFINES += PLATFORM_USE_QMP_MISC=1
#Use PON register for reboot reason
DEFINES += USE_PON_REBOOT_REG=1

#enable battery voltage check
DEFINES += CHECK_BAT_VOLTAGE=0
# Enable unit test FW
ENABLE_UNITTEST_FW=1
ifeq ($(ENABLE_UNITTEST_FW),1)
DEFINES += UNITTEST_FW_SUPPORT=1
endif
