LOCAL_PATH:= $(call my-dir)

#fastcv related start
include $(CLEAR_VARS)
LOCAL_MODULE    := libfastcv
LOCAL_SRC_FILES := fastcv/libfastcv.a
include $(PREBUILT_STATIC_LIBRARY)
#fastcv related end



#opencv related start
include $(CLEAR_VARS)
OPENCV_INSTALL_MODULES:=on
#OPENCV_CAMERA_MODULES:=off
#include C:\Android\OpenCV-android-sdk\sdk\native\jni\OpenCV.mk
include C:\Android\opencv4.3-android-sdk-fromsource\sdk\native\jni\OpenCV-arm64-v8a.mk
include $(CLEAR_VARS)
LOCAL_MODULE    := opencv_java_prebuilt
LOCAL_SRC_FILES := ../jniLibs/arm64-v8a/libopencv_java4.so
OPENCV_LIB_TYPE:=STATIC
include $(PREBUILT_SHARED_LIBRARY)
#opencv related end

#opencv gui lib start
include $(CLEAR_VARS)
LOCAL_MODULE    := opencv_highgui
LOCAL_SRC_FILES := libopencv_highgui.a
include $(PREBUILT_STATIC_LIBRARY)
#opencv gui lib end

include $(CLEAR_VARS)
LOCAL_PRELINK_MODULE:= false

# This variable determines the OpenGL ES API version to use:
# If set to true, OpenGL ES 1.1 is used, otherwise OpenGL ES 2.0.

USE_OPENGL_ES_1_1 := false

# Set OpenGL ES version-specific settings.

ifeq ($(USE_OPENGL_ES_1_1), true)
    OPENGLES_LIB  := -lGLESv1_CM
    OPENGLES_DEF  := -DUSE_OPENGL_ES_1_1
else
    OPENGLES_LIB  := -lGLESv2
    OPENGLES_DEF  := -DUSE_OPENGL_ES_2_0
endif

# An optional set of compiler flags that will be passed when building
# C ***AND*** C++ source files.
#
# NOTE: flag "-Wno-write-strings" removes warning about deprecated conversion
#       from string constant to 'char*'

LOCAL_CFLAGS := -Wno-write-strings $(OPENGLES_DEF)

# The list of additional linker flags to be used when building your
# module. This is useful to pass the name of specific system libraries
# with the "-l" prefix.

LOCAL_LDLIBS := \
     -llog $(OPENGLES_LIB)
#LOCAL_LDFLAGS:= -Wl,--no-fix-cortex-a8

LOCAL_MODULE    := libfastcvsample
LOCAL_CFLAGS    := -Werror
LOCAL_SRC_FILES := \
    loadjpeg.cpp

LOCAL_STATIC_LIBRARIES := libfastcv opencv_highgui
LOCAL_SHARED_LIBRARIES := opencv_java_prebuilt
#LOCAL_SHARED_LIBRARIES := liblog libGLESv2
LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/fastcv/inc \
LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/fastcv

LOCAL_C_INCLUDES += .
LOCAL_C_INCLUDES += C:\Android\opencv4.3-android-sdk-fromsource\sdk\native\jni\include



LOCAL_MODULE_OWNER := qcom
LOCAL_PROPRIETARY_MODULE := true

include $(BUILD_SHARED_LIBRARY)


include $(CLEAR_VARS)

LOCAL_STATIC_JAVA_LIBRARIES :=
LOCAL_JNI_SHARED_LIBRARIES := libfastcvsample
LOCAL_SRC_FILES := $(call all-subdir-java-files)
LOCAL_PACKAGE_NAME := FastCVSample

include $(BUILD_PACKAGE)

