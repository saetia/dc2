//
//  RollLengthViewController.m
//  Conversions
//
//  Created by Joel Glovacki on 8/9/13.
//  Copyright (c) 2013 Dunmore. All rights reserved.
//

#import "RollLengthViewController.h"

@interface RollLengthViewController ()

@end

@implementation RollLengthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]){}
    return self;
}


- (void)viewDidLoad
{
    
    self.title = @"Roll Length";
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.90f alpha:1.00f];
    [super viewDidLoad];
    
    _fields = @[
        @{
            @"label":           @"Film Thickness",
            @"unit":            @"in",
            @"possibleUnits":   @[@"in", @"ft"],
        },
        @{
            @"label":           @"Roll Diameter",
            @"unit":            @"ft",
            @"possibleUnits":   @[@"in", @"ft"],
        },
        @{
            @"label":           @"Core Diameter",
            @"unit":            @"ft",
            @"possibleUnits":   @[@"in", @"ft"],
        },
        @{
            @"label":           @"Result",
            @"unit":            @"yd",
            @"possibleUnits":   @[@"yd", @"in", @"ft"],
        }
    ];
    
    _textFields = [[NSMutableArray alloc] init];
    
    _manager = [[RETableViewManager alloc] initWithTableView:self.tableView delegate:self];
    self.basicControlsSection = [self addBasicControls];
    self.buttonSection = [self addButton];
    
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:0.00f green:0.50f blue:0.73f alpha:1.00f]];
    
    [self.manager.style setBackgroundImage:[[UIImage imageNamed:@"SettingsFormTop"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]
                               forCellType:RETableViewCellTypeFirst];
    [self.manager.style setBackgroundImage:[[UIImage imageNamed:@"SettingsFormMiddle"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]
                               forCellType:RETableViewCellTypeMiddle];
    [self.manager.style setBackgroundImage:[[UIImage imageNamed:@"SettingsFormBottom"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]
                               forCellType:RETableViewCellTypeLast];
    [self.manager.style setBackgroundImage:[[UIImage imageNamed:@"SettingsFormSingle"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]
                               forCellType:RETableViewCellTypeSingle];
    
    [self.manager.style setSelectedBackgroundImage:[[UIImage imageNamed:@"SettingsFormTopTap"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]
                                       forCellType:RETableViewCellTypeFirst];
    [self.manager.style setSelectedBackgroundImage:[[UIImage imageNamed:@"SettingsFormMiddleTap"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]
                                       forCellType:RETableViewCellTypeMiddle];
    [self.manager.style setSelectedBackgroundImage:[[UIImage imageNamed:@"SettingsFormBottomTap"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]
                                       forCellType:RETableViewCellTypeLast];
    [self.manager.style setSelectedBackgroundImage:[[UIImage imageNamed:@"SettingsFormSingleTap"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]
                                       forCellType:RETableViewCellTypeSingle];
 
    if (REDeviceIsUIKit7()) {
        self.manager.style.contentViewMargin = 10.0;
        self.manager.style.backgroundImageMargin = 10.0;
    }

}




- (RETableViewSection *)addBasicControls {
    
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@"Roll Length"];
    
    [_manager addSection:section];
    
    for (NSDictionary *field in _fields){
        if ([field[@"label"] isEqualToString: @"Result"]) continue;
        RETableViewItem *item = [RETextItem itemWithTitle:field[@"label"] value:nil placeholder:@"0.00"];
        [section addItem: item];
    }
    
    return section;
    
}

- (RETableViewSection *)addButton
{

    RETableViewSection *section = [RETableViewSection section];
    
    [_manager addSection:section];
    
    RETableViewItem *item = [RETextItem itemWithTitle:@"Result" value:nil placeholder:@"0.00"];
    [section addItem: item];
    
    return section;
}

- (void)calculateResult:(UITextField *)sender {
    
    float total = 0;
    int required_fields = 3;
    int filled_out_fields = 0;
    
    NSMutableArray *values = [[NSMutableArray alloc] init];
    
    for (UITextField *field in _textFields){
        NSLog(@"is %f >= 0.0000000000001f?", field.text.floatValue);
        if (field.text.floatValue < 0.0000000000001f) continue;
        filled_out_fields++;
        NSLog(@"filled out field: %f",field.text.floatValue);
        [values addObject: [NSNumber numberWithFloat:field.text.floatValue]];
    }
    NSLog(@"is %d >= %d?", filled_out_fields, required_fields);
    
    if (filled_out_fields >= required_fields){
        
        double value1 = ((NSNumber *)values[0]).doubleValue;
        double value2 = ((NSNumber *)values[1]).doubleValue;
        double value3 = ((NSNumber *)values[2]).doubleValue;
        
        total = 0.06545 / value1 * (pow(value2,  2.0f) - pow(value3,  2.0f)) / 3.0f;
        
       //=SUM((((0.06545/B6)*((C6^2)-(D6^2))) / 3))
        //0.06545 / 0.0023 * (pow(18,2) - pow(3,2)) / 3;
        
        
        _resultField.text = [NSString stringWithFormat:@"%f", total];
    }
}



- (void)tableView:(UITableView *)tableView willDisplayCell:(RETableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    for (UIView *view in cell.contentView.subviews) {
        
        UILabel *currentView = ((UILabel *)view);
        
        if ([view isKindOfClass:[UILabel class]]){
            currentView.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16];
            currentView.textColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
        }
        
        if ([view isKindOfClass:[UITextField class]] || [view isKindOfClass:[UITextView class]]){
            
            currentView.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
            currentView.textColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
            
            if (![cell.textLabel.text isEqualToString:@"Result"]){
                _keyboardView = [[ZenKeyboard alloc] initWithFrame:CGRectMake(0, 0, 320, 216)];
                _keyboardView.textField = (UITextField *)view;
            
                
                [(UITextField *)view addTarget:self action:@selector(calculateResult:) forControlEvents:UIControlEventEditingChanged];
                
                [_textFields addObject: (UITextField *)view];
                
                
                if (!indexPath.section && !indexPath.row) currentView.tag = 8;
      
                
            } else {
                
                _resultField = (UITextField *)view;
                
                currentView.enabled = FALSE;
                //do something to copy the number to clipboard here.
            }
        
        
            
        }
    }


    int row = (indexPath.section == 0) ? indexPath.row : (_fields.count - 1);
    
    cell.badgeString        = _fields[row][@"unit"];
    cell.badgeColor         = [UIColor colorWithRed:0.00f green:0.64f blue:0.48f alpha:1.00f];
    cell.badgeTextColor     = [UIColor colorWithRed:1.00f green:1.00f blue:1.00f alpha:1.00f];
    cell.badge.fontSize     = 14;
    cell.badgeLeftOffset    = 0;
    cell.badgeRightOffset   = 10;

    [cell.badge addTarget:self action:@selector(triggerMenu:) forControlEvents:UIControlEventTouchUpInside];


    
}



+ (void)load {
    [PSMenuItem installMenuHandlerForObject:self];
}

+ (void)initialize {
    [PSMenuItem installMenuHandlerForObject:self];
}

- (void)triggerMenu:(UIButton *)sender
{
    [self becomeFirstResponder];
    
    __weak RETableViewTextCell *view_self = (RETableViewTextCell*)sender.superview.superview;
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:view_self];
    
    NSMutableArray *units = [[NSMutableArray alloc] init];
    
    int row = (!indexPath.section) ? indexPath.row : (_fields.count - 1);
    
    for (NSString *unit in _fields[row][@"possibleUnits"]){
        PSMenuItem *possibleUnit = [[PSMenuItem alloc] initWithTitle:unit block:^{
            view_self.badgeString = unit;
            [view_self.badge setNeedsDisplay];
            [[UIMenuController sharedMenuController] setMenuItems:nil];
        }];
        [units addObject:possibleUnit];
    }
    
    [[UIMenuController sharedMenuController] setTargetRect:sender.frame inView:sender];
    [[UIMenuController sharedMenuController] setMenuItems:units];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
    
}









-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
    //return (section == 0) ? 40 : 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section == 1){
       return [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    }
    
    UIView *customTitleView = [ [UIView alloc] initWithFrame:CGRectMake(15, 0, 300, 40)];
    UILabel *titleLabel = [ [UILabel alloc] initWithFrame:CGRectMake(15, 0, 300, 40)];
    
    titleLabel.text = @"";

    titleLabel.textColor = [UIColor colorWithRed:0.51f green:0.51f blue:0.50f alpha:0.8f];
    titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    titleLabel.shadowColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.8f];
    titleLabel.shadowOffset = CGSizeMake(0, 1.0f);
    
    titleLabel.backgroundColor = [UIColor clearColor];
    [customTitleView addSubview:titleLabel];
    return customTitleView;
    
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[self.view viewWithTag:8] becomeFirstResponder];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
