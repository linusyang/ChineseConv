ARCHS = armv7 arm64

include theos/makefiles/common.mk

ADDITIONAL_CFLAGS += --std=c++11 -stdlib=libc++ -I../rocket -fvisibility=hidden

TWEAK_NAME = CConvService
CConvService_FILES = CConvService.x OpenCC.mm $(wildcard opencc/*.cpp)
CConvService_LIBRARIES = c++
CConvService_PRIVATE_FRAMEWORKS = AppSupport

include $(THEOS_MAKE_PATH)/tweak.mk

stage::
	find "$(THEOS_STAGING_DIR)" -type f \( -iname "*.strings" -o -iname "*.plist" \) -exec plutil -convert binary1 {} \;
