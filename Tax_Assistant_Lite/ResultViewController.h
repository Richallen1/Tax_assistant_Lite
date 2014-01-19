//
//  ResultViewController.h
//  Tax_Assistant_Lite
//
//  Created by Rich Allen on 05/01/2014.
//  Copyright (c) 2014 Magic Entertainment. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultViewController : UIViewController

//Labels
@property (weak, nonatomic) IBOutlet UILabel *totalIncomeForTax;
@property (weak, nonatomic) IBOutlet UILabel *personalAllowance;
@property (weak, nonatomic) IBOutlet UILabel *expensesLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowRateLabel;
@property (weak, nonatomic) IBOutlet UILabel *midRateLabel;
@property (weak, nonatomic) IBOutlet UILabel *highRateLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalTaxDueLabel;
@property (weak, nonatomic) IBOutlet UILabel *NILabel;
@property (weak, nonatomic) IBOutlet UILabel *firstPaymentLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondPayemntLabel;


//Labels to Hide
@property (weak, nonatomic) IBOutlet UILabel *lowrateLabelHide;
@property (weak, nonatomic) IBOutlet UILabel *midRateLabelHide;
@property (weak, nonatomic) IBOutlet UILabel *highRateLabelHide;

@property (weak, nonatomic) NSMutableDictionary *resultsDict;

@end
