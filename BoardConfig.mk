#
# Copyright (C) 2023 Project 404
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/realme/r5x
COMMON_PATH := device/qcom/common

BOARD_VENDOR := realme

# Hacks
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_ENFORCE_SYSPROP_OWNER := true

# Assert
TARGET_OTA_ASSERT_DEVICE := RMX1911,RMX1925,RMX1927,RMX2030,r5x

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720

# Display
TARGET_SCREEN_DENSITY := 320

# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := trinket
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := trinket

# Properties
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a73

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := \
    console=ttyMSM0,115200n8 \
    androidboot.hardware=qcom \
    androidboot.console=ttyMSM0 \
    androidboot.memcg=1 \
    lpm_levels.sleep_disabled=1 \
    msm_rtb.filter=0x237 \
    service_locator.enable=1 \
    swiotlb=1 \
    earlycon=msm_geni_serial,0x4a90000 \
    loop.max_part=7 \
    cgroup.memory=nokmem,nosocket \
    androidboot.init_fatal_reboot_target=recovery \
    kpti=off

BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000

# Kernel (Prebuilt)
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_KERNEL_ARCH := arm64
BOARD_BOOT_HEADER_VERSION := 1
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)-kernel/Image.gz-dtb
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)-kernel/dtbo.img
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Audio
AUDIO_FEATURE_ENABLED_AAC_ADTS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_AUDIOSPHERE := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true

# Bluetooth
TARGET_FWK_SUPPORTS_FULL_VALUEADDS := true

# Camera
TARGET_NEEDS_RAW10_BUFFER_FIX := true

# Display
TARGET_USES_HWC2 := true
TARGET_USES_DRM_PP := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

TARGET_USES_VULKAN := true

# FM
BOARD_HAVE_QCOM_FM := true
BOARD_HAS_QCA_FM_SOC := cherokee

# GPS
LOC_HIDL_VERSION := 4.0

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/manifest.xml
DEVICE_MATRIX_FILE += $(COMMON_PATH)/compatibility_matrix.xml

DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/configs/hidl/framework_compatibility_matrix.xml

# HWUI
HWUI_COMPILE_FOR_PERF := true

# Keystore
TARGET_PROVIDES_KEYMASTER := true

# Media
TARGET_DISABLED_UBWC := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
ifneq ($(AB_OTA_UPDATER), true)
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
endif
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_ROOT_EXTRA_SYMLINKS := \
    /vendor/firmware_mnt:/firmware \
    /vendor/bt_firmware:/bt_firmware

TARGET_COPY_OUT_VENDOR := vendor
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

BOARD_USES_METADATA_PARTITION := true

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5114429440
BOARD_VENDORIMAGE_PARTITION_SIZE := 1452277760

# Power
TARGET_TAP_TO_WAKE_NODE := "/proc/touchpanel/double_tap_enable"
TARGET_POWERHAL_MODE_EXT := $(DEVICE_PATH)/power/power-mode.cpp
TARGET_USES_INTERACTION_BOOST := true

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# RIL
ENABLE_VENDOR_RIL_SERVICE := true
TARGET_PROVIDES_QTI_TELEPHONY_JAR := true

# Security patch level
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private

# Treble
PRODUCT_VENDOR_MOVE_ENABLED := true
BOARD_VNDK_VERSION := current

# Inherit the proprietary files
-include vendor/realme/r5x/BoardConfigVendor.mk
