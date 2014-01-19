//
//  MainViewController.m
//  Tax_Assistant_Lite
//
//  Created by Rich Allen on 05/01/2014.
//  Copyright (c) 2014 Magic Entertainment. All rights reserved.
//

#import "MainViewController.h"
#import "ResultViewController.h"

@interface MainViewController ()
{
    float GpersonalAllowance;
    float GtaxRate;
    NSMutableDictionary *dict;
}
@end

@implementation MainViewController
@synthesize turnoverField=_turnoverField;
@synthesize expensesField=_expensesField;
@synthesize AIAField=_AIAField;
@synthesize taxYearSegment=_taxYearSegment;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender

{
    if ([segue.identifier isEqualToString:@"Result"])
    {
        float deductions = [self calculateDeductions];
        [self calculateValuesWithDeductions:deductions];
        ResultViewController *rvc = segue.destinationViewController;
        rvc.resultsDict = dict;
    }

}
- (float)calculateDeductions
{
    float result = 0.00;
    
    float expenses = [_expensesField.text floatValue];
    float AIA = [_AIAField.text floatValue];
    
    result = expenses+AIA;

    return result;

}
-(void)calculateValuesWithDeductions:(float)deductions
{
    dict = [[NSMutableDictionary alloc]init];
    float taxDue = 0.0;
    float HigherTaxableIncome = 0.0;
    float midRateTaxableIncome = 0.0;
    float lowRateTaxableIncome = 0.0;
    float totalForTax = 0.00;
    totalForTax = [_turnoverField.text floatValue];
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    NSString *TotalForTax = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:totalForTax]];
    [dict setObject:TotalForTax forKey:@"TotalForTax"];
    
    //2012-13
    if (_taxYearSegment.selectedSegmentIndex == 0)
    {

        if (totalForTax > 100000.0)
        {
            NSString *PersonalAllowance = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:0.0]];
            [dict setObject:PersonalAllowance forKey:@"PersonalAllowance"];
        }
        else
        {
            totalForTax -= 7475.0;
            NSString *PersonalAllowance = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:7475.0]];
            [dict setObject:PersonalAllowance forKey:@"PersonalAllowance"];
        }
        
        totalForTax -= deductions;
        NSString *Deductions = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:deductions]];
        [dict setObject:Deductions forKey:@"Deductions"];
        
        if (totalForTax > 150000.0) {
            HigherTaxableIncome = totalForTax-150000.0;
            totalForTax -= HigherTaxableIncome;
            
            float tax = 0.5*HigherTaxableIncome;
            taxDue += tax;
            
            NSLog(@"Higher: %f",HigherTaxableIncome);
            NSLog(@"Tax: %f",tax);
            NSLog(@"Total: %f",totalForTax);
            
            
            NSString *HigherTaxIncome = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:HigherTaxableIncome]];
            NSString *HigherTax = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:tax]];
            
            [dict setObject:HigherTaxIncome forKey:@"HigherTaxIncome"];
            [dict setObject:HigherTax forKey:@"HigherTax"];
            
        }
        if (totalForTax > 34370.0) {
            midRateTaxableIncome = totalForTax - 34370.0;
            totalForTax -= midRateTaxableIncome;
            
            float tax = 0.4*midRateTaxableIncome;
            taxDue += tax;
            
            NSLog(@"Mid: %f",midRateTaxableIncome);
            NSLog(@"Tax: %f",tax);
            NSLog(@"Total: %f",totalForTax);
            
            
            NSString *MidRateTaxIncome = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:midRateTaxableIncome]];
            NSString *MidRateTax = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:tax]];
            
            [dict setObject:MidRateTaxIncome forKey:@"MidRateTaxIncome"];
            [dict setObject:MidRateTax forKey:@"MidRateTax"];
        }
        lowRateTaxableIncome = totalForTax;
        
        float tax = 0.2*lowRateTaxableIncome;
        taxDue += tax;
        
        
        NSString *LowRateTaxIncome = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:midRateTaxableIncome]];
        NSString *LowRateTax = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:tax]];
        
        [dict setObject:LowRateTaxIncome forKey:@"LowRateTaxIncome"];
        [dict setObject:LowRateTax forKey:@"LowRateTax"];
        
        NSLog(@"Low: %f",lowRateTaxableIncome);
        NSLog(@"Tax: %f",tax);
        NSLog(@"Total: %f",totalForTax);
   

    NSString *TotalTax = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:taxDue]];
    [dict setObject:TotalTax forKey:@"TotalTax"];
    
    float NIfl = 0.09*taxDue;
    NSString *NI = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:NIfl]];
    [dict setObject:NI forKey:@"NI"];
    
    
    float firstPaymentFl = 0.5*taxDue;
    float secondPayment = firstPaymentFl;
    firstPaymentFl += taxDue;
    NSString *FirstPayment = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:firstPaymentFl]];
    NSString *SecondPayment = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:secondPayment]];
    
    [dict setObject:FirstPayment forKey:@"FirstPayment"];
    [dict setObject:SecondPayment forKey:@"SecondPayment"];

    }
    
    
    //2013-14
    if (_taxYearSegment.selectedSegmentIndex == 1)
    {
        
        if (totalForTax > 100000.0)
        {
            NSString *PersonalAllowance = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:0.0]];
            [dict setObject:PersonalAllowance forKey:@"PersonalAllowance"];
        }
        else
        {
            totalForTax -= 9440.0;
            NSString *PersonalAllowance = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:9440.0]];
            [dict setObject:PersonalAllowance forKey:@"PersonalAllowance"];
        }
        
        totalForTax -= deductions;
        NSString *Deductions = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:deductions]];
        [dict setObject:Deductions forKey:@"Deductions"];
        
        if (totalForTax > 150000.0) {
            HigherTaxableIncome = totalForTax-150000.0;
            totalForTax -= HigherTaxableIncome;
            
            float tax = 0.5*HigherTaxableIncome;
            taxDue += tax;
            
            NSLog(@"Higher: %f",HigherTaxableIncome);
            NSLog(@"Tax: %f",tax);
            NSLog(@"Total: %f",totalForTax);
            
            
            NSString *HigherTaxIncome = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:HigherTaxableIncome]];
            NSString *HigherTax = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:tax]];
            
            [dict setObject:HigherTaxIncome forKey:@"HigherTaxIncome"];
            [dict setObject:HigherTax forKey:@"HigherTax"];
            
        }
        if (totalForTax > 32011.0) {
            midRateTaxableIncome = totalForTax - 32011.0;
            totalForTax -= midRateTaxableIncome;
            
            float tax = 0.4*midRateTaxableIncome;
            taxDue += tax;
            
            NSLog(@"Mid: %f",midRateTaxableIncome);
            NSLog(@"Tax: %f",tax);
            NSLog(@"Total: %f",totalForTax);
            
            NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
            [numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
            NSString *MidRateTaxIncome = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:midRateTaxableIncome]];
            NSString *MidRateTax = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:tax]];
            
            [dict setObject:MidRateTaxIncome forKey:@"MidRateTaxIncome"];
            [dict setObject:MidRateTax forKey:@"MidRateTax"];
        }
        lowRateTaxableIncome = totalForTax;
        
        float tax = 0.2*lowRateTaxableIncome;
        taxDue += tax;
        
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
        NSString *LowRateTaxIncome = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:midRateTaxableIncome]];
        NSString *LowRateTax = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:tax]];
        
        [dict setObject:LowRateTaxIncome forKey:@"LowRateTaxIncome"];
        [dict setObject:LowRateTax forKey:@"LowRateTax"];
        
        NSLog(@"Low: %f",lowRateTaxableIncome);
        NSLog(@"Tax: %f",tax);
        NSLog(@"Total: %f",totalForTax);
        
        
        NSString *TotalTax = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:taxDue]];
        [dict setObject:TotalTax forKey:@"TotalTax"];
        
        float NIfl = 0.09*taxDue;
        NSString *NI = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:NIfl]];
        [dict setObject:NI forKey:@"NI"];
        
    }
    
    float firstPaymentFl = 0.5*taxDue;
    float secondPayment = firstPaymentFl;
    firstPaymentFl += taxDue;
    NSString *FirstPayment = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:firstPaymentFl]];
    NSString *SecondPayment = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:secondPayment]];
    
    [dict setObject:FirstPayment forKey:@"FirstPayment"];
    [dict setObject:SecondPayment forKey:@"SecondPayment"];
    
}

@end
