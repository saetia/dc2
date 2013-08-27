//
//  CenterViewController.h
//  Conversions
//
//  Created by Joel Glovacki on 7/24/13.
//  Copyright (c) 2013 Dunmore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+MMDrawerController.h"

@interface CenterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *rollLength;
@property (weak, nonatomic) IBOutlet UIButton *rollDiameter;
@property (weak, nonatomic) IBOutlet UIButton *labelToRoll;
@property (weak, nonatomic) IBOutlet UIButton *yieldUsingSG;
@property (weak, nonatomic) IBOutlet UIButton *yieldUsingStandardYield;
@property (weak, nonatomic) IBOutlet UIButton *metallizedFilmResistance;


- (IBAction)rollLengthTapped:(UIButton *)sender;

- (IBAction)rollDiameter:(UIButton *)sender;

- (IBAction)labelToRollTapped:(UIButton *)sender;

- (IBAction)yieldUsingSGTapped:(UIButton *)sender;

- (IBAction)yieldUsingStandardYieldTapped:(UIButton *)sender;

- (IBAction)metallizedFilmResistanceTapped:(UIButton *)sender;

@end
