# Copyright (C) 2011 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for toro hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and toro, hence its name.
#

# Camera and Gallery
PRODUCT_PACKAGES := \
    Gallery

#if we do this after the full_base_telephony is included some of these don't get picked up..
PRODUCT_COPY_FILES += \
    device/samsung/toro/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
    device/sample/etc/apns-conf_verizon.xml:system/etc/apns-conf.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    vendor/samsung/toro/proprietary/libmotricity.so:system/lib/libmotricity.so \
    vendor/samsung/toro/proprietary/sirfgps.conf:system/vendor/etc/sirfgps.conf \
    vendor/samsung/toro/proprietary/smc_normal_world_android_cfg.ini:system/vendor/etc/smc_normal_world_android_cfg.ini \
    vendor/samsung/toro/proprietary/ducati-m3.bin:system/vendor/firmware/ducati-m3.bin \
    vendor/samsung/toro/proprietary/fw_bcmdhd.bin:system/vendor/firmware/fw_bcmdhd.bin \
    vendor/samsung/toro/proprietary/fw_bcmdhd_apsta.bin:system/vendor/firmware/fw_bcmdhd_apsta.bin \
    vendor/samsung/toro/proprietary/fw_bcmdhd_p2p.bin:system/vendor/firmware/fw_bcmdhd_p2p.bin \
    vendor/samsung/toro/proprietary/libpn544_fw.so:system/vendor/firmware/libpn544_fw.so \
    vendor/samsung/toro/proprietary/mms144_ts_rev31.fw:system/vendor/firmware/mms144_ts_rev31.fw \
    vendor/samsung/toro/proprietary/mms144_ts_rev32.fw:system/vendor/firmware/mms144_ts_rev32.fw \
    vendor/samsung/toro/proprietary/smc_pa_wvdrm.ift:system/vendor/firmware/smc_pa_wvdrm.ift \
    vendor/samsung/toro/proprietary/libwvdrm_L1.so:system/vendor/lib/libwvdrm_L1.so \
    vendor/samsung/toro/proprietary/libwvm.so:system/vendor/lib/libwvm.so \
    vendor/samsung/toro/proprietary/libWVStreamControlAPI_L1.so:system/vendor/lib/libWVStreamControlAPI_L1.so \
    vendor/samsung/toro/proprietary/libdrmwvmplugin.so:/system/vendor/lib/drm/libdrmwvmplugin.so \
    vendor/samsung/toro/proprietary/com.vzw.hardware.ehrpd.xml:system/etc/permissions/com.vzw.hardware.ehrpd.xml \
    vendor/samsung/toro/proprietary/com.vzw.hardware.lte.xml:system/etc/permissions/com.vzw.hardware.lte.xml \
    vendor/samsung/toro/proprietary/com.vzw.vzwapnlib.xml:system/etc/permissions/com.vzw.vzwapnlib.xml \
    vendor/samsung/toro/proprietary/gps.omap4.so:system/vendor/lib/hw/gps.omap4.so

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
# This is where we'd set a backup provider if we had one
#$(call inherit-product, device/sample/products/backup_overlay.mk)
# Inherit from toro device
$(call inherit-product, device/samsung/toro/device_vzw.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_toro
PRODUCT_DEVICE := toro
PRODUCT_BRAND := Android
PRODUCT_MODEL := Full AOSP on Toro-VZW
PRODUCT_RESTRICT_VENDOR_FILES := true
