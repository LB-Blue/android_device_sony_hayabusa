#inherit from the common blue definitions
include device/sony/blue-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH += device/sony/hayabusa/include

TARGET_KERNEL_CONFIG := blue_hayabusa_defconfig
TARGET_KERNEL_SOURCE := kernel/sony/msm8960
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7/bin

# Partition information
BOARD_VOLD_MAX_PARTITIONS := 18

# the following two sizes are generous guesses
# since these partitions are not visible
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01400000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x01400000

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1056964608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/hayabusa/bluetooth

TARGET_LS_USE_ALS_NODE := true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_USERIMAGES_USE_EXT4 := true

TARGET_OTA_ASSERT_DEVICE := lt29i,hayabusa,LT29i

BOARD_HARDWARE_CLASS := device/sony/hayabusa/cmhw

# Custom sepolicy for hardware
BOARD_SEPOLICY_DIRS += \
    device/sony/hayabusa/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    file.te \
    system_server.te

# inherit from the proprietary version
-include vendor/sony/hayabusa/BoardConfigVendor.mk
