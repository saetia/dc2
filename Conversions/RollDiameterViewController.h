//
//  RollDiameterViewController.h
//  Conversions
//
//  Created by Joel Glovacki on 8/27/13.
//  Copyright (c) 2013 Dunmore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDBadgedCell.h"
#import "RETableViewManager.h"
#import "PSMenuItem.h"
#import "ZenKeyboard.h"
#import "UnitConvert.h"
#import "RETableViewOptionsController.h"
#import "GAI.h"
#import "GAIFields.h"
#import "GAIDictionaryBuilder.h"

@interface RollDiameterViewController : UITableViewController <RETableViewManagerDelegate>

@property (strong, readwrite, nonatomic) NSArray *fields;
@property (strong, readwrite, nonatomic) NSMutableArray *textFields;
@property (strong, readwrite, nonatomic) UITextField *resultField;
@property (nonatomic, strong) ZenKeyboard *keyboardView;

@property (strong, readonly, nonatomic) RETableViewManager *manager;
@property (strong, readwrite, nonatomic) RETableViewSection *basicControlsSection;
@property (strong, readwrite, nonatomic) RETableViewSection *buttonSection;

@end
