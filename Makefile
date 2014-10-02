TARGET = iphone:clang:latest:5.0

SUBPROJECTS = Tweak ActionMenu

include theos/makefiles/common.mk
include $(THEOS_MAKE_PATH)/aggregate.mk

VERSION.INC_BUILD_NUMBER = 4
