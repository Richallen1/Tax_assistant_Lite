//
//  MainViewController.h
//  Tax_Assistant_Lite
//
//  Created by Rich Allen on 05/01/2014.
//  Copyright (c) 2014 Magic Entertainment. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *turnoverField;
@property (weak, nonatomic) IBOutlet UITextField *expensesField;
@property (weak, nonatomic) IBOutlet UITextField *AIAField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *taxYearSegment;

@end
