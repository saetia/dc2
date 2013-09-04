//
//  MetallizedFilmResistanceViewController.m
//  Conversions
//
//  Created by Joel Glovacki on 8/27/13.
//  Copyright (c) 2013 Dunmore. All rights reserved.
//

#import "MetallizedFilmResistanceViewController.h"

@interface MetallizedFilmResistanceViewController ()




@end

@implementation MetallizedFilmResistanceViewController

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
    
    self.title = @"Metallized Film Resistance";
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.90f alpha:1.00f];
    [super viewDidLoad];

    
    
    //NSArray *opticalConversion = [[NSArray alloc] init];
    
    _opticalConversions = @[
     @{@"angstrom": @0.0, @"optical density": @0.0, @"transmission": @100.0, @"resistance": @0.0},
     @{@"angstrom": @0.0, @"optical density": @0.1, @"transmission": @79.43, @"resistance": @0.0},
     @{@"angstrom": @0.0, @"optical density": @0.2, @"transmission": @63.1, @"resistance": @0.0},
     @{@"angstrom": @0.0, @"optical density": @0.3, @"transmission": @50.12, @"resistance": @0.0},
     @{@"angstrom": @0.0, @"optical density": @0.4, @"transmission": @39.81, @"resistance": @0.0},
     @{@"angstrom": @0.0, @"optical density": @0.5, @"transmission": @31.62, @"resistance": @0.0},
     @{@"angstrom": @0.0, @"optical density": @0.6, @"transmission": @25.12, @"resistance": @0.0},
     @{@"angstrom": @0.0, @"optical density": @0.7, @"transmission": @19.95, @"resistance": @0.0},
     @{@"angstrom": @0.0, @"optical density": @0.8, @"transmission": @15.85, @"resistance": @0.0},
     @{@"angstrom": @0.0, @"optical density": @0.9, @"transmission": @12.59, @"resistance": @0.0},
     @{@"angstrom": @30.5, @"optical density": @1.0, @"transmission": @10.0, @"resistance": @6.7},
     @{@"angstrom": @50.8, @"optical density": @1.1, @"transmission": @7.943, @"resistance": @5.35},
     @{@"angstrom": @63.5, @"optical density": @1.2, @"transmission": @6.31, @"resistance": @4.55},
     @{@"angstrom": @71.12, @"optical density": @1.3, @"transmission": @5.012, @"resistance": @3.98},
     @{@"angstrom": @81.28, @"optical density": @1.4, @"transmission": @3.981, @"resistance": @3.5},
     @{@"angstrom": @84.0, @"optical density": @1.5, @"transmission": @3.162, @"resistance": @3.32},
     @{@"angstrom": @96.5, @"optical density": @1.6, @"transmission": @2.512, @"resistance": @3.06},
     @{@"angstrom": @101.6, @"optical density": @1.7, @"transmission": @1.995, @"resistance": @2.86},
     @{@"angstrom": @106.7, @"optical density": @1.8, @"transmission": @1.585, @"resistance": @2.68},
     @{@"angstrom": @114.3, @"optical density": @1.9, @"transmission": @1.259, @"resistance": @2.5},
     @{@"angstrom": @121.9, @"optical density": @2.0, @"transmission": @1.0, @"resistance": @2.35},
     @{@"angstrom": @127.0, @"optical density": @2.1, @"transmission": @0.7943, @"resistance": @2.2},
     @{@"angstrom": @134.6, @"optical density": @2.2, @"transmission": @0.631, @"resistance": @2.05},
     @{@"angstrom": @142.3, @"optical density": @2.3, @"transmission": @0.5012, @"resistance": @1.93},
     @{@"angstrom": @154.9, @"optical density": @2.4, @"transmission": @0.3981, @"resistance": @1.8},
     @{@"angstrom": @172.7, @"optical density": @2.5, @"transmission": @0.3162, @"resistance": @1.66},
     @{@"angstrom": @188.0, @"optical density": @2.6, @"transmission": @0.2512, @"resistance": @1.55},
     @{@"angstrom": @203.0, @"optical density": @2.7, @"transmission": @0.1995, @"resistance": @1.42},
     @{@"angstrom": @218.0, @"optical density": @2.8, @"transmission": @0.1585, @"resistance": @1.31},
     @{@"angstrom": @236.0, @"optical density": @2.9, @"transmission": @0.1259, @"resistance": @1.23},
     @{@"angstrom": @254.0, @"optical density": @3.0, @"transmission": @0.1, @"resistance": @1.18},
     @{@"angstrom": @290.0, @"optical density": @3.1, @"transmission": @0.0794, @"resistance": @1.12},
     @{@"angstrom": @292.0, @"optical density": @3.2, @"transmission": @0.0631, @"resistance": @0.98},
     @{@"angstrom": @317.0, @"optical density": @3.3, @"transmission": @0.0501, @"resistance": @0.9},
     @{@"angstrom": @343.0, @"optical density": @3.4, @"transmission": @0.0398, @"resistance": @0.83},
     @{@"angstrom": @363.0, @"optical density": @3.5, @"transmission": @0.0316, @"resistance": @0.78},
     @{@"angstrom": @394.0, @"optical density": @3.6, @"transmission": @0.0251, @"resistance": @0.72},
     @{@"angstrom": @427.0, @"optical density": @3.7, @"transmission": @0.0199, @"resistance": @0.66},
     @{@"angstrom": @457.0, @"optical density": @3.8, @"transmission": @0.0153, @"resistance": @0.62},
     @{@"angstrom": @500.0, @"optical density": @3.9, @"transmission": @0.0126, @"resistance": @0.58},
     @{@"angstrom": @508.0, @"optical density": @4.0, @"transmission": @0.01, @"resistance": @0.53},
     
     ];
    
    
    
    
    
    
    _fields = @[
                @{
                    @"label":           @"Angstroms",
                    @"unit":            @"",
                    @"possibleUnits":   @[],
                    },
                @{
                    @"label":           @"% transmission",
                    @"unit":            @"",
                    @"possibleUnits":   @[],
                    },
                @{
                    @"label":           @"Resistance Ω/sq",
                    @"unit":            @"",
                    @"possibleUnits":   @[],
                    },
                ];
    
    _textFields = [[NSMutableArray alloc] init];
    
    _manager = [[RETableViewManager alloc] initWithTableView:self.tableView delegate:self];
    
    self.opticalSection = [self addOpticalSection];
    
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


- (RETableViewSection *)addOpticalSection
{
    
    RETableViewSection *section = [RETableViewSection section];
    
    [_manager addSection:section];
    
    RETableViewItem *item = [RETextItem itemWithTitle:@"Optical Density" value:nil placeholder:@"0.00"];
    [section addItem: item];
    
    return section;
}



- (RETableViewSection *)addBasicControls {
    
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@"Roll Length"];
    
    [_manager addSection:section];
    
    for (NSDictionary *field in _fields){
        RETableViewItem *item = [RETextItem itemWithTitle:field[@"label"] value:nil placeholder:@"0.00"];
        [section addItem: item];
    }
    
    return section;
    
}




- (void)calculateResult:(UITextField *)sender {
    
    double opticalDensity = _resultField.text.doubleValue;
    
    NSMutableArray *dens = [[NSMutableArray alloc] init];
    
    int i = 0;
    
    for (NSDictionary *opticalConversion in _opticalConversions){
        NSNumber *od = opticalConversion[@"optical density"];
        if (od.doubleValue == opticalDensity){
            dens[0] = opticalConversion[@"angstrom"];
            dens[1] = opticalConversion[@"transmission"];
            dens[2] = opticalConversion[@"resistance"];
        }
        i++;
    }
    
    if (!dens.count) return;
    
    i = 0;
    
    for (UITextField *field in _textFields){
        NSNumber *number = dens[i];
        
        if ([number isEqualToNumber:@0]){
            field.text = @"";
        } else {
            field.text = [NSNumberFormatter localizedStringFromNumber:number numberStyle: NSNumberFormatterDecimalStyle];
        }
        
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
            
            if ([cell.textLabel.text isEqualToString:@"Optical Density"]){
                _keyboardView = [[ZenKeyboard alloc] initWithFrame:CGRectMake(0, 0, 320, 216)];
                _keyboardView.textField = (UITextField *)view;
                
                
                [(UITextField *)view addTarget:self action:@selector(calculateResult:) forControlEvents:UIControlEventEditingChanged];
                
                
                if (!indexPath.section && !indexPath.row) currentView.tag = 8;
                
                _resultField = (UITextField *)view;
                
            } else {
                
                currentView.enabled = FALSE;
                
                [_textFields addObject: (UITextField *)view];
                
                //do something to copy the number to clipboard here.
            }
            
            
            
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
    [[self.view viewWithTag:8] becomeFirstResponder];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
