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
BOOL elevenEnabled;
BOOL twelveEnabled;
BOOL thirteenEnabled;
BOOL fourteenEnabled;
BOOL fifteenEnabled;
BOOL sixteenEnabled;
BOOL seventeenEnabled;

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
-(bool) pinchToClose
{
	return sixteenEnabled ? YES : %orig;
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

%hook SBIconPageIndicatorImageSetResult
-(id) pageIndicatorSet
{
	return elevenEnabled ? NULL : %orig;
}
-(id) enabledPageIndicatorSet
{
	return elevenEnabled ? NULL : %orig;
}
%end

%hook TFNTwitterRelationship
-(BOOL) isBlockingCurrentAccount
{
	return twelveEnabled ? NO : %orig;
}
%end

%hook TFNTwitterAccount
-(BOOL) isHomeTimelineNewTweetsBannerExperimentEnabledLogImpression:(BOOL)arg1
{
	return thirteenEnabled ? YES : %orig;
}
%end

%hook SBControlCenterSettings
-(BOOL) useNewBounce
{
	return fourteenEnabled ? NO : %orig;
}
%end

%hook SBLockScreenViewController
-(bool)_forcesPortraitOrientation
{
	return fifteenEnabled ? NO : %orig;
}
-(bool) shouldAutorotateToInterfaceOrientation:(long long)arg1
{
	return fifteenEnabled ? %orig(false) : %orig;
}
%end

%hook SBNewsstandIcon
-(id) displayName
{
	return seventeenEnabled ? NULL : %orig;
}
%end

%hook SBNewsstandFolder 
-(void) setDisplayName:(id)arg1
{
	return seventeenEnabled ? %orig(NULL) : %orig;
}
%end

%hook SBFolder 
-(void) setDisplayName:(id)arg1
{
	return seventeenEnabled ? %orig(NULL) : %orig;
}
%end

%hook SBApplication
-(id) iconDisplayName:(id)arg1
{
	return seventeenEnabled ? NULL : %orig;
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

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("elevenEnabled"), CFSTR("red.dingo.calypso"));
    elevenEnabled = !tempVal ? YES : [tempVal boolValue]; 

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("twelveEnabled"), CFSTR("red.dingo.calypso"));
    twelveEnabled = !tempVal ? YES : [tempVal boolValue]; 

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("thirteenEnabled"), CFSTR("red.dingo.calypso"));
    thirteenEnabled = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("fourteenEnabled"), CFSTR("red.dingo.calypso"));
    fourteenEnabled = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("fifteenEnabled"), CFSTR("red.dingo.calypso"));
    fifteenEnabled = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("sixteenEnabled"), CFSTR("red.dingo.calypso"));
    sixteenEnabled = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("seventeenEnabled"), CFSTR("red.dingo.calypso"));
    seventeenEnabled = !tempVal ? YES : [tempVal boolValue];

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
