ARCHS = arm64 armv7

include theos/makefiles/common.mk

TWEAK_NAME = Calypso
Calypso_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk


SUBPROJECTS += calypso
include $(THEOS_MAKE_PATH)/aggregate.mk
