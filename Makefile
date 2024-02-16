THEOS_DEVICE_IP = 192.168.31.158
TARGET := iphone:clang:14.5
ARCHS = arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = StoreSwitcher
$(TWEAK_NAME)_FILES = Tweak.xm SSViewController.m SSTableViewCell.m
$(TWEAK_NAME)_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 AppStore"

clean::
	rm -rf .theos
	rm -rf packages