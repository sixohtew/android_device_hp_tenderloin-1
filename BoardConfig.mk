# inherit from the proprietary version
-include vendor/hp/tenderloin/BoardConfigVendor.mk

TARGET_SPECIFIC_HEADER_PATH := device/hp/tenderloin/include 

# We have so much memory 3:1 split is detrimental to us.
TARGET_USES_2G_VM_SPLIT := true

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false

TARGET_BOOTLOADER_BOARD_NAME := tenderloin
TARGET_BOARD_PLATFORM := msm8660
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
BOARD_USES_ADRENO_200 := true

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := scorpion
TARGET_CPU_SMP := true
TARGET_ARCH := arm
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_DISABLE_ARM_PIE := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_USES_QCOM_BSP := true

TARGET_NO_RADIOIMAGE := true
TARGET_HAVE_TSLIB := false
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

TARGET_RECOVERY_FSTAB := device/hp/tenderloin/fstab.tenderloin
RECOVERY_FSTAB_VERSION := 2
TARGET_NO_RECOVERY_PATCH := true

COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=59 -DQCOM_HARDWARE -DQCOM_NO_SECURE_PLAYBACK -DICS_CAMERA_BLOB
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP

BOARD_USES_LEGACY_MMAP := true

# Art
ART_DONT_CHECK_GAP := true
LIBART_IMG_BASE := 0x60000000

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER      	:= NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB 	:= lib_driver_cmd_ath6kl
WPA_SUPPLICANT_VERSION           	:= VER_0_8_X
BOARD_WLAN_DEVICE                	:= ath6kl
BOARD_NEEDS_WIFI_DELAY			:= true

# Audio
COMMON_GLOBAL_CFLAGS += -DHTC_ACOUSTIC_AUDIO -DLEGACY_QCOM_VOICE
BOARD_USES_LEGACY_ALSA_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_HCI := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/hp/tenderloin/bluetooth
BLUETOOTH_HCIATTACH_USING_PROPERTY = true

# Needed for blobs
TARGET_RELEASE_CPPFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Define egl.cfg location
BOARD_EGL_CFG := device/hp/tenderloin/egl.cfg
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
USE_OPENGL_RENDERER := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
TARGET_DISPLAY_INSECURE_MM_HEAP := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_NO_ADAPTIVE_PLAYBACK := true

# PowerHAL
TARGET_POWERHAL_VARIANT := cm

# Sensors
TARGET_INVENSENSE_SENSOR := 60xx

# QCOM enhanced A/V
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Webkit workaround
TARGET_FORCE_CPU_UPLOAD := true

BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_USE_QCOM_PMEM := true
BOARD_CAMERA_USE_GETBUFFERINFO := true
BOARD_FIRST_CAMERA_FRONT_FACING := true
BOARD_CAMERA_USE_ENCODEDATA := true
BOARD_NEEDS_MEMORYHEAPPMEM := true

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

BOARD_OVERLAY_FORMAT_YCbCr_420_SP := true
USE_CAMERA_STUB := false

# tenderloin- these kernel settings are temporary to complete build
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom zcache
BOARD_KERNEL_BASE := 0x40200000
BOARD_PAGE_SIZE := 2048
BOARD_KERNEL_IMAGE_NAME := uImage

BOARD_NEEDS_CUTILS_LOG := true

TARGET_PROVIDES_RELEASETOOLS := true
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := device/hp/tenderloin/releasetools/tenderloin_img_from_target_files
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/hp/tenderloin/releasetools/tenderloin_ota_from_target_files
TARGET_RELEASETOOL_MAKE_RECOVERY_PATCH_SCRIPT := device/hp/tenderloin/releasetools/tenderloin_make_recovery_patch

BOARD_USES_UBOOT := true
BOARD_USES_UBOOT_MULTIIMAGE := true

# Define Prebuilt kernel locations
TARGET_PREBUILT_KERNEL := device/hp/tenderloin/prebuilt/boot/kernel

# Kernel
TARGET_KERNEL_SOURCE := kernel/hp/tenderloin
TARGET_KERNEL_CONFIG := cyanogenmod_tenderloin_defconfig

TARGET_RECOVERY_INITRC := device/hp/tenderloin/recovery/init.rc
BOARD_HAS_NO_SELECT_BUTTON := false

# tenderloin - these partition sizes are temporary to complete build
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776192
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838860800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 20044333056
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

TARGET_RELEASETOOLS_EXTENSIONS := device/hp/common

BOARD_HAS_SDCARD_INTERNAL := false
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_CUSTOM_BOOTIMG_MK := device/hp/tenderloin/uboot-bootimg.mk

# Multiboot stuff
TARGET_RECOVERY_PRE_COMMAND := "/system/bin/rebootcmd"

# SELinux
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += device/hp/tenderloin/sepolicy

BOARD_SEPOLICY_UNION += \
    bootanim.te \
    file.te \
    file_contexts \
    init.te \
    init_shell.te \
    kernel.te \
    lvm.te \
    mpdecision.te \
    serial.te \
    surfaceflinger.te \
    sysinit.te \
    system_server.te \
    ts_srv.te \
    ueventd.te
