# proprietary side of the device
$(call inherit-product-if-exists, vendor/semc/es209ra/es209ra-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/semc/es209ra/overlay

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

PRODUCT_AAPT_CONFIG := normal hdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_PACKAGES += \
    gps.es209ra \
    sensors.default \
    lights.es209ra \
    audio.a2dp.default \
    audio_policy.es209ra \
    audio.primary.es209ra \
    wlan_loader \
    wlan_cu \
    dhcpcd.conf \
    gralloc.qsd8k \
    hwcomposer.default \
    hwcomposer.qsd8k \
    copybit.qsd8k \
    camera.qsd8k \
    libgenlock \
    libmemalloc \
    libtilerenderer \
    libqdutils \
    liboverlay \
    libQcomUI \
    librs_jni \
    com.android.future.usb.accessory \
    libmm-omxcore \
    libdivxdrmdecrypt \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw \
    libopencorehw

PRODUCT_PACKAGES += \
    Torch


PRODUCT_PACKAGES += \
	Torch

PRODUCT_PACKAGES -= \
	CMUpdater


# These are the hardware-specific configuration files
PRODUCT_COPY_FILES += \
    device/semc/es209ra/config/dnsmasq.conf:system/etc/wifi/dnsmasq.conf \
    device/semc/es209ra/config/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/semc/es209ra/config/media_profiles.xml:system/etc/media_profiles.xml \
    device/semc/es209ra/config/media_codecs.xml:system/etc/media_codecs.xml \
    device/semc/es209ra/config/audio_policy.conf:system/etc/audio_policy.conf
#    device/semc/es209ra/config/sensors.conf:system/etc/sensors.conf

# Init files
PRODUCT_COPY_FILES += \
    device/semc/es209ra/prebuilt/init.es209ra.rc:root/init.es209ra.rc \
    device/semc/es209ra/prebuilt/init.es209ra.usb.rc:root/init.es209ra.usb.rc \
    device/semc/es209ra/prebuilt/init.bt.sh:system/etc/init.bt.sh \
    device/semc/es209ra/prebuilt/DualMicControl.txt:system/etc/DualMicControl.txt \
    device/semc/es209ra/prebuilt/ueventd.es209ra.rc:root/ueventd.es209ra.rc \
    device/semc/es209ra/prebuilt/hw_config.sh:system/etc/hw_config.sh \
    device/semc/es209ra/prebuilt/bootrec:root/sbin/bootrec \
    device/semc/es209ra/prebuilt/bootrec-device:root/sbin/bootrec-device \
    device/semc/es209ra/recovery.fstab:root/recovery.fstab \
	device/semc/es209ra/prebuilt/fstab.es209ra:root/fstab.es209ra \
    device/semc/es209ra/prebuilt/initlogo.rle:root/initlogo.rle


#WIFI modules and configs
PRODUCT_COPY_FILES += \
    device/semc/es209ra/config/10dnsconf:system/etc/init.d/10dnsconf \
    device/semc/es209ra/config/10regcode:system/etc/init.d/10regcode \
    device/semc/es209ra/config/10hostapconf:system/etc/init.d/10hostapconf \
	device/semc/es209ra/config/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/semc/es209ra/prebuilt/reg_code:system/etc/wifi/reg_code 
#\
#    device/semc/es209ra/prebuilt/ar6000.ko:system/lib/modules/ar6000.ko

#recovery resources
PRODUCT_COPY_FILES += \
    bootable/recovery/res/images/*:root/res/images/*

#Framework permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

-include device/semc/es209ra/prebuilt/chargeanimation.mk

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-1.so \
    rild.libargs=-d/dev/smd0 \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.telephony.default_network=0 \
    ro.telephony.call_ring.multiple=false \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.sf.lcd_density=240 \
    qemu.sf.lcd_density=240 \
    keyguard.no_require_sim=true \
    ro.com.google.locationfeatures=1 \
    ro.telephony.ril.v3=signalstrength,datacall,skipbrokendatacall,icccardstatus,1 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.dexopt-data-only=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.checkjni=false \
    ro.opengles.version=131072  \
    ro.compcache.default=0 \
    ro.product.locale.language=en \
    ro.product.locale.region=US \
    persist.ro.ril.sms_sync_sending=1 \
    ro.camera.hd_shrink_vf_enabled=1 \
    hwui.render_dirty_regions=false \
    hwui.disable_vsync=true \
    debug.composition.type=mdp \
    debug.sf.hw=1 \
    persist.sys.usb.config=mass_storage,adb \
    persist.service.adb.enable=1 \
    sys.usb.config=mass_storage,adb 


PRODUCT_PROPERTY_OVERRIDES += \
    ro.tethering.kb_disconnect=1

# es209ra uses high-density artwork where available
PRODUCT_LOCALES += hdpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise
