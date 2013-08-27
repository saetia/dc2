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
#import "BSKeyboardControls.h"

@interface CalculationViewController ()

@property (nonatomic, strong) BSKeyboardControls *keyboardControls;

@end

@implementation CalculationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
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
    
    
    
  
    NSMutableArray *fields = [[NSMutableArray alloc] init];

    
    
	for (int i = 0; i < [self.entryFields count]; i++){

            
        UILabel *yourLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 60 * i + 10 + PADDING, 280, 20)];
        yourLabel.text = self.entryFields[i];
        [yourLabel setTextColor:[UIColor blackColor]];
        [yourLabel setBackgroundColor:[UIColor clearColor]];
        [self.view addSubview:yourLabel];
        
        

        UITextField *yourTextfield = [[UITextField alloc] initWithFrame:CGRectMake(20, 60 * i + 35 + PADDING, 230, 30)];
        
        yourTextfield.borderStyle = UITextBorderStyleRoundedRect;
        yourTextfield.keyboardType = UIKeyboardTypeDecimalPad;
        yourTextfield.keyboardAppearance = UIKeyboardAppearanceAlert;
        
        
        
        
        yourTextfield.delegate = self;
        
        [self.view addSubview:yourTextfield];
        
        [fields addObject:yourTextfield];

        
        
        UnitsButton *yourUnitsButton = [UnitsButton buttonWithType:UIButtonTypeRoundedRect];
        yourUnitsButton.frame = CGRectMake(260, 60 * i + 35 + PADDING, 40, 30);
        [yourUnitsButton setTitle:@"in" forState:UIControlStateNormal];
        [yourUnitsButton addTarget:self action:@selector(triggerMenu:) forControlEvents:UIControlEventTouchUpInside];
       
        [self.view addSubview:yourUnitsButton];
        


        
        
        //  UIButton *yourUnitsButton = [[UIButton alloc] initWithFrame:CGRectMake(240, 80 * i + 30, 40, 40)];
        //        
        // [self.view addSubview:yourUnitsButton];

        /*

        UIMenuController *menuController = [UIMenuController sharedMenuController];
        UIMenuItem *item = [[UIMenuItem alloc] initWithTitle: @"Do Something"
                                                  action: @selector(doSomething:)];
        [menuController setMenuItems: [NSArray arrayWithObject: item]];

        */
        
	}
    
    NSArray *fieldsArray = [NSArray arrayWithArray:fields];
    
    [self setKeyboardControls:[[BSKeyboardControls alloc] initWithFields:fieldsArray]];
    
    [self.keyboardControls setDelegate:self];
    
    self.keyboardControls.barTintColor = [UIColor colorWithRed:0.87f green:0.25f blue:0.17f alpha:1.00f];
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.keyboardControls setActiveField:textField];
}

#pragma mark -
#pragma mark Text View Delegate

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [self.keyboardControls setActiveField:textView];
}


- (void)keyboardControls:(BSKeyboardControls *)keyboardControls selectedField:(UIView *)field inDirection:(BSKeyboardControlsDirection)direction
{
    //UIView *view = keyboardControls.activeField.superview.superview;
    //[self.tableView scrollRectToVisible:view.frame animated:YES];
}

- (void)keyboardControlsDonePressed:(BSKeyboardControls *)keyboardControls
{
    [keyboardControls.activeField resignFirstResponder];
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
