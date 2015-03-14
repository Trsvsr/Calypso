ARCHS = arm64 armv7
THEOS_BUILD_DIR = Packages
#change $(THEOS) to theos if this doesn't compile properly for you
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Calypso
Calypso_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
SUBPROJECTS += calypso
include $(THEOS_MAKE_PATH)/aggregate.mk
