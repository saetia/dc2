//
//  CoreDiameterPickerViewController.m
//  Conversions
//
//  Created by Joel Glovacki on 3/4/14.
//  Copyright (c) 2014 Dunmore. All rights reserved.
//

#import "CoreDiameterPickerViewController.h"

@interface CoreDiameterPickerViewController ()

@property (strong, readwrite, nonatomic) RETextItem *customDiameter;
@property (strong, readwrite, nonatomic) RETableViewItem *threeInches;
@property (strong, readwrite, nonatomic) RETableViewItem *sixInches;


@end

@implementation CoreDiameterPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {}
    return self;
}




- (id)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]){}
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    
    UIButton *backButton;
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 35, 21)];
    } else {
        backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 21)];
    }
    
    backButton.imageView.contentMode = UIViewContentModeCenter;
    
    [backButton setImage:[UIImage imageNamed:@"BackButton"] forState:UIControlStateNormal];
    
    UIBarButtonItem *barBackButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    [backButton addTarget:self action:@selector(popCurrentViewController) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = barBackButtonItem;
    self.navigationItem.hidesBackButton = YES;
}

- (void)popCurrentViewController {
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)keyboardWillShow:(NSNotification *)aNotification
{
    
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.tableView.contentInset = contentInsets;
    self.tableView.scrollIndicatorInsets = contentInsets;
    
    //    [self.tableView scrollToRowAtIndexPath:self.currentField.indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}
- (void)keyboardWillHide:(NSNotification *)aNotification
{
    [UIView animateWithDuration:0.3 animations:^(void)
     {
         self.tableView.contentInset = UIEdgeInsetsZero;
         self.tableView.scrollIndicatorInsets = UIEdgeInsetsZero;
     }];
}



    

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    // Register notification when the keyboard will be show
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    // Register notification when the keyboard will be hide
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    self.title = @"Core Diameter";
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.90f alpha:1.00f];

    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(popCurrentViewController)];
    
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        
        doneButton.tintColor = [UIColor colorWithRed:0 green:0.34 blue:0.49 alpha:1];
        
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        [attributes setValue:[UIColor colorWithRed:0.25 green:0.63 blue:0.8 alpha:1] forKey:UITextAttributeTextShadowColor];
        [attributes setValue:[UIFont boldSystemFontOfSize:19] forKey:UITextAttributeFont];
        [attributes setValue:[NSValue valueWithUIOffset:UIOffsetMake(0.0, 1.0)] forKey:UITextAttributeTextShadowOffset];
        [[UIBarButtonItem appearance] setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    }
    
    
    [self.navigationItem setRightBarButtonItem:doneButton];
    
    
    
    
    _fields = @[
                @{
                    @"label":           @"3 inches",
                    @"unit":            @"",
                    @"possibleUnits":   @[],
                    },
                @{
                    @"label":           @"6 inches",
                    @"unit":            @"",
                    @"possibleUnits":   @[],
                    },
                
                @{
                    @"label":           @"Core Diameter",
                    @"unit":            @"in",
                    @"possibleUnits":   @[@"mil", @"mic", @"ga", @"in"],
                    }
                ];
    
    
    _textFields = [[NSMutableArray alloc] init];
    _manager = [[RETableViewManager alloc] initWithTableView:self.tableView delegate:self];
    
    self.basicControlsSection = [self addBasicControls];
    self.customDiameterSection = [self addCustomDiameterSection];
    
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:0.00f green:0.50f blue:0.73f alpha:1.00f]];
    
    if (!REDeviceIsUIKit7()) {
        
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
        
    }
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UIMenuControllerDidHide:) name:UIMenuControllerDidHideMenuNotification object:nil];
    
    
    
    id tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:self.title];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
    
    
}

-(void)UIMenuControllerDidHide:(id)sender {
    [[UIMenuController sharedMenuController] setMenuItems:nil];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (RETableViewSection *)addCustomDiameterSection {
    
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@"Custom"];
    
    [_manager addSection:section];
    
    //customDiameter
    
    NSString *value = ([[NSUserDefaults standardUserDefaults] boolForKey:@"coreCustom"]) ? [[NSUserDefaults standardUserDefaults] objectForKey:@"coreValue"] : nil;
    
    self.customDiameter = [RETextItem itemWithTitle:@"Core Diameter" value:value placeholder:@"0.00"];
    
    [section addItem: self.customDiameter];
    
    return section;
    
}


- (RETableViewSection *)addBasicControls {
    
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@"Defaults"];
    
    [_manager addSection:section];
    
    __typeof (&*self) __weak weakSelf = self;
    
    NSString *core = [[NSUserDefaults standardUserDefaults] objectForKey:@"coreTitle"];
    
    //NSLog(@"defaults = %@",core);
    
    int accessory = ([core isEqualToString:@"3 inches"]) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;

    
    self.threeInches = [RETableViewItem itemWithTitle:@"3 inches" accessoryType:accessory selectionHandler:^(RETableViewItem *item) {
        [item deselectRowAnimated:YES];
        
        item.accessoryType = UITableViewCellAccessoryCheckmark;
        weakSelf.sixInches.accessoryType = UITableViewCellAccessoryNone;
        
        [item reloadRowWithAnimation:UITableViewRowAnimationNone];
        [weakSelf.sixInches reloadRowWithAnimation:UITableViewRowAnimationNone];
        
        [[NSUserDefaults standardUserDefaults] setObject:@"3 inches" forKey:@"coreTitle"];
        [[NSUserDefaults standardUserDefaults] setObject:@"3.75" forKey:@"coreValue"];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"coreCustom"];
        [[NSUserDefaults standardUserDefaults] setObject:@"in" forKey:@"coreUnit"];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [weakSelf.navigationController popViewControllerAnimated:YES];
        
    }];

    
    accessory = ([core isEqualToString:@"6 inches"]) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    self.sixInches = [RETableViewItem itemWithTitle:@"6 inches" accessoryType:accessory selectionHandler:^(RETableViewItem *item) {
        [item deselectRowAnimated:YES];
        
        item.accessoryType = UITableViewCellAccessoryCheckmark;
        weakSelf.threeInches.accessoryType = UITableViewCellAccessoryNone;
        
        [item reloadRowWithAnimation:UITableViewRowAnimationNone];
        [weakSelf.threeInches reloadRowWithAnimation:UITableViewRowAnimationNone];
        
        [[NSUserDefaults standardUserDefaults] setObject:@"6 inches" forKey:@"coreTitle"];
        [[NSUserDefaults standardUserDefaults] setObject:@"7" forKey:@"coreValue"];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"coreCustom"];
        [[NSUserDefaults standardUserDefaults] setObject:@"in" forKey:@"coreUnit"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [weakSelf.navigationController popViewControllerAnimated:YES];
        
    }];
    
    [section addItem:self.threeInches];
    [section addItem:self.sixInches];

    return section;
    
}



- (void)calculateResult:(id)sender {
    

    int filled_out_fields = 0;
    
    NSMutableArray *values = [[NSMutableArray alloc] init];

    
    //if ([core_item.value isEqualToString:@"3 inches"]) core_diameter = 3.75f;
    //if ([core_item.value isEqualToString:@"6 inches"]) core_diameter = 7.00f;

    for (UITextField *field in _textFields){
        if (field.text.doubleValue < 0.0000000000001f) continue;
        filled_out_fields++;
        [values addObject: [NSNumber numberWithDouble: field.text.doubleValue]];
    }
    
    NSMutableArray *units = [[NSMutableArray alloc] init];
    for (UITextField *field in _textFields){
        
        
        //RETableViewCell *badge;
        

        NSIndexPath *indexPathAtPoint = [self.tableView indexPathForRowAtPoint:[self.tableView convertPoint:field.center fromView:field.superview]];
        
        RETableViewCell *badge = (RETableViewTextCell *)[self.tableView cellForRowAtIndexPath:indexPathAtPoint];
        
        /*
        if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
            badge = (RETableViewCell *)field.superview.superview;
        } else {
            badge = (RETableViewCell *)field.superview.superview.superview;
        }
        */
        
        [units addObject:badge.badge.badgeString];
    }
    

    
    //RETableViewTextCell *textcell;
    

    NSIndexPath *indexPathAtPoint = [self.tableView indexPathForRowAtPoint:[self.tableView convertPoint:_resultField.center fromView:_resultField.superview]];
    
    RETableViewTextCell *textcell = (RETableViewTextCell *)[self.tableView cellForRowAtIndexPath:indexPathAtPoint];
    
    /*
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        textcell = (RETableViewTextCell *)_resultField.superview.superview;
    } else {
        textcell = (RETableViewTextCell *)_resultField.superview.superview.superview;
    }
    */
    

    if (self.customDiameter.value){
        
        self.threeInches.accessoryType = UITableViewCellAccessoryNone;
        self.sixInches.accessoryType = UITableViewCellAccessoryNone;
        
        [self.threeInches reloadRowWithAnimation:UITableViewRowAnimationNone];
        [self.sixInches reloadRowWithAnimation:UITableViewRowAnimationNone];
        
        
        //NSNumber *final_total = [UnitConvert convert:[NSNumber numberWithDouble: total] from: [_fields lastObject][@"unit"] to: textcell.badge.badgeString];
        
        [[NSUserDefaults standardUserDefaults] setObject:self.customDiameter.value forKey:@"coreValue"];
        
        NSString *string = [NSString stringWithFormat:@"%@ %@", self.customDiameter.value, textcell.badge.badgeString];
        
        //NSLog(@"%@",string);
        
        [[NSUserDefaults standardUserDefaults] setObject:string forKey:@"coreTitle"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"coreCustom"];
        [[NSUserDefaults standardUserDefaults] setObject:textcell.badge.badgeString forKey:@"coreUnit"];
        
        //revert to 3 inches
    } else {
        
        self.threeInches.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.threeInches reloadRowWithAnimation:UITableViewRowAnimationNone];
        [[NSUserDefaults standardUserDefaults] setObject:@"3 inches" forKey:@"coreTitle"];
        [[NSUserDefaults standardUserDefaults] setObject:@"3.75" forKey:@"coreValue"];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"coreCustom"];
        [[NSUserDefaults standardUserDefaults] setObject:@"in" forKey:@"coreUnit"];
        
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:@"reloadData" object:self userInfo: nil];
    
    //NSLog(@"custom value is: %f",total);

}



- (void)tableView:(UITableView *)tableView willDisplayCell:(RETableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    for (UIView *view in cell.contentView.subviews) {
        
        UILabel *currentView = ((UILabel *)view);
        
        if ([view isKindOfClass:[UILabel class]]){
            currentView.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
            currentView.textColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
        }
        
        if ([view isKindOfClass:[UITextField class]] || [view isKindOfClass:[UITextView class]]){
            
            currentView.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
            currentView.textColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
            
            if ([cell.textLabel.text isEqualToString:@"Core Diameter"]){
             
                _keyboardView = [[ZenKeyboard alloc] initWithFrame:CGRectMake(0, 0, 320, 216)];
                _keyboardView.textField = (UITextField *)view;
                
                [(UITextField *)view addTarget:self action:@selector(calculateResult:) forControlEvents:UIControlEventEditingChanged];
                
                _textFields[indexPath.row] = (UITextField *)view;
                
                _resultField = (UITextField *)view;
                
                currentView.tag = 8;
        
            }
        }
    }
    
    if (indexPath.section == 0) return;
    
    if ([cell.textLabel.text rangeOfString:@"inches"].location != NSNotFound) {
        return;
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *unit = [defaults objectForKey:[self.title stringByAppendingString: cell.textLabel.text]];
    if (unit == nil) unit = _fields[2][@"unit"];
    
    cell.badgeString        = unit;
    cell.badgeColor         = [UnitConvert colorize: unit];
    cell.badgeTextColor     = [UIColor colorWithRed:1.00f green:1.00f blue:1.00f alpha:1.00f];
    cell.badge.fontSize     = 16;
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

- (void)triggerMenu:(UIButton *)sender {
    [self becomeFirstResponder];
    
    __weak RETableViewTextCell *view_self;
    
    NSIndexPath *indexPathAtPoint = [self.tableView indexPathForRowAtPoint:[self.tableView convertPoint:sender.center fromView:sender.superview]];
    
    view_self = (RETableViewTextCell *)[self.tableView cellForRowAtIndexPath:indexPathAtPoint];
    
    /*
     if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
     view_self = (RETableViewTextCell *)sender.superview.superview;
     } else {
     view_self = (RETableViewTextCell *)sender.superview.superview.superview;
     }
     */

    NSMutableArray *units = [[NSMutableArray alloc] init];
    
    for (NSString *unit in _fields[2][@"possibleUnits"]){
        PSMenuItem *possibleUnit = [[PSMenuItem alloc] initWithTitle:unit block:^{
            
            view_self.badgeString = unit;
            view_self.badgeColor = [UnitConvert colorize: unit];
            
            view_self.badge.badgeString = unit;
            view_self.badge.badgeColor = [UnitConvert colorize: unit];
            
            [view_self.badge setNeedsDisplay];
            [view_self setNeedsDisplay];
            
            [view_self.textField becomeFirstResponder];
            
            [self calculateResult: view_self.textField];
            
            [[UIMenuController sharedMenuController] setMenuItems:nil];
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:unit forKey:[self.title stringByAppendingString: view_self.textLabel.text]];
            [defaults synchronize];
            
        }];
        
        [units addObject:possibleUnit];
        
    }

    [sender.superview.superview setNeedsDisplay];
    
    [[UIMenuController sharedMenuController] setTargetRect:sender.frame inView:sender];
    [[UIMenuController sharedMenuController] setMenuItems:units];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *customTitleView = [ [UIView alloc] initWithFrame:CGRectMake(15, 10, 300, 30)];
    UILabel *titleLabel = [ [UILabel alloc] initWithFrame:CGRectMake(15, 10, 300, 30)];
    
    titleLabel.text = (section == 0) ? @"Choose a Dunmore® core" : @"Or enter your own…";
    titleLabel.textColor = [UIColor colorWithRed:0.51f green:0.51f blue:0.50f alpha:0.8f];
    titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    titleLabel.shadowColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.8f];
    titleLabel.shadowOffset = CGSizeMake(0, 1.0f);
    titleLabel.backgroundColor = [UIColor clearColor];
    [customTitleView addSubview:titleLabel];
    return customTitleView;
    
}






- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"coreCustom"]){
        [[self.view viewWithTag:8] becomeFirstResponder];
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end