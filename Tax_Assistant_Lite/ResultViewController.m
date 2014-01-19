//
//  ResultViewController.m
//  Tax_Assistant_Lite
//
//  Created by Rich Allen on 05/01/2014.
//  Copyright (c) 2014 Magic Entertainment. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@end

@implementation ResultViewController
@synthesize resultsDict;
@synthesize totalIncomeForTax;
@synthesize personalAllowance;
@synthesize expensesLabel;
@synthesize lowRateLabel;
@synthesize midRateLabel;
@synthesize highRateLabel;
@synthesize totalTaxDueLabel;
@synthesize NILabel;
@synthesize firstPaymentLabel;
@synthesize secondPayemntLabel;
@synthesize lowrateLabelHide;
@synthesize midRateLabelHide;
@synthesize highRateLabelHide;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@", resultsDict);
    
	[self FillFields];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)FillFields
{
    totalIncomeForTax.text = [resultsDict objectForKey:@"TotalForTax"];
    personalAllowance.text = [resultsDict objectForKey:@"PersonalAllowance"];
    expensesLabel.text = [resultsDict objectForKey:@"Deductions"];
    
        highRateLabel.text = [resultsDict objectForKey:@"HigherTax"];
        midRateLabel.text = [resultsDict objectForKey:@"MidRateTax"];
        lowRateLabel.text = [resultsDict objectForKey:@"LowRateTax"];
    
    totalTaxDueLabel.text = [resultsDict objectForKey:@"TotalTax"];
    NILabel.text = [resultsDict objectForKey:@"NI"];
    firstPaymentLabel.text = [resultsDict objectForKey:@"FirstPayment"];
    secondPayemntLabel.text = [resultsDict objectForKey:@"SecondPayment"];
    
    
}

@end
