PRODUCT_BRAND ?= zz

# use specific resolution for bootanimation
ifneq ($(TARGET_BOOTANIMATION_SIZE),)
PRODUCT_COPY_FILES += \
    vendor/zz/prebuilt/bootanimation/res/$(TARGET_BOOTANIMATION_SIZE).zip:system/media/bootanimation.zip
else
PRODUCT_COPY_FILES += \
    vendor/zz/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip
endif

# default wallpaper
PRODUCT_COPY_FILES += \
    vendor/zz/prebuilt/czz_wallpaper.jpg:system/media/default_wallpaper.jpg
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.wallpaper=/system/media/default_wallpaper.jpg

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# general properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    persist.sys.root_access=1

# enable ADB authentication if not on eng build
ifneq ($(TARGET_BUILD_VARIANT),eng)
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/zz/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/zz/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/zz/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/zz/prebuilt/bin/blacklist:system/addon.d/blacklist

# init.d support
PRODUCT_COPY_FILES += \
    vendor/zz/prebuilt/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/zz/prebuilt/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/zz/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit

# Init script file with zz extras
PRODUCT_COPY_FILES += \
    vendor/zz/prebuilt/etc/init.local.rc:root/init.omni.rc

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Dashclock
#PRODUCT_COPY_FILES += \
#    vendor/zz/prebuilt/app/DashClock.apk:system/app/DashClock.apk

# Additional packages
-include vendor/zz/config/packages.mk

# CrystalZZ
-include vendor/zz/config/czz.mk

# Versioning
-include vendor/zz/config/version.mk

# Add our overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/zz/overlay/common
