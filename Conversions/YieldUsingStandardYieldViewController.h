//
//  YieldUsingStandardYieldViewController.h
//  Conversions
//
//  Created by Joel Glovacki on 8/27/13.
//  Copyright (c) 2013 Dunmore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDBadgedCell.h"
#import "RETableViewManager.h"
#import "RETableViewOptionsController.h"
#import "PSMenuItem.h"
#import "ZenKeyboard.h"
#import "UnitConvert.h"

#import <QuartzCore/QuartzCore.h>



@interface YieldUsingStandardYieldViewController : UITableViewController <RETableViewManagerDelegate>

@property (strong, readwrite, nonatomic) NSArray *fields;
@property (strong, readwrite, nonatomic) NSMutableArray *textFields;
@property (strong, readwrite, nonatomic) UITextField *resultField;
@property (nonatomic, strong) ZenKeyboard *keyboardView;

@property (strong, readonly, nonatomic) RETableViewManager *manager;
@property (strong, readwrite, nonatomic) RETableViewSection *basicControlsSection;
@property (strong, readwrite, nonatomic) RETableViewSection *buttonSection;

@property (strong, nonatomic) NSArray *petObjects;


@end
