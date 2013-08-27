//
//  DrawerViewController.m
//  Conversions
//
//  Created by Joel Glovacki on 7/24/13.
//  Copyright (c) 2013 Dunmore. All rights reserved.
//

#import "DrawerViewController.h"
#import "MMSideDrawerTableViewCell.h"
#import "MMSideDrawerSectionHeaderView.h"
#import "CalculationViewController.h"

@interface DrawerViewController ()

@end

@implementation DrawerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    /*
     
     self.data = @[@[
     @"Roll Length",
     @"Roll Diameter",
     @"Label Size to Roll",
     @"Calculate yield (msi/lb) using specific gravity",
     @"Msi/lb to sq ft/lb",
     @"Yard yield (yd/lb) from standard yield (msi/lb)",
     @"Calculate sheet yield (sheet/lb)",
     @"Polyester Film Yields (PET)",
     @"Metalized Film Resistance",
     ],
     @[
     @"Gauge → Inches",
     @"Mil → Mic → Gauge"
     ],
     @[
     @"MSI → Square Inch",
     @"MSI → Square Foot",
     @"Square Meter → Square Foot",
     @"MSI → Meter²"
     ],
     @[
     @"MT → Kilograms",
     @"Pounds → Kilograms",
     @"Kilograms → Pounds"
     ],
     @[
     @"Miles → Inches",
     @"Miles → Feet",
     @"Miles → Micron",
     
     
     @"Miles → Inches",
     @"Miles → Feet",
     @"Miles → Micron",
     @"Miles → Milli",
     @"Miles → Centi",
     @"Miles → Meters",
     @"Inches → Miles",
     @"Inches → Feet",
     @"Inches → Micron",
     @"Inches → Milli",
     @"Inches → Centi",
     @"Inches → Meters",
     @"Feet → Miles",
     @"Feet → Inches",
     @"Feet → Micron",
     @"Feet → Milli",
     @"Feet → Centi",
     @"Feet → Meters",
     @"Micron → Miles",
     @"Micron → Inches",
     @"Micron → Feet",
     @"Micron → Milli",
     @"Micron → Centi",
     @"Micron → Meters",
     @"Milli → Miles",
     @"Milli → Inches",
     @"Milli → Feet",
     @"Milli → Micron",
     @"Milli → Centi",
     @"Milli → Meters",
     @"Centi → Miles",
     @"Centi → Inches",
     @"Centi → Feet",
     @"Centi → Micron",
     @"Centi → Milli",
     @"Centi → Meters",
     @"Meters → Miles",
     @"Meters → Inches",
     @"Meters → Feet",
     @"Meters → Micron",
     @"Meters → Milli",
     @"Meters → Centi"
     
     ],
     ];
     
     
     
     
     */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  
     
     self.data = @[
     @{
     @"title"  : @"Calculators",
     @"rows"   : @[
     @"Roll Length",
     @"Roll Diameter",
     @"Label Size to Roll",
     @"Calculate yield (msi/lb)",
     @"Msi/lb to sq ft/lb",
     @"Yard yield (yd/lb) from standard yield (msi/lb)",
     @"Calculate sheet yield (sheet/lb)",
     @"Polyester Film Yields (PET)",
     @"Metalized Film Resistance",
     ],
     },
     
     @{
     @"title"  : @"Thickness Conversions",
     @"rows"   : @[
     @"Gauge → Inches",
     @"Mil → Gauge",
     @"Micron → Gauge"
     ],
     
     },
     
     @{
     @"title"  : @"Weight Conversions",
     @"rows"   : @[
     @"MSI → Square Inch",
     @"MSI → Square Foot",
     @"Square Meter → Square Foot",
     @"MSI → Meter²"
     ],
     },
     
     @{
     @"title"  : @"Area Conversions",
     @"rows"   : @[
     @"MT → Kilograms",
     @"Pounds → Kilograms",
     @"Kilograms → Pounds"
     ],
     },
     @{
     @"title"  : @"Length Conversions",
     @"rows"   : @[
     @"Miles → Inches",
     @"Miles → Feet",
     @"Miles → Micron",
     @"Miles → Inches",
     @"Miles → Feet",
     @"Miles → Micron",
     @"Miles → Milli",
     @"Miles → Centi",
     @"Miles → Meters",
     @"Inches → Miles",
     @"Inches → Feet",
     @"Inches → Micron",
     @"Inches → Milli",
     @"Inches → Centi",
     @"Inches → Meters",
     @"Feet → Miles",
     @"Feet → Inches",
     @"Feet → Micron",
     @"Feet → Milli",
     @"Feet → Centi",
     @"Feet → Meters",
     @"Micron → Miles",
     @"Micron → Inches",
     @"Micron → Feet",
     @"Micron → Milli",
     @"Micron → Centi",
     @"Micron → Meters",
     @"Milli → Miles",
     @"Milli → Inches",
     @"Milli → Feet",
     @"Milli → Micron",
     @"Milli → Centi",
     @"Milli → Meters",
     @"Centi → Miles",
     @"Centi → Inches",
     @"Centi → Feet",
     @"Centi → Micron",
     @"Centi → Milli",
     @"Centi → Meters",
     @"Meters → Miles",
     @"Meters → Inches",
     @"Meters → Feet",
     @"Meters → Micron",
     @"Meters → Milli",
     @"Meters → Centi"
     
     ],
     }
     ];
     
     
     
    
    
    
    
    
    /*
    
    self.data = @[
                  @{
                      @"title"  : @"Calculators",
                      @"rows"   : @[
                              @{
                                  @"title": @"Roll Length",
                                  @"inputs": @[
                                          @{
                                              @"id": @1,
                                              @"label": @"film thickness",
                                              },
                                          @{
                                              @"id": @2,
                                              @"label": @"roll diameter",
                                              },
                                          @{
                                              @"id": @3,
                                              @"label": @"core diameter",
                                              }
                                          ]
                                  },
                              @{
                                  @"title": @"Roll Diameter",
                                  @"inputs": @[
                                          @{
                                              @"id": @4,
                                              @"label": @"film thickness",
                                              },
                                          @{
                                              @"id": @5,
                                              @"label": @"length",
                                              },
                                          @{
                                              @"id": @6,
                                              @"label": @"core diameter",
                                              }
                                          ]
                                  },
                              ],
                      },
                  
                  @{
                      @"title"  : @"Thickness Conversions",
                      @"rows"   : @[
                              @{
                                  @"title": @"Mil -> Micron",
                                  @"inputs": @[
                                          @{
                                              @"id": @7,
                                              @"label": @"film thickness",
                                              },
                                          @{
                                              @"id": @8,
                                              @"label": @"roll diameter",
                                              },
                                          ]
                                  },
                              ],
                      
                      }
                  ];
    
    */
    
    
    //NSLog(@"%@",self.data);
    
    
    
    
    
    
    [self.tableview setSeparatorColor:[UIColor colorWithRed:0.00f green:0.00f blue:0.00f alpha:0.1f]];
    
    [self.tableview setBackgroundColor:[UIColor colorWithRed:0.00f green:0.38f blue:0.55f alpha:1.00f]];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:0.00f green:0.38f blue:0.55f alpha:1.00f]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




























- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.data count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data[section][@"rows"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"xcell"];
    
    if (cell == nil) {
        
        cell = [[MMSideDrawerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"xcell"];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
        
    }
    
    cell.textLabel.text = self.data[indexPath.section][@"rows"][indexPath.row];
    
    return cell;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return self.data[section][@"title"];
    
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    MMSideDrawerSectionHeaderView * headerView =  [[MMSideDrawerSectionHeaderView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.bounds), 30.0f)];
    [headerView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    [headerView setTitle:[tableView.dataSource tableView:tableView titleForHeaderInSection:section]];
    
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40.0;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle: nil];
    
    
    CalculationViewController *center = (CalculationViewController *)[mainStoryboard instantiateViewControllerWithIdentifier: @"calculation"];
    
        
//    [center setCalculationTitle:self.data[indexPath.section][@"title"]];
//    [center setCalculationSubTitle:@"Description Here"];
    
    [center setEntryFields:@[@"first", @"second", @"third", @"fourth"]];
    
    
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:center];
    
    
    
    [self.mm_drawerController
     setCenterViewController:nav
     withFullCloseAnimation:YES //withCloseAnimation
     completion:nil];
    
    
    
    [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


@end
