//
//  DistanceViewController.m
//  Conversions
//
//  Created by Joel Glovacki on 8/28/13.
//  Copyright (c) 2013 Dunmore. All rights reserved.
//

#import "DistanceViewController.h"

@interface DistanceViewController ()

@end

@implementation DistanceViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]){}
    return self;
}

- (void)viewDidLoad
{
    
    self.title = @"Distance Conversions";
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.90f alpha:1.00f];
    [super viewDidLoad];
    
    
    _fields = @[
                @{
                    @"label":           @"Millimeters",
                    @"base":            @1,
                    @"unit":            @1,
                    },
                @{
                    @"label":           @"Centimeters",
                    @"base":            @10,
                    @"unit":            @0.1,
                    },
                @{
                    @"label":           @"Meters",
                    @"base":            @1000,
                    @"unit":            @0.001,
                    },
                @{
                    @"label":           @"Kilometers",
                    @"base":            @1000000,
                    @"unit":            @0.000001,
                    },
                @{
                    @"label":           @"Inches",
                    @"base":            @25.4,
                    @"unit":            @0.0393701,
                    },
                @{
                    @"label":           @"Feet",
                    @"base":            @304.8,
                    @"unit":            @0.00328084,
                    },
                @{
                    @"label":           @"Yard",
                    @"base":            @914.4,
                    @"unit":            @0.00109361,
                    },
                @{
                    @"label":           @"Mile",
                    @"base":            @1609344,
                    @"unit":            @0.000000621,
                    },
                ];

    
    _textFields = [[NSMutableArray alloc] init];
    
    _manager = [[RETableViewManager alloc] initWithTableView:self.tableView delegate:self];
    
    
    self.basicControlsSection = [self addBasicControls];
    
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
    
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@""];
    
    [_manager addSection:section];
    
    for (NSDictionary *field in _fields){
        RETableViewItem *item = [RETextItem itemWithTitle:field[@"label"] value:nil placeholder:@"0.00"];
        [section addItem: item];
    }
    
    return section;
    
}




- (void)calculateResult:(UITextField *)sender {
    
    int tag = sender.tag;
    
    NSString *originalType = _fields[tag][@"label"];
    NSNumber *baseConverter = _fields[tag][@"base"];
    
    double numberAsBase = sender.text.doubleValue * baseConverter.doubleValue;

    NSLog(@"Converting: %@ %@", sender.text, originalType);
    
    int i = 0;
    
    NSLog(@"number of fields: %i", _fields.count);
    NSLog(@"number of texfields: %i", _textFields.count);
    
    for (UITextField *field in _textFields){
        
        if (field.tag == tag) {
            i++;
            continue;
        }
        
        NSNumber *fieldUnit = _fields[i][@"unit"];
        NSString *o = _fields[i][@"label"];
        
        NSLog(@"%i) %@ %@ * %f = %0.4f", i, o, fieldUnit, numberAsBase, numberAsBase * fieldUnit.doubleValue);
        
        field.text = [NSString stringWithFormat:@"%0.4f", numberAsBase * fieldUnit.doubleValue];
        
        i++;
        
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
            
            
            _keyboardView = [[ZenKeyboard alloc] initWithFrame:CGRectMake(0, 0, 320, 216)];
            _keyboardView.textField = (UITextField *)view;
            
            
            [(UITextField *)view addTarget:self action:@selector(calculateResult:) forControlEvents:UIControlEventEditingChanged];

            
            currentView.tag = indexPath.row;
            
                        
            [_textFields addObject: (UITextField *)view];
            
            
        }
    }
    
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
    [[self.view viewWithTag:0] becomeFirstResponder];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

