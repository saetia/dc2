//
//  CenterViewController.h
//  Conversions
//
//  Created by Joel Glovacki on 7/24/13.
//  Copyright (c) 2013 Dunmore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+MMDrawerController.h"
#import "DunmoreLogo.h"


@interface CenterViewController : UITableViewController

@property (strong, readwrite, nonatomic) NSArray *fields;

- (IBAction)areaTap:(UIButton *)sender;
- (IBAction)weightTap:(UIButton *)sender;
- (IBAction)distanceTap:(UIButton *)sender;
- (IBAction)thicknessTap:(UIButton *)sender;

@end
