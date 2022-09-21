#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/berlin

# Inherit from motorola sm7325-common
include device/motorola/sm7325-common/BoardConfigCommon.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := berlin

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.hab.product=berlin
TARGET_KERNEL_CONFIG += vendor/lineage_berlin.config

# Kernel Modules
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load))
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := $(DEVICE_PATH)/modules.blocklist
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.recovery))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD)

# Partitions
BOARD_MOT_DP_GROUP_SIZE := 7109345280
BOARD_SUPER_PARTITION_SIZE := 14227079168

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 90

# Security
BOOT_SECURITY_PATCH := 2024-09-01
VENDOR_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)

# Verified Boot
BOARD_AVB_ROLLBACK_INDEX := 38
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := 38

# inherit from the proprietary version
include vendor/motorola/berlin/BoardConfigVendor.mk
