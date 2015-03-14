#import <Preferences/PSSpecifier.h>
#import <Preferences/PSListController.h>
#import <Twitter/TWTweetComposeViewController.h>

@interface CalypsoListController: PSListController {
}
@end

#define kTintColor [UIColor colorWithRed:86.0/256.0 green:86.0/256.0 blue:92.0/256.0 alpha:1.0]
#define kTweetText @"I'm using #Calypso by @T_Dogg_94 and @CPVideoMaker to access many internal settings of iOS!"

@protocol PreferencesTableCustomView
- (id)initWithSpecifier:(id)arg1;

@optional
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1;
- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 inTableView:(id)arg2;
@end

@interface CalypsoCustomCell : UITableViewCell <PreferencesTableCustomView> {
    UILabel *label;
    UILabel *underLabel;
    UILabel *easterEggText;
}
@end

@implementation CalypsoCustomCell
- (id)initWithSpecifier:(PSSpecifier *)specifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    if (self) {
        //bad idea to use UIScreen and Bounds, iPads don't like that
        //int width = [[UIScreen mainScreen] bounds].size.width;
        //so instead, let's use this
        #define kWidth [[UIApplication sharedApplication] keyWindow].frame.size.width
        CGRect labelFrame = CGRectMake(0, -15, kWidth, 60);
        CGRect underLabelFrame = CGRectMake(0, 20, kWidth, 60);
        CGRect centeredText = CGRectMake(0,-200, kWidth, 60);
        
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

        easterEggText = [[UILabel alloc] initWithFrame:centeredText];
        [easterEggText setNumberOfLines:1];
        easterEggText.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
        [easterEggText setText:@"Nothing special to see here, go back down."];
        [easterEggText setBackgroundColor:[UIColor clearColor]];
        easterEggText.textColor = [UIColor grayColor];
        easterEggText.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
        [self addSubview:underLabel];
        [self addSubview:easterEggText];
        
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

- (void)loadView {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(tweetSP:)];
        //self.navigationItem.rightBarButtonItem.tintColor = kTintColor;
    [super loadView];
    [UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = kTintColor;

}

- (void)tweetSP:(id)sender {
    TWTweetComposeViewController *tweetController = [[TWTweetComposeViewController alloc] init];
    [tweetController setInitialText:kTweetText];
    [self.navigationController presentViewController:tweetController animated:YES completion:nil];
    [tweetController release];
}
- (void)followTwitter {
    //supports much many more twieeter accounts thi sywa 
    //holy shit i can't type today
    NSString *user = @"T_Dogg_94";
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetbot:///user_profile/" stringByAppendingString:user]]];
    
    else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitterrific:///profile?screen_name=" stringByAppendingString:user]]];
    
    else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetings:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetings:///user?screen_name=" stringByAppendingString:user]]];
    
    else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitter://user?screen_name=" stringByAppendingString:user]]];
    
    else
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"https://mobile.twitter.com/" stringByAppendingString:user]]];

    /*UIApplication *app = [UIApplication sharedApplication];
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
    }*/
}
- (void)followDingoTwitter {
   NSString *user = @"CPVideoMaker";
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetbot:///user_profile/" stringByAppendingString:user]]];
    
    else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitterrific:///profile?screen_name=" stringByAppendingString:user]]];
    
    else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetings:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetings:///user?screen_name=" stringByAppendingString:user]]];
    
    else if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitter://user?screen_name=" stringByAppendingString:user]]];
    
    else
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"https://mobile.twitter.com/" stringByAppendingString:user]]];
}

@end

// vim:ft=objc
