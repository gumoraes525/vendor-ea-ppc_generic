LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
endif

file := $(INSTALLED_KERNEL_TARGET)
ALL_PREBUILT += $(file)
$(file): $(TARGET_PREBUILT_KERNEL) | $(ACP)
	$(transform-prebuilt-to-target)

ifeq ($(TARGET_PROVIDES_INIT_RC),true)
file := $(TARGET_ROOT_OUT)/init.rc
$(file): $(LOCAL_PATH)/init.rc | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)
endif

# vold.conf
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/vold.conf:system/etc/vold.conf

# Ethernet
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/init.ppc_generic.sh:system/etc/init.ppc_generic.sh

ifeq ($(strip $(BOARD_USES_ALSA_AUDIO)),true)
ifeq ($(wildcard $(LOCAL_PATH)/asound.conf),)
$(error $(LOCAL_PATH)/asound.conf not found, create one for your hardware)
else
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/asound.conf:system/etc/asound.conf
endif
endif

include frameworks/base/data/sounds/OriginalAudio.mk
