BOOL masterEnabled;
BOOL oneEnabled;
BOOL twoEnabled;
BOOL threeEnabled;
BOOL fourEnabled;
BOOL fiveEnabled;
BOOL sixEnabled;
BOOL sevenEnabled;
BOOL eightEnabled;
BOOL nineEnabled;
BOOL tenEnabled;

%group EVERYTHING

%hook SBVoiceControlController
-(bool) handleHomeButtonHeld
{
    return oneEnabled ? NO : %orig;
}
%end

%hook SBSearchScrollView
-(bool) gestureRecognizerShouldBegin:(id)arg1
{
    return twoEnabled ? NO : %orig;
}
%end

%hook SBLockOverlayStyleProperties
-(CGFloat) blurRadius
{
    return threeEnabled ? 0 : %orig;
}
%end

%hook SBLockOverlayStyleProperties   
-(CGFloat) tintAlpha
{
    return fourEnabled ? 0 : %orig;
}
%end

%hook SBFolderSettings
-(bool) allowNestedFolders
{
    return fiveEnabled ? YES : %orig;
}
%end

%hook SBLeafIcon
-(bool) isBeta
{
    return sixEnabled ? NO : %orig;
}    
%end

%hook SBFAnimationFactorySettings
-(void) setSlowAnimations:(bool)arg1
{
    return sevenEnabled ? %orig(false) : %orig;
}
%end

%hook SpringBoard
-(bool) homeScreenRotationStyleWantsUIKitRotation
{
    return eightEnabled ? YES : %orig;
}
-(bool) homeScreenSupportsRotation
{
	return eightEnabled ? YES : %orig;
}
-(long long) homeScreenRotationStyle
{
if (nineEnabled)
{
	return 1;
}
else
{
	if (tenEnabled)
	{
		return 2;
	}
	else
	{
		return %orig;
	}
}
}
%end

static void loadPreferences() {
    CFPreferencesAppSynchronize(CFSTR("red.dingo.calypso"));
    NSNumber *tempVal;

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("masterEnabled"), CFSTR("red.dingo.calypso"));
    masterEnabled = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("oneEnabled"), CFSTR("red.dingo.calypso"));
    oneEnabled = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("twoEnabled"), CFSTR("red.dingo.calypso"));
    twoEnabled = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("threeEnabled"), CFSTR("red.dingo.calypso"));
    threeEnabled = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("fourEnabled"), CFSTR("red.dingo.calypso"));
    fourEnabled = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("fiveEnabled"), CFSTR("red.dingo.calypso"));
    fiveEnabled = !tempVal ? YES : [tempVal boolValue];
    
    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("sixEnabled"), CFSTR("red.dingo.calypso"));
    sixEnabled = !tempVal ? YES : [tempVal boolValue];
    
    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("sevenEnabled"), CFSTR("red.dingo.calypso"));
    sevenEnabled = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("eightEnabled"), CFSTR("red.dingo.calypso"));
    eightEnabled = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("nineEnabled"), CFSTR("red.dingo.calypso"));
    nineEnabled = !tempVal ? YES : [tempVal boolValue];  
    
    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("tenEnabled"), CFSTR("red.dingo.calypso"));
    tenEnabled = !tempVal ? YES : [tempVal boolValue]; 

    [tempVal release];
}
%end        

%ctor {

    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
        NULL,
        (CFNotificationCallback)loadPreferences,
        CFSTR("red.dingo.calypso/settingschanged"),
        NULL,
        CFNotificationSuspensionBehaviorDeliverImmediately);
    loadPreferences();

    if (masterEnabled)
        %init(EVERYTHING);
    }
