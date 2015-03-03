ARCHS = arm64 armv7

include theos/makefiles/common.mk

BUNDLE_NAME = Calypso
Calypso_FILES = Calypso.mm
Calypso_INSTALL_PATH = /Library/PreferenceBundles
Calypso_FRAMEWORKS = UIKit
Calypso_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Calypso.plist$(ECHO_END)
