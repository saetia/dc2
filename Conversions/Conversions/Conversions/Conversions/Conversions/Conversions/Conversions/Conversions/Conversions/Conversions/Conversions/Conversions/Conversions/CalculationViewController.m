//
//  CalculationViewController.m
//  Conversions
//
//  Created by Joel Glovacki on 7/25/13.
//  Copyright (c) 2013 Dunmore. All rights reserved.
//

#import "PSMenuItem.h"
#import "CalculationViewController.h"
#import "UnitsButton.h"
#import "UnitMenuItem.h"
#import "CenterViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"
#import <QuartzCore/QuartzCore.h>

@interface CalculationViewController ()

@end

@implementation CalculationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}








- (NSNumber *)convert:(NSNumber *)number from:(NSString *)from to:(NSString *)to
{
    
    return @5;
    
}





- (void)changeButton:(UIButton *)sender toUnit:(NSString *)unit {
    
    [sender setTitle:unit forState:UIControlStateNormal];

}


// add support for PSMenuItem. Needs to be called once per class.
+ (void)load {
    [PSMenuItem installMenuHandlerForObject:self];
}

+ (void)initialize {
    [PSMenuItem installMenuHandlerForObject:self];
}

- (void)triggerMenu:(UIButton *)sender
{
    [self becomeFirstResponder];
    
    __weak CalculationViewController *view_self = self;
    
    PSMenuItem *inch = [[PSMenuItem alloc] initWithTitle:@"in" block:^{
        [view_self changeButton: sender toUnit: @"in"];
        [[UIMenuController sharedMenuController] setMenuItems:nil];
    }];
    
    PSMenuItem *mil = [[PSMenuItem alloc] initWithTitle:@"mil" block:^{
        [view_self changeButton: sender toUnit: @"mil"];
        [[UIMenuController sharedMenuController] setMenuItems:nil];
    }];
    
    PSMenuItem *micron = [[PSMenuItem alloc] initWithTitle:@"mic" block:^{
        [view_self changeButton: sender toUnit: @"mic"];
        [[UIMenuController sharedMenuController] setMenuItems:nil];
    }];
    
    PSMenuItem *gauge = [[PSMenuItem alloc] initWithTitle:@"ga" block:^{
        [view_self changeButton: sender toUnit: @"ga"];
        [[UIMenuController sharedMenuController] setMenuItems:nil];
    }];
    
    
    [[UIMenuController sharedMenuController] setTargetRect:sender.frame inView:self.view];
    
    [[UIMenuController sharedMenuController] setMenuItems:@[inch, mil, micron, gauge]];

    [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
    

}

- (BOOL)canBecomeFirstResponder {
	return YES;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.inputLabel1.text = self.inputLabel1Value;
    self.inputLabel2.text = self.inputLabel2Value;
    self.inputLabel3.text = self.inputLabel3Value;
    
    NSLog(@"%@",self.entryFields);
    
    self.title = self.entryFields[0];
    
    int PADDING = 10;
    
    
	for (int i=0; i<[self.entryFields count]; i++){

            
        UILabel *yourLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 60 * i + 10 + PADDING, 280, 20)];
        yourLabel.text = self.entryFields[i];
        [yourLabel setTextColor:[UIColor blackColor]];
        [yourLabel setBackgroundColor:[UIColor clearColor]];
        [self.view addSubview:yourLabel];
        
        

        UITextField *yourTextfield = [[UITextField alloc] initWithFrame:CGRectMake(20, 60 * i + 35 + PADDING, 230, 30)];
        yourTextfield.borderStyle = UITextBorderStyleRoundedRect;
        yourTextfield.keyboardType = UIKeyboardTypeDecimalPad;
        [self.view addSubview:yourTextfield];
        

        
        
        UnitsButton *yourUnitsButton = [UnitsButton buttonWithType:UIButtonTypeRoundedRect];
        yourUnitsButton.frame = CGRectMake(260, 60 * i + 35 + PADDING, 40, 30);
        [yourUnitsButton setTitle:@"in" forState:UIControlStateNormal];
        [yourUnitsButton addTarget:self action:@selector(triggerMenu:) forControlEvents:UIControlEventTouchUpInside];
       
        [self.view addSubview:yourUnitsButton];
        


        
        
//        UIButton *yourUnitsButton = [[UIButton alloc] initWithFrame:CGRectMake(240, 80 * i + 30, 40, 40)];
//        
//        [self.view addSubview:yourUnitsButton];
        
        /*
         
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        UIMenuItem *item = [[UIMenuItem alloc] initWithTitle: @"Do Something"
                                                      action: @selector(doSomething:)];
        [menuController setMenuItems: [NSArray arrayWithObject: item]];
        
         */
        
	}
    
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
