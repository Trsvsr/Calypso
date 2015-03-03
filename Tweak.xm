static BOOL masterEnabled;

//what kind of variable names are these?
static BOOL oneEnabled;
static BOOL twoEnabled;
static BOOL threeEnabled;
static BOOL fourEnabled;
static BOOL fiveEnabled;
static BOOL sixEnabled;
static BOOL sevenEnabled;

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
    return fiveEnabled ? YES: %orig;
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

static void loadPreferences() {
    CFPreferencesAppSynchronize(CFSTR("red.dingo.calypso"));
    NSNumber *tempVal;

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("masterEnabled"), CFSTR("red.dingo.calypso"));
    masterEnabled = tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("oneEnabled"), CFSTR("red.dingo.calypso"));
    oneEnabled = tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("twoEnabled"), CFSTR("red.dingo.calypso"));
    twoEnabled = tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("threeEnabled"), CFSTR("red.dingo.calypso"));
    threeEnabled = tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("fourEnabled"), CFSTR("red.dingo.calypso"));
    fourEnabled = tempVal ? YES : [tempVal boolValue];

    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("fiveEnabled"), CFSTR("red.dingo.calypso"));
    fiveEnabled = tempVal ? YES : [tempVal boolValue];
    
    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("sixEnabled"), CFSTR("red.dingo.calypso"));
    sixEnabled = tempVal ? YES : [tempVal boolValue];
    
    tempVal = (NSNumber *)CFPreferencesCopyAppValue(CFSTR("sevenEnabled"), CFSTR("red.dingo.calypso"));
    sevenEnabled = tempVal ? YES : [tempVal boolValue];
    
    [tempVal release];
}

%ctor {

    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
        NULL,
        (CFNotificationCallback)loadPreferences,
        CFSTR("red.dingo.calyspo/settingschanged"),
        NULL,
        CFNotificationSuspensionBehaviorDeliverImmediately);
    loadPreferences();

    if (masterEnabled)
        %init(EVERYTHING);
}
%end
