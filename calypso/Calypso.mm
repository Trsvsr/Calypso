#import <Preferences/PSSpecifier.h>
#import <Preferences/PSListController.h>

@interface CalypsoListController: PSListController {
}
@end

@protocol PreferencesTableCustomView
- (id)initWithSpecifier:(id)arg1;

@optional
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1;
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 inTableView:(id)arg2;
@end

@interface CalypsoCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *label;
    UILabel *underLabel;
}
@end

@implementation CalypsoCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
        int width = [[UIScreen mainScreen] bounds].size.width;
        CGRect labelFrame = CGRectMake(0, -15, width, 60);
        CGRect underLabelFrame = CGRectMake(0, 20, width, 60);
        
        label = [[UILabel alloc] initWithFrame:labelFrame];
        [label setNumberOfLines:1];
        label.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
        [label setText:@"Calypso"];
        [label setBackgroundColor:[UIColor clearColor]];
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentCenter;
        
        underLabel = [[UILabel alloc] initWithFrame:underLabelFrame];
        [underLabel setNumberOfLines:1];
        underLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
        [underLabel setText:@"by Trevor Schmitt and Dingo"];
        [underLabel setBackgroundColor:[UIColor clearColor]];
        underLabel.textColor = [UIColor grayColor];
        underLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
        [self addSubview:underLabel];
        
    }
    return self;
}
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    CGFloat prefHeight = 75.0;
    return prefHeight;
}
@end

@implementation CalypsoListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Calypso" target:self] retain];
	}
	return _specifiers;
}
-(void)respring{
system("killall -9 backboardd");
}
- (void)save
{
    [self.view endEditing:YES];
}
- (void)followTwitter:(id)sender {
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *tweetbot = [NSURL URLWithString:@"tweetbot:///user_profile/T_Dogg_94"];
    if ([app canOpenURL:tweetbot]) {
        [app openURL:tweetbot];
    }
    
    else {
        NSURL *twitterapp = [NSURL URLWithString:@"twitter:///user?screen_name=T_Dogg_94"];
        if ([app canOpenURL:twitterapp]) {
            [app openURL:twitterapp];
        }
        
        else {
            NSURL *twitterweb = [NSURL URLWithString:@"http://twitter.com/T_Dogg_94"];
            [app openURL:twitterweb];
        }
    }
}
- (void)followDingoTwitter:(id)sender {
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *tweetbot = [NSURL URLWithString:@"tweetbot:///user_profile/CPVideoMaker"];
    if ([app canOpenURL:tweetbot]) {
        [app openURL:tweetbot];
    }
    
    else {
        NSURL *twitterapp = [NSURL URLWithString:@"twitter:///user?screen_name=CPVideoMaker"];
        if ([app canOpenURL:twitterapp]) {
            [app openURL:twitterapp];
        }
        
        else {
            NSURL *twitterweb = [NSURL URLWithString:@"http://twitter.com/CPVideoMaker"];
            [app openURL:twitterweb];
        }
    }
}

@end

// vim:ft=objc
