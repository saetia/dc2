//
//  RollLengthViewController.m
//  Conversions
//
//  Created by Joel Glovacki on 8/9/13.
//  Copyright (c) 2013 Dunmore. All rights reserved.
//

#import "RollLengthViewController.h"
#import "CoreDiameterPickerViewController.h"

@interface RollLengthViewController ()
@property (strong, readwrite, nonatomic) RERadioItem *coreDiameter;
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
    
    self.coreDiameter.value = [[NSUserDefaults standardUserDefaults] objectForKey:@"coreTitle"];
    [self.coreDiameter reloadRowWithAnimation:UITableViewRowAnimationNone];
    
    [self calculateResult:nil];
    
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
    [UIView animateWithDuration:.3 animations:^(void)
     {
         self.tableView.contentInset = UIEdgeInsetsZero;
         self.tableView.scrollIndicatorInsets = UIEdgeInsetsZero;
     }];
}

- (void)notificationTriggered:(NSNotification *)notification {
    if ([notification.name isEqualToString:@"reloadData"]){
        self.coreDiameter.value = [[NSUserDefaults standardUserDefaults] objectForKey:@"coreTitle"];
        [self.coreDiameter reloadRowWithAnimation:UITableViewRowAnimationNone];
        [self calculateResult:nil];
    }
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{

    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(notificationTriggered:)
     name:@"reloadData"
     object:nil];
    
    
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

    self.title = @"Roll Length";
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.90f alpha:1.00f];
    [super viewDidLoad];
    
    _fields = @[
        @{
            @"label":           @"Film Thickness",
            @"unit":            @"mil",
            @"possibleUnits":   @[@"mil", @"mic", @"ga", @"in"],
        },
        @{
            @"label":           @"Roll Diameter",
            @"unit":            @"in",
            @"possibleUnits":   @[@"in", @"ft", @"yd", @"mm", @"m"],
        },
        @{
            @"label":           @"Core Diameter",
            @"unit":            @"",
            @"possibleUnits":   @[],
            //@"unit":            @"in",
            //@"possibleUnits":   @[@"in", @"ft", @"yd"],
        },
        @{
            @"label":           @"Result",
            @"unit":            @"yd",
            @"possibleUnits":   @[@"in", @"ft", @"yd", @"mm", @"m"],
        }
    ];
    
    _textFields = [[NSMutableArray alloc] init];
    
    _manager = [[RETableViewManager alloc] initWithTableView:self.tableView delegate:self];
    self.basicControlsSection = [self addBasicControls];
    self.buttonSection = [self addButton];
    
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


- (RETableViewSection *)addBasicControls {
    
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@"Roll Length"];
    
    [_manager addSection:section];
    
    for (NSDictionary *field in _fields){
        if ([field[@"label"] isEqualToString: @"Result"]) continue;
        

        
        
        
        
        
        
        
        
        if ([field[@"label"] isEqualToString: @"Core Diameter"]){
            
            __typeof (&*self) __weak weakSelf = self;
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

            self.coreDiameter = [RERadioItem itemWithTitle:@"Core Diameter" value:[defaults objectForKey:@"coreTitle"] selectionHandler:^(RERadioItem *item) {
                
                [item deselectRowAnimated:YES];
                
                CoreDiameterPickerViewController *vc = [[CoreDiameterPickerViewController alloc] init];
                
                //CoreDiameterPickerViewController *vc = [weakSelf.storyboard instantiateViewControllerWithIdentifier:@"location_picker"];
                
                [weakSelf.navigationController pushViewController:vc animated:YES];
                
            }];
            
            [section addItem: self.coreDiameter];
            continue;
            
        }
        
        
        
        
        /*
        if ([field[@"label"] isEqualToString: @"Core Diameter"]){
            
            __typeof (&*self) __weak weakSelf = self;
            
            RERadioItem *options = [RERadioItem itemWithTitle:@"Core Diameter" value:@"3 inches" selectionHandler:^(RERadioItem *item) {
                
                [item deselectRowAnimated:YES];
                
                NSMutableArray *options = [[NSMutableArray alloc] init];
                
                [options addObject:@"3 inches"];
                [options addObject:@"6 inches"];
                
                RETableViewOptionsController *optionsController = [[RETableViewOptionsController alloc] initWithItem:item options:options multipleChoice:NO completionHandler:^{
                    [weakSelf.navigationController popViewControllerAnimated:YES];
                    
                    [item reloadRowWithAnimation:UITableViewRowAnimationNone];
                    
                    [weakSelf calculateResult: item];
                    
                }];
                
                
                optionsController.delegate = weakSelf;
                optionsController.style = section.style;
                if (weakSelf.tableView.backgroundView == nil) {
                    optionsController.tableView.backgroundColor = weakSelf.tableView.backgroundColor;
                    optionsController.tableView.backgroundView = nil;
                }
                
                
                [weakSelf.navigationController pushViewController:optionsController animated:YES];
                
            }];
            
            [section addItem: options];
            continue;
            
        }
        */
         
        
        
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

- (void)calculateResult:(id)sender {
    
    float total = 0;
    int filled_out_fields = 0;
    
    NSMutableArray *values = [[NSMutableArray alloc] init];
    NSMutableArray *numbers = [[NSMutableArray alloc] init];
    
    
    //RETableViewSection *section = self.manager.sections[0];
    //RERadioItem *core_item = section.items[2];
    //double core_diameter = ([core_item.value isEqualToString:@"3 inches"]) ? 3.75f : 7.00f;
    
    double core_diameter = [[[NSUserDefaults standardUserDefaults] objectForKey:@"coreValue"] doubleValue];
    
    if (![[[NSUserDefaults standardUserDefaults] objectForKey:@"coreUnit"] isEqualToString:@"in"]){
        core_diameter = [[UnitConvert convert:[NSNumber numberWithDouble: core_diameter] from: [[NSUserDefaults standardUserDefaults] objectForKey:@"coreUnit"] to: @"in"] doubleValue];
    }
    
    
    
    for (UITextField *field in _textFields){
        if (field.text.doubleValue < 0.0000000000001f) continue;
        filled_out_fields++;
        [values addObject: [NSNumber numberWithDouble:field.text.doubleValue]];
    }

    NSMutableArray *units = [[NSMutableArray alloc] init];
    for (UITextField *field in _textFields){

        NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:[self.tableView convertPoint:field.center fromView:field.superview]];
        
    
        RETableViewCell *badge = (RETableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
        
        /*
        if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
            badge = (RETableViewCell *)field.superview.superview;
        } else {
            badge = (RETableViewCell *)field.superview.superview.superview;
        }
        */

        [units addObject:badge.badge.badgeString];
    }

    int i = 0;
    for (NSNumber *value in values) {
        //NSLog(@"converting %@ %@ to %@ = %@",value, _fields[i][@"unit"], units[i], [UnitConvert convert:value from: units[i] to: _fields[i][@"unit"]]);
        [numbers addObject: (NSNumber *)[UnitConvert convert:value from: units[i] to: _fields[i][@"unit"]]]; i++;
    }
    
    //make sure we have the full set of required fields
    if (filled_out_fields < [_fields count] - 2) return;
        

    total = 0.06545f / ([numbers[0] doubleValue] * 0.001) * (pow([numbers[1] doubleValue],  2.0f) - pow(core_diameter,  2.0f)) / 3.0f;
    
    if (total < 0) total = 0;
    
    //RETableViewTextCell *textcell;
    
    
    
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:[self.tableView convertPoint:_resultField.center fromView:_resultField.superview]];
    
    
    RETableViewTextCell *textcell = (RETableViewTextCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    
    
    /*
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        textcell = (RETableViewTextCell *)_resultField.superview.superview;
    } else {
        textcell = (RETableViewTextCell *)_resultField.superview.superview.superview;
    }
    */

    NSNumber *final_total = [UnitConvert convert:[NSNumber numberWithDouble: total] from: [_fields lastObject][@"unit"] to: textcell.badge.badgeString];
    
    total = final_total.doubleValue;
    
    NSString *display = [NSNumberFormatter localizedStringFromNumber:[NSNumber numberWithDouble:total] numberStyle: NSNumberFormatterDecimalStyle];
    
    _resultField.text = display;
    
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
            
            if (![cell.textLabel.text isEqualToString:@"Result"]){
                _keyboardView = [[ZenKeyboard alloc] initWithFrame:CGRectMake(0, 0, 320, 216)];
                _keyboardView.textField = (UITextField *)view;
            
                
                [(UITextField *)view addTarget:self action:@selector(calculateResult:) forControlEvents:UIControlEventEditingChanged];
                
                _textFields[indexPath.row] = (UITextField *)view;
                
                
                if (!indexPath.section && !indexPath.row) currentView.tag = 8;
      
                
            } else {
                
                _resultField = (UITextField *)view;
                
                currentView.enabled = FALSE;
                //do something to copy the number to clipboard here.
            }
        
        
            
        }
    }


    int row = (indexPath.section == 0) ? indexPath.row : (_fields.count - 1);


    if ([cell.textLabel.text rangeOfString:@"inches"].location != NSNotFound) {
        return;
    }
    
    
    if (_fields.count > row && ![_fields[row][@"unit"] isEqualToString:@""]){

        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *unit = [defaults objectForKey:[self.title stringByAppendingString: cell.textLabel.text]];
        if (unit == nil) unit = _fields[row][@"unit"];
        
        cell.badgeString        = unit;
        cell.badgeColor         = [UnitConvert colorize: unit];
        cell.badgeTextColor     = [UIColor colorWithRed:1.00f green:1.00f blue:1.00f alpha:1.00f];
        cell.badge.fontSize     = 16;
        cell.badgeLeftOffset    = 0;
        cell.badgeRightOffset   = 10;
        
        [cell.badge addTarget:self action:@selector(triggerMenu:) forControlEvents:UIControlEventTouchUpInside];
            
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
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:view_self];
    
    NSMutableArray *units = [[NSMutableArray alloc] init];
    
    int row = (!indexPath.section) ? (int)indexPath.row : ((int)_fields.count - 1);
    
    for (NSString *unit in _fields[row][@"possibleUnits"]){
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
    
    [view_self setNeedsDisplay];
    
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
