$(call inherit-product, device/sony/hayabusa/full_hayabusa.mk)

# Enhanced NFC
#$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit CM common Phone stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=LT29i BUILD_FINGERPRINT=Sony/LT29i/LT29i:4.3/9.2.A.0.295/2P7_tg:user/release-keys PRIVATE_BUILD_DESC="LT29i-user 4.3 JB-MR2-BLUE-CAF-140119-1326 51 test-keys"

PRODUCT_NAME := cm_hayabusa
PRODUCT_DEVICE := hayabusa
