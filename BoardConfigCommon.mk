# Copyright (C) 2015 The CyanogenMod Project
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).

# inherit from qcom-common
-include device/samsung/qcom-common/BoardConfigCommon.mk

LOCAL_PATH := device/samsung/coreprimelte-common

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Arch
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_CORTEX_A53 := true

# Audio
BOARD_USES_ALSA_AUDIO := true
TARGET_USES_QCOM_MM_AUDIO := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_ACDB_LICENSE := true
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_FM := true
BOARD_HAVE_QCOM_FM := true
AUDIO_FEATURE_ENABLED_MULTIPLE_TUNNEL := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Camera
#TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_CHARGER_ENABLE_SUSPEND := true

# Custom RIL class
BOARD_RIL_CLASS := ../../../$(LOCAL_PATH)/ril/

# Device Specific Headers
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Dex
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif

# Display
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
TARGET_CONTINUOUS_SPLASH_ENABLED := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 2048

# Enable HW based full disk encryption
TARGET_HW_DISK_ENCRYPTION := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Kernel
BOARD_CUSTOM_BOOTIMG_MK      := $(LOCAL_PATH)/mkbootimg.mk
BOARD_KERNEL_CMDLINE         += console=null androidboot.hardware=qcom user_debug=23 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci vmalloc=450M androidboot.selinux=permissive
BOARD_KERNEL_BASE            := 0x80000000
BOARD_RAMDISK_OFFSET         := 0x82000000
BOARD_KERNEL_TAGS_OFFSET     := 0x81e00000
BOARD_KERNEL_SEPARATED_DT    := true
BOARD_KERNEL_PAGESIZE        := 2048
BOARD_FLASH_BLOCK_SIZE       := 131072


# malloc implementation
MALLOC_IMPL := dlmalloc

# Media
TARGET_QCOM_MEDIA_VARIANT := caf
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Misc.
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# Platform
TARGET_BOARD_PLATFORM := msm8916
TARGET_BOARD_PLATFORM_GPU := qcom-adreno306
TARGET_BOOTLOADER_BOARD_NAME := MSM8916

# PowerHAL
TARGET_POWERHAL_SET_INTERACTIVE_EXT := $(LOCAL_PATH)/power/power_ext.c
TARGET_POWERHAL_VARIANT := qcom
WITH_QC_PERF := true

# Qcom
TARGET_USES_NEW_ION_API := true
TARGET_USES_QCOM_BSP := true
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
PROTOBUF_SUPPORTED := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP
BOARD_USES_QC_TIME_SERVICES := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    device/samsung/cprimeltemtr-common/sepolicy

BOARD_SEPOLICY_UNION += \
    bluetooth_loader.te \
    file_contexts \
    system_server.te \
    mediaserver.te \
    untrusted_app.te \
    property.te \
    property_contexts \
    system_app.te \
    time_daemon.te \
    vold.te \
    netd.te \
    bluetooth.te \
    file.te \
    tee.te \
    kernel.te \
    shell.te \
    mm-qcamerad.te \
    rild.te \
    ueventd.te \
    wcnss_service.te \
    init.te

# Video
TARGET_HAVE_SIGNED_VENUS_FW := true

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_MAX_PARTITIONS := 65

# Wifi
BOARD_HAS_QCOM_WLAN 		     := true
BOARD_HAS_QCOM_WLAN_SDK 	     := true
BOARD_HOSTAPD_DRIVER 		     := NL80211
BOARD_HOSTAPD_PRIVATE_LIB 	 	 := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE 		 	     := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER 	 := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
TARGET_PROVIDES_WCNSS_QMI        := true
TARGET_USES_QCOM_WCNSS_QMI 	     := true
TARGET_USES_WCNSS_CTRL 		     := true
WIFI_DRIVER_FW_PATH_AP 		     := "ap"
WIFI_DRIVER_FW_PATH_STA 	     := "sta"
WPA_SUPPLICANT_VERSION 		     := VER_0_8_X
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"
TARGET_KERNEL_MODULES 		     += WLAN_MODULES

# Workaround to avoid issues with legacy liblights on QCOM platforms
TARGET_PROVIDES_LIBLIGHT := true

# TWRP
# Display
TW_THEME := portrait_hdpi
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_BRIGHTNESS_PATH := "/sys/devices/soc.0/1a00000.qcom\x2cmdss_mdp/qcom\x2cmdss_fb_primary.138/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_NEW_ION_HEAP := true
TW_TARGET_USES_QCOM_BSP := true

# Keys
BOARD_HAS_NO_SELECT_BUTTON := true

# Storage
#RECOVERY_VARIANT := twrp
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/main/fstab.qcom
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/sdcard1"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard1"
TW_NO_USB_STORAGE := true
TW_MTP_DEVICE := "/dev/mtp_usb"
BOARD_MTP_DEVICE := "/dev/mtp_usb"
RECOVERY_SDCARD_ON_DATA := true

# Misc.
BOARD_USES_MMC_UTILS := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_HAS_NO_MISC_PARTITION := true
TW_HAS_DOWNLOAD_MODE := true
TW_NO_REBOOT_BOOTLOADER := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
BOARD_RECOVERY_SWIPE := true
