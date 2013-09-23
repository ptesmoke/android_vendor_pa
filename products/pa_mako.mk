# Copyright (C) 2012 ParanoidAndroid Project
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

# Check for target product
ifeq (pa_mako,$(TARGET_PRODUCT))

# Define PA bootanimation size
PARANOID_BOOTANIMATION_NAME := XHDPI

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_mako

# Build paprefs from sources
PREFS_FROM_SOURCE ?= false

# Specify phone tech before including full_phone
$(call inherit-product, vendor/pa/config/gsm.mk)

# Include ParanoidAndroid common configuration
include vendor/pa/config/pa_common.mk

# Enhanced NFC
$(call inherit-product, vendor/pa/config/nfc_enhanced.mk)

# Inherit AOSP device configuration
$(call inherit-product, device/lge/mako/full_mako.mk)

# Include CM extras
EXTRA_CM_PACKAGES ?= true

PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/common/apk/TricksterMod.apk:system/app/TricksterMod.apk

# Override AOSP build properties
PRODUCT_NAME := pa_mako
PRODUCT_BRAND := LGE
PRODUCT_MODEL := Nexus 4 
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=mako BUILD_FINGERPRINT="lge/occoma/mako:4.3/JSS15J/737497:user/release-keys" PRIVATE_BUILD_DESC="occoma-user 4.3 JSS15J 737497 release-keys"

# Include ParanoidAndroid repos configuration
include vendor/pa/config/pa_addons.mk

endif
