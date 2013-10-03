//
//  YieldUsingStandardYieldViewController.m
//  Conversions
//
//  Created by Joel Glovacki on 8/27/13.
//  Copyright (c) 2013 Dunmore. All rights reserved.
//

//length of film = mass / (density * film thickness * width of blown film) 

/*

 $weight = ($length * 12) * $width * ($thickness / 1000) * $pet;

 $yield = ($weight / $width / $length / $thickness)


 
 

 
 
 
 
 
 
 function weight($yield, $length, $width) {
 return round(($yield * $length * $width * 0.0004), 2);
 }
 
 function yield($width, $weight, $length) {
 return round(($weight / $width / $length / 0.0004), 2);
 }
 
 $density = 1.4; //1.38 g/cm³
 
 $length = 100; //ft
 $weight = 10; //lb
 $width = 50; //in
 
 //$thickness = 250 //mil;
 $yield = 5; //mil
 
 echo weight($yield, $length, $width)."\n";
 
 echo yield($width, $weight, $length);
 //echo $width * $length / $density;
 
 
 
 
 
 
 
 
 

=IF(C10="PET",(C6*12)*C11*(C3/1000)*0.05,G2)
*/

#import "YieldUsingStandardYieldViewController.h"

@interface YieldUsingStandardYieldViewController ()

@end

@implementation YieldUsingStandardYieldViewController

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


- (void)viewDidLoad
{

    
    

    _petYields = @[
           @{@"display":@"1 ga\t\t\t\t.25 mic", @"gauge":@1.00,	@"mic":@0.25,   @"in":@1980198.00,	 @"ft":@13751.40,     @"yd":@1527.90,    @"m":@2816.50},
           @{@"display":@"48 ga\t\t\t\t12.19 mic", @"gauge":@48.00,	@"mic":@12.19,	@"in":@41254.00,     @"ft":@286.50,       @"yd":@31.80,      @"m":@58.70},
           @{@"display":@"60 ga\t\t\t\t15.24 mic", @"gauge":@60.00,	@"mic":@15.24,	@"in":@33003.00,     @"ft":@229.20,       @"yd":@25.50,      @"m":@46.90},
           @{@"display":@"75 ga\t\t\t\t19.05 mic", @"gauge":@75.00,	@"mic":@19.05,	@"in":@26403.00,     @"ft":@183.40,       @"yd":@20.40,      @"m":@37.60},
           @{@"display":@"92 ga\t\t\t\t23.37 mic", @"gauge":@92.00,	@"mic":@23.37,	@"in":@21524.00,     @"ft":@149.50,       @"yd":@16.60,      @"m":@30.60},
           @{@"display":@"142 ga\t\t\t36.07 mic", @"gauge":@142.00,	@"mic":@36.07,	@"in":@13945.00,     @"ft":@96.80,        @"yd":@10.80,      @"m":@19.80},
           @{@"display":@"200 ga\t\t\t50.80 mic", @"gauge":@200.00,	@"mic":@50.80,	@"in":@9901.00,      @"ft":@68.80,        @"yd":@7.60,       @"m":@14.10},
           @{@"display":@"300 ga\t\t\t76.20 mic", @"gauge":@300.00,	@"mic":@76.20,	@"in":@6601.00,      @"ft":@45.80,        @"yd":@5.10,       @"m":@9.40},
           @{@"display":@"400 ga\t\t\t101.60 mic", @"gauge":@400.00,	@"mic":@101.60,	@"in":@4901.00,      @"ft":@34.40,        @"yd":@3.80,       @"m":@7.00},
           @{@"display":@"500 ga\t\t\t127 mic", @"gauge":@500.00,	@"mic":@127.00,	@"in":@3960.00,      @"ft":@27.50,        @"yd":@3.10,       @"m":@5.60},
           @{@"display":@"700 ga\t\t\t177.80 mic", @"gauge":@700.00,	@"mic":@177.80,	@"in":@2829.00,      @"ft":@19.60,        @"yd":@2.20,       @"m":@4.00},
           ];
    
    
    
    
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

    
    self.title = @"Length / Standard Yield";
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.90f alpha:1.00f];

    [super viewDidLoad];
    
    _fields = @[
                @{
                    @"label":           @"Weight",
                    @"unit":            @"lb",
                    @"possibleUnits":   @[@"oz", @"lb", @"g", @"kg"],
                    },
                @{
                    @"label":           @"Width",
                    @"unit":            @"ft",
                    @"possibleUnits":   @[@"in", @"ft", @"yd", @"mm", @"m"],
                    },
                @{
                    @"label":           @"Thickness",
                    @"unit":            @"",
                    @"possibleUnits":   @[],
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
    
}


-(void)UIMenuControllerDidHide:(id)sender {
    [[UIMenuController sharedMenuController] setMenuItems:nil];
}




- (RETableViewSection *)addBasicControls {
    
    
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@"Roll Length"];
    [_manager addSection:section];
    for (NSDictionary *field in _fields){
        
        if ([field[@"label"] isEqualToString: @"Result"]) continue;
        
        if ([field[@"label"] isEqualToString: @"Thickness"]){
            
            __typeof (&*self) __weak weakSelf = self;
            
            RERadioItem *options = [RERadioItem itemWithTitle:@"Thickness" value:@"1 Gauge" selectionHandler:^(RERadioItem *item) {
                
            [item deselectRowAnimated:YES];
                
            NSMutableArray *options = [[NSMutableArray alloc] init];
            
                for (NSDictionary *petYield in _petYields){
                    [options addObject:[NSString stringWithFormat:@"%@", petYield[@"display"]]];
                }
                
     
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
            
        RETableViewItem *item = [RETextItem itemWithTitle:field[@"label"] value:nil placeholder:@"0"];
        [section addItem: item];
        
    }
    return section;
}
















- (RETableViewSection *)addButton {
    RETableViewSection *section = [RETableViewSection section];
    [_manager addSection:section];
    RETableViewItem *item = [RETextItem itemWithTitle:@"Result" value:nil placeholder:@"0"];
    [section addItem: item];
    return section;
}









- (void)calculateResult:(id)sender {
    
    float total = 0;
    int filled_out_fields = 0;
    
    NSMutableArray *values = [[NSMutableArray alloc] init];
    NSMutableArray *numbers = [[NSMutableArray alloc] init];
    
    RETableViewSection *section = self.manager.sections[0];
    RERadioItem *core_item = section.items[2];
    
    double yield = [core_item.value doubleValue];
    
    RETableViewOptionCell *cell = (RETableViewOptionCell*) [self.manager.tableView cellForRowAtIndexPath:core_item.indexPath];
    
    cell.valueLabel.text = [NSString stringWithFormat:@"%.0f Gauge", yield];
    
    for (UITextField *field in _textFields){
        if (field.text.doubleValue < 0.0000000000001f) continue;
        filled_out_fields++;
        [values addObject: [NSNumber numberWithDouble:field.text.doubleValue]];
    }

    NSMutableArray *units = [[NSMutableArray alloc] init];
    
    for (UITextField *field in _textFields){
        RETableViewCell *badge;
        
        if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
            badge = (RETableViewCell *)field.superview.superview;
        } else {
            badge = (RETableViewCell *)field.superview.superview.superview;
        }
        [units addObject:badge.badge.badgeString];
    }
    
    
    int i = 0;
    for (NSNumber *value in values) {
        NSLog(@"converting %@ %@ to %@",value, _fields[i][@"unit"], units[i]);
        [numbers addObject: (NSNumber *)[UnitConvert convert:value from: units[i] to: _fields[i][@"unit"]]]; i++;
    }
    
    //make sure we have the full set of required fields
    if (filled_out_fields < [_fields count] - 2) return;
    
    
    

    for (NSDictionary *petYield in _petYields){
        if ([petYield[@"gauge"] isEqualToNumber:[NSNumber numberWithDouble:yield]]){
            yield = [petYield[@"in"] doubleValue];
        }
    }
    

    
    total = [numbers[0] doubleValue] * yield / ([numbers[1] doubleValue] * 12) / 36;

    //NSLog(@"%f * %f / (%f * 12) / 36 = %f",[numbers[0] doubleValue], yield, ([numbers[1] doubleValue] * 12), total);
    

    RETableViewTextCell *textcell;
    
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        textcell = (RETableViewTextCell *)_resultField.superview.superview;
    } else {
        textcell = (RETableViewTextCell *)_resultField.superview.superview.superview;
    }
    
    NSNumber *final_total = [UnitConvert convert:[NSNumber numberWithDouble: total] from: [_fields lastObject][@"unit"] to: textcell.badge.badgeString];
    
    total = final_total.doubleValue;
    
    NSString *display = [NSNumberFormatter localizedStringFromNumber:[NSNumber numberWithDouble:total] numberStyle: NSNumberFormatterDecimalStyle];
    
    NSLog(@"display %@",display);
    
    _resultField.text = display;
    
}

//autocompleteTextField

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
                
                //NSLog(@"addto");
                
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
    
    
    //NSLog(@"%@",indexPath);
    
    int row = (!indexPath.section) ? indexPath.row : (_fields.count - 1);
    
    //NSLog(@"%d",row);
    
    //NSLog(@"row unit: %@",_fields[row][@"unit"]);

    
    if ([cell.textLabel.text rangeOfString:@"ga"].location != NSNotFound) {
        return;
    }
    
    
    if (_fields.count > row && ![_fields[row][@"unit"] isEqualToString:@""]){
        
        NSLog(@"%@", _fields[row][@"label"]);
        
        cell.badgeString        = _fields[row][@"unit"];
        cell.badgeColor         = [UnitConvert colorize: _fields[row][@"unit"]];
        cell.badgeTextColor     = [UIColor colorWithRed:1.00f green:1.00f blue:1.00f alpha:1.00f];
        cell.badge.fontSize     = 16;
        cell.badgeLeftOffset    = 0;
        cell.badgeRightOffset   = 10;
        
        [cell.badge addTarget:self action:@selector(triggerMenu:) forControlEvents:UIControlEventTouchUpInside];
        
        
        cell.badge.frame = CGRectMake(0,0,0,0);
        [cell.badge removeFromSuperview];
        [cell.badge setNeedsDisplay];
        
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
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        view_self = (RETableViewTextCell *)sender.superview.superview;
    } else {
        view_self = (RETableViewTextCell *)sender.superview.superview.superview;
    }
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:view_self];
    
    NSMutableArray *units = [[NSMutableArray alloc] init];
    
    int row = (!indexPath.section) ? indexPath.row : (_fields.count - 1);
    
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
            
        }];
        
        [units addObject:possibleUnit];
        
    }
    
    [sender.superview.superview setNeedsDisplay];
    
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
