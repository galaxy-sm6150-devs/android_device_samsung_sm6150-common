#
# Copyright (C) 2022 The LineageOS Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

COMMON_PATH := device/samsung/sm6150-common

PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_CHARACTERISTICS := nosdcard
PRODUCT_USE_DYNAMIC_PARTITIONS := false

# AID/fs configs
PRODUCT_PACKAGES += \
    fs_config_files \

# ANT+
PRODUCT_PACKAGES += \
    AntHalService-Soong \
    com.dsi.ant.antradio_library \
    com.dsi.ant@1.0.vendor \

# Atrace
PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service \

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.common-util \
    android.hardware.audio.common-util.vendor \
    android.hardware.audio.service \
    android.hardware.bluetooth.audio@2.0-impl \
    android.hardware.soundtrigger@2.2-impl \

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.default \
    audio.primary.sm6150:32 \
    audio.r_submix.default \
    audio.usb.default \
    cplay \
    libaudioconfigstore \
    libaudiofoundation \
    libaudioroute \
    libaudioutils \
    libtinyalsa \
    libtinycompress \
    tinycap \
    tinymix \
    tinypcminfo \
    tinyplay \

# Audio SoundFX
PRODUCT_PACKAGES += \
    libaudiopreprocessing \
    libbundlewrapper \
    libdownmix \
    libdynproc \
    libeffectproxy \
    libldnhncr \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libreverbwrapper \
    libvisualizer \
    libvolumelistener:32 \

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/dolby/dax-default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/dolby/dax-default.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    $(COMMON_PATH)/rootdir/vendor/etc/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/audio_effects_common.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects_common.conf \
    $(COMMON_PATH)/rootdir/vendor/etc/audio_effects_sec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects_sec.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_io_policy.conf \
    $(COMMON_PATH)/rootdir/vendor/etc/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/audio_platform_info_diff.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_diff.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/audio_platform_info_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_qrd.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/audio_policy_configuration_base.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_base.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/audio_tuning_mixer_tavil.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer_tavil.txt \
    $(COMMON_PATH)/rootdir/vendor/etc/dax3_media_codecs_dolby_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/dax3_media_codecs_dolby_audio.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/graphite_ipc_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/graphite_ipc_platform_info.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/listen_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/listen_platform_info.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/mixer_paths_idp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_idp.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/mixer_paths_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_qrd.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/mixer_paths_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tavil.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/mixer_paths_wcd9375.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_wcd9375.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/mixer_paths_wcd9375qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_wcd9375qrd.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/mixer_usb_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_usb_default.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/mixer_usb_gray.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_usb_gray.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/playback_record_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/playback_record_audio_policy_configuration.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/sound_trigger_mixer_paths_qrd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_qrd.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/sound_trigger_mixer_paths_wcd9340.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9340.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/system_properties.xml:$(TARGET_COPY_OUT_VENDOR)/etc/system_properties.xml \

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/hearing_aid_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/hearing_aid_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \

# Automotive/Gearhead
PRODUCT_PACKAGES += \
    android.hardware.automotive.vehicle@2.0 \
    android.hardware.automotive.vehicle@2.0.vendor \
    android.hardware.automotive.vehicle@2.0-manager-lib \

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0.vendor \
    audio.bluetooth.default \
    com.qualcomm.qti.bluetooth_audio@1.0 \
    com.qualcomm.qti.bluetooth_audio@1.0.vendor \
    libbluetooth_audio_session \
    vendor.qti.hardware.bluetooth_audio@2.0.vendor \
    vendor.qti.hardware.btconfigstore@1.0.vendor \
    vendor.qti.hardware.btconfigstore@2.0.vendor \

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/acdbdata/adsp_avs_config.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/adsp_avs_config.acdb \

# Camera
PRODUCT_PACKAGES += \
    android.frameworks.cameraservice.common@2.0.vendor \
    android.frameworks.cameraservice.device@2.0.vendor \
    android.frameworks.cameraservice.service@2.1.vendor \
    android.hardware.camera.provider@2.5-impl \
    android.hardware.camera.provider@2.5-service_64 \
    android.hardware.camera.provider@2.7 \
    android.hardware.camera.provider@2.7.vendor \
    android.hardware.camera.device@3.7 \
    android.hardware.camera.device@3.7.vendor \
    libcamera2ndk_vendor \
    libdng_sdk \
    libdng_sdk.vendor \
    libgui_vendor:32 \
    libgrallocusage.vendor \
    libstdc++ \
    libstdc++.vendor \
    vendor.qti.hardware.camera.device@1.0.vendor \
    vendor.qti.hardware.camera.postproc@1.0.vendor \

# CAS
PRODUCT_PACKAGES += \
    android.hardware.cas@1.2-service \

# Charger
PRODUCT_PACKAGES += \
    libsuspend \

# Data
$(call inherit-product, vendor/qcom/opensource/dataservices/dataservices_vendor_product.mk)

# SamsungDAP
PRODUCT_PACKAGES += \
    SamsungDAP \

# SamsungDoze
PRODUCT_PACKAGES += \
    SamsungDoze \

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.3 \
    android.hardware.drm@1.3-service.clearkey \
    android.hardware.drm@1.3.vendor \

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd \

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.face@1.0 \
    android.hardware.biometrics.face@1.0.vendor \
    android.hardware.biometrics.fingerprint@2.1 \
    android.hardware.biometrics.fingerprint@2.1.vendor \

# FM
PRODUCT_PACKAGES += \
    android.hardware.broadcastradio@1.0-impl \
    android.hardware.broadcastradio@1.0-service \

PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio \
    qcom.fmradio.xml \

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service \

# GNSS/GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0 \
    android.hardware.gnss@1.1 \
    android.hardware.gnss@2.0 \
    android.hardware.gnss@2.1 \
    android.hardware.gnss@2.1-impl-qti \
    android.hardware.gnss@2.1-service-qti \
    android.hardware.gnss@2.1.vendor \

# Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.4-impl \
    android.hardware.graphics.composer@2.4-service \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    gralloc.sm6150 \
    hwcomposer.sm6150 \
    libdisplayconfig.qti \
    libdisplayconfig.qti.vendor \
    libqdMetaData \
    libqdMetaData.vendor \
    libsdmcore \
    libsdmutils \
    libtinyxml \
    libion \
    libvulkan \
    vendor.display.color@1.0 \
    vendor.display.color@1.1 \
    vendor.display.color@1.2 \
    vendor.display.color@1.3 \
    vendor.display.config@1.0 \
    vendor.display.config@1.1 \
    vendor.display.config@1.2 \
    vendor.display.config@1.3 \
    vendor.display.config@1.4 \
    vendor.display.config@1.5 \
    vendor.display.config@2.0 \
    vendor.display.postproc@1.0 \
    vendor.display.color@1.0.vendor \
    vendor.display.color@1.1.vendor \
    vendor.display.color@1.2.vendor \
    vendor.display.color@1.3.vendor \
    vendor.display.color@1.4.vendor \
    vendor.display.color@1.5.vendor \
    vendor.display.config@1.0.vendor \
    vendor.display.config@1.1.vendor \
    vendor.display.config@1.2.vendor \
    vendor.display.config@1.3.vendor \
    vendor.display.config@1.4.vendor \
    vendor.display.config@1.5.vendor \
    vendor.display.config@1.6.vendor \
    vendor.display.config@1.7.vendor \
    vendor.display.config@1.8.vendor \
    vendor.display.config@1.9.vendor \
    vendor.display.config@1.10.vendor \
    vendor.display.config@1.11.vendor \
    vendor.display.config@2.0.vendor \
    vendor.display.postproc@1.0.vendor \
    vendor.qti.hardware.display.allocator-service \
    vendor.qti.hardware.display.mapper@1.0.vendor \
    vendor.qti.hardware.display.mapper@1.1.vendor \
    vendor.qti.hardware.display.mapper@2.0.vendor \
    vendor.qti.hardware.display.mapper@3.0.vendor \
    vendor.qti.hardware.display.mapper@4.0.vendor \

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service \

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0.vendor \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder \
    libhwbinder.vendor \

# IPACM
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml \
    libipanat \
    liboffloadhal \

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.0-service.samsung \
    libskeymaster4device.vendor:64 \
    libkeymaster4support.vendor:64 \
    libkeymaster4_1support.vendor:64 \

# Keylayout
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/usr/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service \
    lights.sm6150 \

# Media
PRODUCT_PACKAGES += \
    libavservices_minijail \
    libavservices_minijail.vendor \

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_ac4.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_ac4.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_c2_sec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2_sec.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_c2_sec_ape.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2_sec_ape.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_c2_sec_qcp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2_sec_qcp.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_c2_sec_wmx.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2_sec_wmx.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_ddp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_ddp.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_dolby_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_dolby_audio.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_performance_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_v1.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_performance_v2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_v2.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_sec_ape.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_sec_ape.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_sec_primary.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_sec_primary.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_sec_qcp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_sec_qcp.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_sec_video_primary.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_sec_video_primary.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_v1.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_v2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_v2.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_vendor_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_v1.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_codecs_vendor_v2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_v2.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml \

# Memtrack
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    memtrack.sm6150 \

# NFC
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/nfc/libnfc-nxp_RF.conf:$(TARGET_COPY_OUT_VENDOR)/etc/nfc/libnfc-nxp_RF.conf \
    $(COMMON_PATH)/rootdir/vendor/etc/libnfc-mtp-SN100.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-mtp-SN100.conf \
    $(COMMON_PATH)/rootdir/vendor/etc/libnfc-mtp-SN100_38_4MHZ.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-mtp-SN100_38_4MHZ.conf \
    $(COMMON_PATH)/rootdir/vendor/etc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(COMMON_PATH)/rootdir/vendor/etc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf \
    $(COMMON_PATH)/rootdir/vendor/etc/libnfc-nxp_RF.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp_RF.conf \
    $(COMMON_PATH)/rootdir/vendor/etc/libnfc-qrd-SN100.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-qrd-SN100.conf \
    $(COMMON_PATH)/rootdir/vendor/etc/libnfc-qrd-SN100_38_4MHZ.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-qrd-SN100_38_4MHZ.conf \

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

PRODUCT_PACKAGE_OVERLAYS += \
    $(COMMON_PATH)/overlay \
    $(COMMON_PATH)/overlay-lineage \

# Performance
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/perf/commonresourceconfigs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/perf/commonresourceconfigs.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/perf/perfboostsconfig.xml:$(TARGET_COPY_OUT_VENDOR)/etc/perf/perfboostsconfig.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/perf/perfconfigstore.xml:$(TARGET_COPY_OUT_VENDOR)/etc/perf/perfconfigstore.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/perf/targetconfig.xml:$(TARGET_COPY_OUT_VENDOR)/etc/perf/targetconfig.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/perf/targetresourceconfigs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/perf/targetresourceconfigs.xml \

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.ese.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.sd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.sd.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \

# Power
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml \

# Public Libraries
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt \

# QTI
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/etc/permissions/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml \
    $(COMMON_PATH)/rootdir/etc/sysconfig/qti_whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/qti_whitelist.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/secnvm/k250a_00000200.img:$(TARGET_COPY_OUT_VENDOR)/etc/secnvm/k250a_00000200.img \
    $(COMMON_PATH)/rootdir/vendor/etc/ssg/ta_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/ssg/ta_config.json \
    $(COMMON_PATH)/rootdir/vendor/etc/ssg/tz_whitelist.json:$(TARGET_COPY_OUT_VENDOR)/etc/ssg/tz_whitelist.json \
    $(COMMON_PATH)/rootdir/vendor/etc/str/str_preference_data.dat:$(TARGET_COPY_OUT_VENDOR)/etc/str/str_preference_data.dat \
    $(COMMON_PATH)/rootdir/vendor/etc/btcon.json:$(TARGET_COPY_OUT_VENDOR)/etc/btcon.json \
    $(COMMON_PATH)/rootdir/vendor/etc/config_chipset.json:$(TARGET_COPY_OUT_VENDOR)/etc/config_chipset.json \
    $(COMMON_PATH)/rootdir/vendor/etc/config_vendor.json:$(TARGET_COPY_OUT_VENDOR)/etc/config_vendor.json \
    $(COMMON_PATH)/rootdir/vendor/etc/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf \
    $(COMMON_PATH)/rootdir/vendor/etc/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config \
    $(COMMON_PATH)/rootdir/vendor/etc/sec_config_oem:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config_oem \
    $(COMMON_PATH)/rootdir/vendor/etc/snap_gpu_kernel_64.bin:$(TARGET_COPY_OUT_VENDOR)/etc/snap_gpu_kernel_64.bin \

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.nfc.samsung.rc \
    init.qcom.factory.rc \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.qti.qcv.rc \
    init.qti.ufs.rc \
    init.samsung.bsp.rc \
    init.samsung.display.rc \
    init.samsung.rc \
    init.target.rc \
    init.vendor.onebinary.rc \
    init.vendor.rilchip.rc \
    init.vendor.rilcommon.rc \
    init.vendor.sensors.rc \
    init.vendor.sysfw.rc \
    ueventd.qcom.rc \
    vendor.qti.rmt_storage.rc \
    vendor.qti.tftp.rc \
    wifi_qcom.rc \
    wifi_sec.rc \
    init.class_main.sh \
    init.crda.sh \
    init.mdm.sh \
    init.qcom.class_core.sh \
    init.qcom.coex.sh \
    init.qcom.early_boot.sh \
    init.qcom.efs.sync.sh \
    init.qcom.post_boot.sh \
    init.qcom.sdio.sh \
    init.qcom.sensors.sh \
    init.qcom.sh \
    init.qcom.usb.sh \
    init.qti.chg_policy.sh \
    init.qti.dcvs.sh \
    init.qti.qcv.sh \
    qca6234-service.sh \

# Recovery
AB_OTA_UPDATER := false

PRODUCT_PACKAGES += \
    init.recovery.qcom.rc \

# RenderScript
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl \

# RIL
PRODUCT_PACKAGES += \
    android.hardware.radio@1.5 \
    android.hardware.radio.config@1.2 \
    libxml2 \

# Seccomp
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/seccomp_policy/atfwd@2.0.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/atfwd@2.0.policy \
    $(COMMON_PATH)/rootdir/vendor/etc/seccomp_policy/codec2.vendor.base.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/codec2.vendor.base.policy \
    $(COMMON_PATH)/rootdir/vendor/etc/seccomp_policy/codec2.vendor.ext.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/codec2.vendor.ext.policy \
    $(COMMON_PATH)/rootdir/vendor/etc/seccomp_policy/configstore@1.1.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/configstore@1.1.policy \
    $(COMMON_PATH)/rootdir/vendor/etc/seccomp_policy/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(COMMON_PATH)/rootdir/vendor/etc/seccomp_policy/mediaextractor_sec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor_sec.policy \
    $(COMMON_PATH)/rootdir/vendor/etc/seccomp_policy/vendor.qti.hardware.dsp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/vendor.qti.hardware.dsp.policy \

# Sensors
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/etc/permissions/com.samsung.permission.SSENSOR.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.samsung.permission.SSENSOR.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf \
    $(COMMON_PATH)/rootdir/vendor/etc/sensors/sns_reg_config:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sns_reg_config \

# Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(COMMON_PATH) \

# WiFi
PRODUCT_PACKAGES += \
    WifiOverlay \

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/wifi/icm.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/icm.conf \
    $(COMMON_PATH)/rootdir/vendor/etc/wifi/indoorchannel.info:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/indoorchannel.info \
    $(COMMON_PATH)/rootdir/vendor/etc/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(COMMON_PATH)/rootdir/vendor/etc/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
    $(COMMON_PATH)/rootdir/vendor/etc/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
    $(COMMON_PATH)/rootdir/vendor/etc/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \

# Get non-open-source specific aspects
$(call inherit-product, vendor/samsung/sm6150-common/sm6150-common-vendor.mk)
