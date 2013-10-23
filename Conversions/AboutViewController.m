//
//  AboutViewController.m
//  Conversions
//
//  Created by Joel Glovacki on 10/4/13.
//  Copyright (c) 2013 Dunmore. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected)];
    singleTap.numberOfTapsRequired = 1;
    _dunmoreLogo.userInteractionEnabled = YES;
    [_dunmoreLogo addGestureRecognizer:singleTap];
    
    
    id tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"About"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)tapDetected{
    
    NSURL *url = [NSURL URLWithString:@"http://www.dunmore.com/roll-to-roll/"];
    [[UIApplication sharedApplication] openURL:url];
    
}





@end
