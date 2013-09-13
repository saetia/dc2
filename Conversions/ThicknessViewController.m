//
//  ThicknessViewController.m
//  Conversions
//
//  Created by Joel Glovacki on 8/28/13.
//  Copyright (c) 2013 Dunmore. All rights reserved.
//

#import "ThicknessViewController.h"

@interface ThicknessViewController ()

@end

@implementation ThicknessViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]){}
    return self;
}





-(void)viewWillAppear:(BOOL)animated {
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 35, 21)];
    
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




- (void)viewDidLoad
{
    
    self.title = @"Thickness Conversions";
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.90f alpha:1.00f];
    [super viewDidLoad];
    
    
    _fields = @[
                @{
                    @"label":           @"Mil",
                    @"base":            @1,
                    },
                @{
                    @"label":           @"Micron",
                    @"base":            @0.0393700787,
                    },
                @{
                    @"label":           @"Gauge",
                    @"base":            @0.01,
                    },
                @{
                    @"label":           @"Millimeter",
                    @"base":            @39.3700787,
                    },
                @{
                    @"label":           @"Inch",
                    @"base":            @1000,
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
        
        RETextItem *item = [RETextItem itemWithTitle:field[@"label"] value:nil placeholder:@"0.00"];
        
        [item setOnChange:^(RETextItem *item){
            
            
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
            currentView.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16];
            currentView.textColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
        }
        
        if ([view isKindOfClass:[UITextField class]]){
            
            currentView.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
            currentView.textColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
            currentView.tag = indexPath.row + 5000;
            
            _keyboardView = [[ZenKeyboard alloc] initWithFrame:CGRectMake(0, 0, 320, 216)];
            _keyboardView.textField = (UITextField *)view;
            
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

