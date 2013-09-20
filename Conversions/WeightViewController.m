//
//  WeightViewController.m
//  Conversions
//
//  Created by Joel Glovacki on 8/28/13.
//  Copyright (c) 2013 Dunmore. All rights reserved.
//

#import "WeightViewController.h"

@interface WeightViewController ()

@end

@implementation WeightViewController

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
    
    self.title = @"Mass Conversions";
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.90f alpha:1.00f];
    [super viewDidLoad];
    
    
    _fields = @[
                @{
                    @"label":           @"Milligram",
                    @"base":            @1,
                    },
                @{
                    @"label":           @"Grams",
                    @"base":            @1000,
                    },
                @{
                    @"label":           @"Kilograms",
                    @"base":            @1000000,
                    },
                @{
                    @"label":           @"Metric Tons",
                    @"base":            @1000000000,
                    },
                @{
                    @"label":           @"Ounces",
                    @"base":            @28349.5,
                    },
                @{
                    @"label":           @"Pounds",
                    @"base":            @453592,
                    },
                @{
                    @"label":           @"Stones",
                    @"base":            @6350293.18,
                    },
                ];
    
    
    _textFields = [[NSMutableArray alloc] init];
    
    _manager = [[RETableViewManager alloc] initWithTableView:self.tableView delegate:self];
    
    
    self.basicControlsSection = [self addBasicControls];
    
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
    
}



- (RETableViewSection *)addBasicControls {
    
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@""];
    
    [_manager addSection:section];
    
    for (NSDictionary *field in _fields){
        
        RETextItem *item = [RETextItem itemWithTitle:field[@"label"] value:nil placeholder:@"0.00"];
        
        [item setOnChange:^(RETextItem *item){
            

            //clear old corner piece
            [[self.view viewWithTag:103040] removeFromSuperview];
            RETableViewTextCell *used_cell = (RETableViewTextCell*) [self.tableView cellForRowAtIndexPath:item.indexPath];
            UIImageView *corner = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LikePhotoCorner"]];
            corner.tag = 103040;
            double padding = 0;
            if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
                padding = 20;
            }
            corner.frame = CGRectMake(used_cell.frame.size.width - 21 - padding, 0, 21, 21);
            [used_cell.contentView addSubview:corner];
            
            
        
            NSNumber *baseConverter;
            
            for (NSDictionary *field in _fields){
                if ([field[@"label"] isEqualToString:item.title]){
                    baseConverter = field[@"base"];
                    break;
                }
            }
            
            
            double numberAsBase = item.value.doubleValue * baseConverter.doubleValue;
            
            
            for (RETableViewSection *sections in self.manager.sections){
                
                int i = 0;
                
                for (RETextItem *textItem in sections.items){
                    
                    if ([textItem.title isEqualToString:item.title]) {i++; continue;}
                    
                    NSNumber *fieldBase = _fields[i][@"base"];
                    
                    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
                    
                    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
                    
                    NSNumber *number = [NSNumber numberWithDouble:numberAsBase / fieldBase.doubleValue];
                    
                    textItem.value = [NSNumberFormatter localizedStringFromNumber:number numberStyle: NSNumberFormatterDecimalStyle];
                    
                    if ([textItem.value isEqualToString:@"0"]) {textItem.value = @"";}
                    
                    
                    for (UIView *view in cell.contentView.subviews) {
                        UITextField *currentView = ((UITextField *)view);
                        if ([view isKindOfClass:[UITextField class]]){
                            currentView.text = textItem.value;
                        }
                    }
                    
                    i++;
                    
                }
                
            }
            
        }];
        
        [section addItem: item];
        
    }
    
    return section;
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(RETableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    for (UIView *view in cell.contentView.subviews) {
        
        UILabel *currentView = ((UILabel *)view);
        
        if ([view isKindOfClass:[UILabel class]]){
            currentView.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
            currentView.textColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
        }
        
        if ([view isKindOfClass:[UITextField class]]){
            
            currentView.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
            currentView.textColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
            currentView.tag = indexPath.row + 5000;
            
            _keyboardView = [[ZenKeyboard alloc] initWithFrame:CGRectMake(0, 0, 320, 216)];
            _keyboardView.textField = (UITextField *)view;
            
            ((UITextField *)currentView).clearButtonMode = UITextFieldViewModeAlways;
            
        }
    }
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[self.view viewWithTag:5000] becomeFirstResponder];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

