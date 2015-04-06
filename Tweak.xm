BOOL masterEnabled;
BOOL VoiceControl;
BOOL Spotlight;
BOOL LSBlur;
BOOL LSTint;
BOOL Nested;
BOOL BetaDot;
BOOL SlowAnim;
BOOL HSRotate;
BOOL iPadDock;
BOOL StaticDock;
BOOL NoPageDots;
BOOL NotBlocked;
BOOL NewTweets;
BOOL OldBounce;
BOOL LSRotate;
BOOL PinchToClose;
BOOL NoLabels;
BOOL NewsFolder;

%group EVERYTHING

%hook SBVoiceControlController
-(bool) handleHomeButtonHeld
{
    return VoiceControl ? NO : %orig;
}
%end

%hook SBSearchScrollView
-(bool) gestureRecognizerShouldBegin:(id)arg1
{
    return Spotlight ? NO : %orig;
}
%end

%hook SBLockOverlayStyleProperties
-(CGFloat) blurRadius
{
    return LSBlur ? 0 : %orig;
}
%end

%hook SBLockOverlayStyleProperties   
-(CGFloat) tintAlpha
{
    return LSTint ? 0 : %orig;
}
%end

%hook SBFolderSettings
-(bool) allowNestedFolders
{
    return Nested ? YES : %orig;
}
-(bool) pinchToClose
{
	return PinchToClose ? YES : %orig;
}
%end

%hook SBLeafIcon
-(bool) isBeta
{
    return BetaDot ? NO : %orig;
}    
%end

%hook SBFAnimationFactorySettings
-(void) setSlowAnimations:(bool)arg1
{
    return SlowAnim ? %orig(false) : %orig;
}
%end

%hook SpringBoard
-(bool) homeScreenRotationStyleWantsUIKitRotation
{
    return HSRotate ? YES : %orig;
}
-(bool) homeScreenSupportsRotation
{
	return HSRotate ? YES : %orig;
}
-(long long) homeScreenRotationStyle
{
if (iPadDock)
{
	return 1;
}
else
{
	if (StaticDock)
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
	return NoPageDots ? NULL : %orig;
}
-(id) enabledPageIndicatorSet
{
	return NoPageDots ? NULL : %orig;
}
%end

%hook TFNTwitterRelationship
-(BOOL) isBlockingCurrentAccount
{
	return NotBlocked ? NO : %orig;
}
%end

%hook TFNTwitterAccount
-(BOOL) isHomeTimelineNewTweetsBannerExperimentEnabledLogImpression:(BOOL)arg1
{
	return NewTweets ? YES : %orig;
}
%end

%hook SBControlCenterSettings
-(BOOL) useNewBounce
{
	return OldBounce ? NO : %orig;
}
%end

%hook SBLockScreenViewController
-(bool)_forcesPortraitOrientation
{
	return LSRotate ? NO : %orig;
}
-(bool) shouldAutorotateToInterfaceOrientation:(long long)arg1
{
	return LSRotate ? NO : %orig;
}
%end

%hook SBNewsstandIcon
-(id) displayName
{
	return NoLabels ? NULL : %orig;
}
%end

%hook SBNewsstandFolder 
-(void) setDisplayName:(id)arg1
{
	return NoLabels ? %orig(NULL) : %orig;
}
%end

%hook SBFolder 
-(void) setDisplayName:(id)arg1
{
	return NoLabels ? %orig(NULL) : %orig;
}
%end

%hook SBApplication
-(id) iconDisplayName:(id)arg1
{
	return NoLabels ? NULL : %orig;
}
%end

%hook SBFolder
-(bool) isNewsstandFolder
{
	return NewsFolder ? YES : %orig;
}
%end

static void loadPreferences() {
    CFPreferencesAppSynchronize(CFSTR("red.dingo.calypso"));
    NSNumber *tempVal;

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("masterEnabled"), CFSTR("red.dingo.calypso"));
    masterEnabled = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("VoiceControl"), CFSTR("red.dingo.calypso"));
    VoiceControl = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Spotlight"), CFSTR("red.dingo.calypso"));
    Spotlight = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("LSBlur"), CFSTR("red.dingo.calypso"));
    LSBlur = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("LSTint"), CFSTR("red.dingo.calypso"));
    LSTint = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("Nested"), CFSTR("red.dingo.calypso"));
    Nested = !tempVal ? YES : [tempVal boolValue];
    
    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("BetaDot"), CFSTR("red.dingo.calypso"));
    BetaDot = !tempVal ? YES : [tempVal boolValue];
    
    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("SlowAnim"), CFSTR("red.dingo.calypso"));
    SlowAnim = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("HSRotate"), CFSTR("red.dingo.calypso"));
    HSRotate = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("iPadDock"), CFSTR("red.dingo.calypso"));
    iPadDock = !tempVal ? YES : [tempVal boolValue];  
    
    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("StaticDock"), CFSTR("red.dingo.calypso"));
    StaticDock = !tempVal ? YES : [tempVal boolValue]; 

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("NoPageDots"), CFSTR("red.dingo.calypso"));
    NoPageDots = !tempVal ? YES : [tempVal boolValue]; 

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("NotBlocked"), CFSTR("red.dingo.calypso"));
    NotBlocked = !tempVal ? YES : [tempVal boolValue]; 

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("NewTweets"), CFSTR("red.dingo.calypso"));
    NewTweets = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("OldBounce"), CFSTR("red.dingo.calypso"));
    OldBounce = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("LSRotate"), CFSTR("red.dingo.calypso"));
    LSRotate = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("PinchToClose"), CFSTR("red.dingo.calypso"));
    PinchToClose = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("NoLabels"), CFSTR("red.dingo.calypso"));
    NoLabels = !tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("NewsFolder"), CFSTR("red.dingo.calypso"));
    NewsFolder = !tempVal ? YES : [tempVal boolValue];

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
