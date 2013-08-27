//
//  CalculationViewController.h
//  Conversions
//
//  Created by Joel Glovacki on 7/25/13.
//  Copyright (c) 2013 Dunmore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CenterViewController.h"
#import "BSKeyboardControls.h"

@interface CalculationViewController : CenterViewController <UITextFieldDelegate, UITextViewDelegate, BSKeyboardControlsDelegate>
@property (weak, nonatomic) IBOutlet UILabel *inputLabel1;
@property (weak, nonatomic) IBOutlet UILabel *inputLabel2;
@property (weak, nonatomic) IBOutlet UILabel *inputLabel3;
@property (weak, nonatomic) IBOutlet UITextField *input1;
@property (weak, nonatomic) IBOutlet UITextField *input2;
@property (weak, nonatomic) IBOutlet UITextField *input3;

@property (strong, nonatomic) NSString *inputLabel1Value;
@property (strong, nonatomic) NSString *inputLabel2Value;
@property (strong, nonatomic) NSString *inputLabel3Value;

@property (strong, nonatomic) NSArray *entryFields;
@property (weak, nonatomic) IBOutlet UILabel *calculationTitle;
@property (weak, nonatomic) IBOutlet UILabel *calculationSubTitle;

@end
