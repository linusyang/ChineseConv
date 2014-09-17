ARCHS = armv7 arm64

include theos/makefiles/common.mk

ADDITIONAL_CFLAGS += -I../rocket

LIBRARY_NAME = ChineseConv
ChineseConv_FILES = ChineseConv.m
ChineseConv_INSTALL_PATH = /Library/ActionMenu/Plugins
ChineseConv_FRAMEWORKS = UIKit
ChineseConv_PRIVATE_FRAMEWORKS = AppSupport

include $(THEOS_MAKE_PATH)/library.mk
