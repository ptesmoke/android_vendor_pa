# Copyright (C) 2013 ParanoidAndroid Project
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
ifeq (pa_g2,$(TARGET_PRODUCT))

# Define PA bootanimation size
PARANOID_BOOTANIMATION_NAME := XXHDPI

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_g2

# Build paprefs from sources
PREFS_FROM_SOURCE := false

# Specify phone tech before including full_phone  
$(call inherit-product-if-exists, vendor/pa/config/gsm.mk)

# Include ParanoidAndroid common configuration
include vendor/pa/config/pa_common.mk

$(call inherit-product, device/lge/g2/g2.mk)

# Include CM extras
EXTRA_CM_PACKAGES ?= true

# Override AOSP build properties
PRODUCT_NAME := pa_g2
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG G2
PRODUCT_MANUFACTURER := LGE

# Include ParanoidAndroid repos configuration
include vendor/pa/config/pa_addons.mk

endif
