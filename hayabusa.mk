#
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit the blue-common definitions
$(call inherit-product, device/sony/blue-common/blue.mk)

DEVICE_PACKAGE_OVERLAYS += device/sony/hayabusa/overlay

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Configuration scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/pre_hw_config.sh:system/etc/pre_hw_config.sh \
    $(LOCAL_PATH)/rootdir/system/etc/hw_config.sh:system/etc/hw_config.sh

#sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/sensors.conf:system/etc/sensors.conf \
    $(LOCAL_PATH)/rootdir/system/etc/sysmon.cfg:system/etc/sysmon.cfg

# touchscreen and simple remote platform
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/usr/idc/clearpad.idc:system/usr/idc/clearpad.idc \
    $(LOCAL_PATH)/rootdir/system/usr/keylayout/simple_remote_appkey.kl:system/usr/keylayout/simple_remote_appkey.kl

# init.d
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/init.d/01touchkeys:system/etc/init.d/01touchkeys \
    $(LOCAL_PATH)/rootdir/system/etc/init.d/02hotplug:system/etc/init.d/02hotplug

# Device specific init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.device.rc:root/init.device.rc

# USB function switching
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.sony.usb.rc:root/init.sony.usb.rc

DEFAULT_PROPERTY_OVERRIDES += \
	ro.adb.secure=0 \
	ro.secure=0 \
	persist.sys.usb.config=mtp,adb \
	persist.sys.isUsbOtgEnabled=true

ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.semc.version.sw=1266-3320 \
	ro.semc.version.sw_revision=9.2.A.1.215 \
	ro.semc.version.sw_variant=GENERIC \
	ro.semc.version.sw_type=user

ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.semc.version.cust=1266-5813 \
	ro.semc.version.cust_revision=R3J \
	ro.somc.customerid=104 \
	ro.semc.version.fs_revision=9.2.A.1.215 \
	ro.semc.product.model=LT29i
	
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/root/sepolicy:recovery/root/sepolicy

# Hijack boot
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh \
    $(LOCAL_PATH)/rootdir/hijack/hijack.sh:system/bin/hijack/hijack.sh

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Include non-opensource parts
$(call inherit-product, vendor/sony/hayabusa/hayabusa-vendor.mk)
