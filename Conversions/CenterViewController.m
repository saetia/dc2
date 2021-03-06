//
//  CenterViewController.m
//  Conversions
//
//  Created by Joel Glovacki on 7/24/13.
//  Copyright (c) 2013 Dunmore. All rights reserved.
//

#import "UIViewController+MMDrawerController.h"
#import "CenterViewController.h"
#import "MMDrawerBarButtonItem.h"
#import <QuartzCore/QuartzCore.h>

#import "RollLengthViewController.h"
#import "RollDiameterViewController.h"
#import "YieldUsingSpecificGravityViewController.h"
#import "YieldUsingStandardYieldViewController.h"
#import "YieldUsingCustomYieldViewController.h"
#import "MetallizedFilmResistanceViewController.h"
#import "LabelSizeToRollViewController.h"
#import "AdditionalCalculatorsViewController.h"

#import "AreaViewController.h"
#import "DistanceViewController.h"
#import "ThicknessViewController.h"
#import "WeightViewController.h"

@interface CenterViewController ()

@end

@implementation CenterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(BOOL) prefersStatusBarHidden { return YES; }

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    

    
    [self setupRightMenuButton];
    
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:0.00f green:0.50f blue:0.73f alpha:1.00f]];
    

    
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.00f green:0.50f blue:0.73f alpha:1.00f];
        self.navigationController.navigationBar.translucent = NO;

        //self.navigationController.navigationBar
    }
    
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {

        [[UINavigationBar appearance] setTitleTextAttributes: @{
                                                                UITextAttributeTextColor: [UIColor whiteColor],
                                                                UITextAttributeTextShadowColor: [UIColor colorWithRed:0.00f green:0.00f blue:0.00f alpha:0.5f],
                                                                UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 1.0f)],
                                                                UITextAttributeFont: [UIFont fontWithName:@"Helvetica Bold" size:20.0f]
                                                                }];
        
    }
    
    
    UIView *dunmoreLogo = [[DunmoreLogo alloc] initWithFrame:CGRectMake(0, 0, 175, 44)];
    dunmoreLogo.backgroundColor = [UIColor clearColor];
    [self.navigationItem setTitleView:dunmoreLogo];
    
 
    
    _fields = @[@"Roll Length",
                @"Roll Diameter",
                @"Label Size to Roll Length",
                @"Yield Using Specific Gravity",
                @"Length From Standard Yield",
                @"Length From Custom Yield",
                @"Metallized Film Resistance",
                @"Additional Calculators"];
    
    
    id tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Home"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
    
}





-(void)setupRightMenuButton{
    MMDrawerBarButtonItem * rightDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(rightDrawerButtonPress:)];
    [self.navigationItem setRightBarButtonItem:rightDrawerButton animated:YES];
}


-(void)rightDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _fields.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Main" forIndexPath:indexPath];
    
    cell.textLabel.text = _fields[indexPath.row];


    cell.textLabel.highlightedTextColor = [UIColor grayColor];
    
    
    
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
    
    if (indexPath.row == 0){
        
        //top
        cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"SettingsFormTop"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]];
        
        cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"SettingsFormTopTap"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]];
        
    } else if (indexPath.row == _fields.count - 1){
        
        //last

        cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"SettingsFormBottom"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]];
        
        cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"SettingsFormBottomTap"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]];
        
    } else {
        
        //middle
        cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"SettingsFormMiddle"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]];
        
        cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"SettingsFormMiddleTap"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)]];
        
    }
        
        
    }
    
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
    cell.textLabel.textColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];

    return cell;
    
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    UITableViewController *detailViewController = [[UITableViewController alloc] init];
    
    switch(indexPath.row){
        case 0: {
            detailViewController = [[RollLengthViewController alloc] init];
            break;
        }
        case 1: {
            detailViewController = [[RollDiameterViewController alloc] init];
            break;
        }
        case 2:{
            detailViewController = [[LabelSizeToRollViewController alloc] init];
            break;
        }
        case 3:{
            detailViewController = [[YieldUsingSpecificGravityViewController alloc] init];
            break;
        }
        case 4:{
            detailViewController = [[YieldUsingStandardYieldViewController alloc] init];
            break;
        }
        case 5:{
            detailViewController = [[YieldUsingCustomYieldViewController alloc] init];
            break;
        }
        case 6:{
            detailViewController = [[MetallizedFilmResistanceViewController alloc] init];
            break;
        }
        case 7:{
            detailViewController = [[AdditionalCalculatorsViewController alloc] init];
            break;
        }
            
    }
    
    
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    
 
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)areaTap:(UIButton *)sender {
    
    AreaViewController *detailViewController = [[AreaViewController alloc] init];
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}

- (IBAction)weightTap:(UIButton *)sender {
    
    WeightViewController *detailViewController = [[WeightViewController alloc] init];
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}

- (IBAction)distanceTap:(UIButton *)sender {
    
    DistanceViewController *detailViewController = [[DistanceViewController alloc] init];
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}

- (IBAction)thicknessTap:(UIButton *)sender {

    ThicknessViewController *detailViewController = [[ThicknessViewController alloc] init];
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}
@end
