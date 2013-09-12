//
//  AdditionalCalculationViewController.m
//  Conversions
//
//  Created by Joel Glovacki on 9/11/13.
//  Copyright (c) 2013 Dunmore. All rights reserved.
//

#import "AdditionalCalculationViewController.h"
#import "ReadonlyUITextField.h"
@interface AdditionalCalculationViewController ()

@end

@implementation AdditionalCalculationViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]){}
    return self;
}

- (void)viewDidLoad
{
    
    self.title = _calculation;
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.90f alpha:1.00f];
    [super viewDidLoad];
    
    _fields = @[];
    
    if ([_calculation isEqualToString:@"Length & Width ➝ Area"]){
        
        _fields = @[
                    @{
                        @"label":           @"Length",
                        @"unit":            @"yd",
                        @"possibleUnits":   @[@"in", @"ft", @"yd"],
                        },
                    @{
                        @"label":           @"Width",
                        @"unit":            @"yd",
                        @"possibleUnits":   @[@"in", @"ft", @"yd"],
                        },
                    @{
                        @"label":           @"Result",
                        @"unit":            @"ft²",
                        @"possibleUnits":   @[@"in²", @"ft²", @"yd²"],
                        }
                    ];
        
    }

    
    if ([_calculation isEqualToString:@"Area & Width ➝ Length"]){
        
        _fields = @[
                    @{
                        @"label":           @"Area",
                        @"unit":            @"ft²",
                        @"possibleUnits":   @[@"in²", @"ft²", @"yd²", @"cm²", @"m²"],
                        },
                    @{
                        @"label":           @"Width",
                        @"unit":            @"yd",
                        @"possibleUnits":   @[@"in", @"yd", @"ft"],
                        },
                    @{
                        @"label":           @"Result",
                        @"unit":            @"yd",
                        @"possibleUnits":   @[@"in", @"yd", @"ft"],
                        }
                    ];
        
    }
    
    if ([_calculation isEqualToString:@"Length & Width ➝ MSI"]){
        
        _fields = @[
                    @{
                        @"label":           @"Length",
                        @"unit":            @"in",
                        @"possibleUnits":   @[@"in", @"ft", @"yd"],
                        },
                    @{
                        @"label":           @"Width",
                        @"unit":            @"yd",
                        @"possibleUnits":   @[@"in", @"ft", @"yd"],
                        },
                    @{
                        @"label":           @"Result",
                        @"unit":            @"msi",
                        @"possibleUnits":   @[],
                        }
                    ];
        
    }
    
    if ([_calculation isEqualToString:@"MSI & Width ➝ Area"]){
        
        _fields = @[
                    @{
                        @"label":           @"MSI (1,000 in²)",
                        @"unit":            @"msi",
                        @"possibleUnits":   @[],
                        },
                    @{
                        @"label":           @"Width",
                        @"unit":            @"yd",
                        @"possibleUnits":   @[@"in", @"yd", @"ft"],
                        },
                    @{
                        @"label":           @"Result",
                        @"unit":            @"yd²",
                        @"possibleUnits":   @[@"in²", @"ft²", @"yd²", @"cm²", @"m²"],
                        }
                    ];
        
    }
    
    
    if ([_calculation isEqualToString:@"oz/yd² ➝ g/m²"]){
        
        _fields = @[
                    @{
                        @"label":           @"Ounces / Yards²",
                        @"unit":            @"oz/yd²",
                        @"possibleUnits":   @[],
                        },
                    @{
                        @"label":           @"Result",
                        @"unit":            @"g/m²",
                        @"possibleUnits":   @[],
                        }
                    ];
        
    }
    
    
    if ([_calculation isEqualToString:@"g/m² ➝ oz/yd²"]){
        
        _fields = @[
                    @{
                        @"label":           @"Grams / Meters²",
                        @"unit":            @"g/m²",
                        @"possibleUnits":   @[],
                        },
                    @{
                        @"label":           @"Result",
                        @"unit":            @"oz/yd²",
                        @"possibleUnits":   @[],
                        }
                    ];
        
    }
    
   

    
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



- (id)objectify:(NSString *)unit {
    
    id object;
    
    if ([unit isEqualToString:@"in"]) object = [MKLengthUnit inch];
    if ([unit isEqualToString:@"ft"]) object = [MKLengthUnit foot];
    if ([unit isEqualToString:@"yd"]) object = [MKLengthUnit yard];
    if ([unit isEqualToString:@"mi"]) object = [MKLengthUnit mile];
    if ([unit isEqualToString:@"mm"]) object = [MKLengthUnit millimeter];
    if ([unit isEqualToString:@"cm"]) object = [MKLengthUnit centimeter];
    if ([unit isEqualToString:@"m"]) object = [MKLengthUnit meter];
    if ([unit isEqualToString:@"km"]) object = [MKLengthUnit kilometer];

    if ([unit isEqualToString:@"in²"]) object = [MKAreaUnit square_inch];
    if ([unit isEqualToString:@"ft²"]) object = [MKAreaUnit square_foot];
    if ([unit isEqualToString:@"yd²"]) object = [MKAreaUnit square_yard];
    if ([unit isEqualToString:@"mi²"]) object = [MKAreaUnit square_mile];
    if ([unit isEqualToString:@"mm²"]) object = [MKAreaUnit square_millimeter];
    if ([unit isEqualToString:@"cm²"]) object = [MKAreaUnit square_centimeter];
    if ([unit isEqualToString:@"m²"]) object = [MKAreaUnit square_meter];
    if ([unit isEqualToString:@"km²"]) object = [MKAreaUnit square_kilometer];
    
    return (object) ?: FALSE;

}



- (NSNumber *)convert:(NSNumber *)value from:(NSString *)from to:(NSString *)to {
    
    //if we don't have a legit conversion, just return value. not everything needs a conversion
    if (![self objectify:from] || ![self objectify:to]) return value;
    
    NSNumber *result = [MKUnit convertAmount:value from:[self objectify:from] to:[self objectify:to]];
    
    return result;
    
}




- (void)calculateResult:(UITextField *)sender {
    
    float total = 0;
    int filled_out_fields = 0;
    
    NSMutableArray *values = [[NSMutableArray alloc] init];
    NSMutableArray *numbers = [[NSMutableArray alloc] init];
    
    for (UITextField *field in _textFields){
        if (field.text.doubleValue < 0.0000000000001f) continue;
        filled_out_fields++;
        [values addObject: [NSNumber numberWithDouble:field.text.doubleValue]];
    }
    
    
    
    NSMutableArray *units = [[NSMutableArray alloc] init];
    for (UITextField *field in _textFields){
        RETableViewCell *badge = (RETableViewCell *)field.superview.superview;
        [units addObject:badge.badge.badgeString];
    }

    
    
    
    int i = 0;
    for (NSNumber *value in values) {
        
        NSLog(@"converting %@ %@ to %@",value, _fields[i][@"unit"], units[i]);
        
        [numbers addObject: (NSNumber *)[self convert:value from: units[i] to: _fields[i][@"unit"]]]; i++;
    }
    
    //make sure we have the full set of required fields
    if (filled_out_fields < [_fields count] - 1) return;
    
    
    if ([_calculation isEqualToString:@"Length & Width ➝ Area"]){
        //total = value1 * value2 / 4;
        total = [numbers[0] doubleValue] * [numbers[1] doubleValue];
    }

    if ([_calculation isEqualToString:@"Area & Width ➝ Length"]){
        //total = ([numbers[0] doubleValue] * 4) / [numbers[1] doubleValue];
        total = [numbers[0] doubleValue] / [numbers[1] doubleValue];
    }
    
    if ([_calculation isEqualToString:@"Length & Width ➝ MSI"]){
        total = [numbers[0] doubleValue] * [numbers[1] doubleValue] * 36 / 1000;
    }
    
    if ([_calculation isEqualToString:@"MSI & Width ➝ Area"]){
        total = [numbers[0] doubleValue] * 1000 / 36 / [numbers[1] doubleValue];
    }
    
    if ([_calculation isEqualToString:@"oz/yd² ➝ g/m²"]){
        total = [numbers[0] doubleValue] * 33.9057475;
    }
    
    if ([_calculation isEqualToString:@"g/m² ➝ oz/yd²"]){
        total = [numbers[0] doubleValue] * 0.0294935247;
    }
    
    
    
    
    
    RETableViewTextCell *textcell = (RETableViewTextCell *)_resultField.superview.superview;
    
    NSNumber *final_total = [self convert:[NSNumber numberWithDouble: total] from: textcell.badge.badgeString to: [_fields lastObject][@"unit"]];
    
    total = final_total.doubleValue;
    
    NSString *display = [NSNumberFormatter localizedStringFromNumber:[NSNumber numberWithDouble:total] numberStyle: NSNumberFormatterDecimalStyle];


    _resultField.text = display;
    
    
}



- (void)tableView:(UITableView *)tableView willDisplayCell:(RETableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    for (UIView *view in cell.contentView.subviews) {
        
        UITextField *currentView = ((UITextField *)view);
        
        if ([view isKindOfClass:[UILabel class]]){
            currentView.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16];
            currentView.textColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
        }
        
        if ([view isKindOfClass:[UITextField class]] || [view isKindOfClass:[UITextView class]]){
            
            currentView.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
            currentView.textColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
            
            if (![cell.textLabel.text isEqualToString:@"Result"]){
                
                _keyboardView = [[ZenKeyboard alloc] initWithFrame:CGRectMake(0, 0, 320, 216)];
                
                _keyboardView.textField = currentView;

                [currentView addTarget:self action:@selector(calculateResult:) forControlEvents:UIControlEventEditingChanged];
                
                [_textFields addObject: currentView];
                
                currentView.clearButtonMode = UITextFieldViewModeAlways;
                
                if (!indexPath.section && !indexPath.row) currentView.tag = 8;
                
            } else {
                
                _resultField = (ReadonlyUITextField *)currentView;
                currentView.enabled = FALSE;

                UILongPressGestureRecognizer *contextGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGestureDidFire:)];
                
                contextGestureRecognizer
                
                [currentView.superview.superview addGestureRecognizer:contextGestureRecognizer];
                
                //do something to copy the number to clipboard here.
                
            }
            
            
            
        }
    }
    
    
    int row = (indexPath.section == 0) ? indexPath.row : (_fields.count - 1);
    
    cell.badgeString        = _fields[row][@"unit"];
    cell.badgeColor         = [self colorize: _fields[row][@"unit"]];
    cell.badgeTextColor     = [UIColor colorWithRed:1.00f green:1.00f blue:1.00f alpha:1.00f];
    cell.badge.fontSize     = 14;
    cell.badgeLeftOffset    = 0;
    cell.badgeRightOffset   = 10;
    
    [cell.badge addTarget:self action:@selector(triggerMenu:) forControlEvents:UIControlEventTouchUpInside];

}

// First-level of response, filters out some noise
-(void)longPressGestureDidFire:(id)sender {
    UILongPressGestureRecognizer *recognizer = sender;
    if(recognizer.state == UIGestureRecognizerStateBegan) { // Only fire once
        [self initiateContextMenu:sender];
    }
}

// Second level of response - actually trigger the menu
-(void)initiateContextMenu:(id)sender {
    
    NSLog(@"%@",_resultField.text);
    
    [_resultField becomeFirstResponder]; // So the menu will be active.  We can't set the Text field to be first responder -- doesn't work if it is disabled
 
    [[UIMenuController sharedMenuController] setTargetRect:_resultField.frame inView:self.view];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
    [[UIMenuController sharedMenuController] setMenuItems:nil];
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    
    NSLog(@"blocking");
    
    if(action == @selector(copy:)) {
        return YES;
    }
    else {
        return NO;
    }
}



// The menu will automatically add a "Copy" command if it sees a "copy:" method.
// See UIResponderStandardEditActions to see what other commands we can add through methods.
-(void)copy:(id)sender {
    UIPasteboard *pb = [UIPasteboard generalPasteboard];
    UITextField *tf = (UITextField *)_resultField;
    NSLog(@"Copied %@", tf.text);
    [pb setString: tf.text];
}



-(UIColor *)colorize: (NSString *)unit {
    

    NSDictionary *units_to_colors = @{
                                      
      @"in": [UIColor colorWithRed:0.92f green:0.56f blue:0.15f alpha:1.00f],
      @"ft": [UIColor colorWithRed:0.46f green:0.14f blue:0.70f alpha:1.00f],
      @"yd": [UIColor colorWithRed:0.09f green:0.61f blue:0.46f alpha:1.00f],
      @"mi": [UIColor colorWithRed:0.00f green:0.64f blue:0.48f alpha:1.00f],
      @"mm": [UIColor colorWithRed:0.7f green:0.64f blue:0.48f alpha:1.00f],
      @"cm": [UIColor colorWithRed:0.37f green:0.73f blue:0.64f alpha:1.00f],
      @"m": [UIColor colorWithRed:0.50f green:0.05f blue:0.00f alpha:1.00f],
      @"km": [UIColor colorWithRed:0.36f green:0.25f blue:0.18f alpha:1.00f],
      
      @"msi": [UIColor colorWithRed:0.42f green:0.55f blue:0.50f alpha:1.00f],
      
      @"in²": [UIColor colorWithRed:0.92f green:0.56f blue:0.15f alpha:1.00f],
      @"ft²": [UIColor colorWithRed:0.46f green:0.14f blue:0.70f alpha:1.00f],
      @"yd²": [UIColor colorWithRed:0.09f green:0.61f blue:0.46f alpha:1.00f],
      @"mi²": [UIColor colorWithRed:0.00f green:0.64f blue:0.48f alpha:1.00f],
      @"mm²": [UIColor colorWithRed:0.7f green:0.64f blue:0.48f alpha:1.00f],
      @"cm²": [UIColor colorWithRed:0.37f green:0.73f blue:0.64f alpha:1.00f],
      @"m²": [UIColor colorWithRed:0.50f green:0.05f blue:0.00f alpha:1.00f],
      @"km²": [UIColor colorWithRed:0.36f green:0.25f blue:0.18f alpha:1.00f],
    
      @"g/m²": [UIColor colorWithRed:0.28f green:0.28f blue:0.28f alpha:1.00f],
      @"oz/yd²": [UIColor colorWithRed:0.40f green:0.64f blue:0.48f alpha:1.00f],
      
    };
    
    return (units_to_colors[unit]) ?: [UIColor colorWithRed:0.00f green:0.64f blue:0.48f alpha:1.00f];
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
            view_self.badgeColor = [self colorize: unit];
            
            view_self.badge.badgeString = unit;
            view_self.badge.badgeColor = [self colorize: unit];
            
            [view_self.badge setNeedsDisplay];
            [view_self setNeedsDisplay];
 
            [view_self.textField becomeFirstResponder];
            
            [[UIMenuController sharedMenuController] setMenuItems:nil];

            
            [self calculateResult: view_self.textField];
            
            
        }];
        [units addObject:possibleUnit];
    }
    
    

    
    //[cell.subviews setNeedsDisplay];
    
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