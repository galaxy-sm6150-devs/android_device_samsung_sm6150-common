LOCAL_PATH := $(call my-dir)

ifeq ($(call is-vendor-board-platform,QCOM),true)

include $(CLEAR_VARS)

LOCAL_MODULE_RELATIVE_PATH := hw

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libcutils \
    libdl \
    libbase \
    libutils \
    android.hardware.power-V1-ndk_platform \
    libbinder_ndk

LOCAL_HEADER_LIBRARIES := \
    libhardware_headers

LOCAL_SRC_FILES := \
    power-common.c \
    metadata-parser.c \
    utils.c \
    list.c \
    hint-data.c \
    Power.cpp \
    main.cpp

LOCAL_CFLAGS += -Wall -Wextra -Werror

ifeq ($(call is-board-platform-in-list,sm6150), true)
LOCAL_SRC_FILES += power-sm6150.c
endif

endif # End of board specific list

ifneq ($(TARGET_POWERHAL_MODE_EXT),)
    LOCAL_CFLAGS += -DMODE_EXT
    LOCAL_SRC_FILES += ../../../../$(TARGET_POWERHAL_MODE_EXT)
endif

ifneq ($(TARGET_POWERHAL_SET_INTERACTIVE_EXT),)
    LOCAL_CFLAGS += -DSET_INTERACTIVE_EXT
    LOCAL_SRC_FILES += ../../../../$(TARGET_POWERHAL_SET_INTERACTIVE_EXT)
endif

ifneq ($(TARGET_TAP_TO_WAKE_NODE),)
    LOCAL_CFLAGS += -DTAP_TO_WAKE_NODE=\"$(TARGET_TAP_TO_WAKE_NODE)\"
endif

ifeq ($(TARGET_USES_INTERACTION_BOOST),true)
    LOCAL_CFLAGS += -DINTERACTION_BOOST
endif

LOCAL_MODULE := android.hardware.power-service-qti.sm6150
LOCAL_INIT_RC := android.hardware.power-service-qti.sm6150.rc
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -Wno-unused-parameter -Wno-unused-variable
LOCAL_VENDOR_MODULE := true
LOCAL_VINTF_FRAGMENTS := android.hardware.power-service-qti.sm6150.xml

include $(BUILD_EXECUTABLE)
