//
//  ViewController.m
//  CodeChallenge1
//
//  Created by Syed Amaanullah on 1/9/15.
//  Copyright (c) 2015 Syed Amaanullah. All rights reserved.
//

#import "RootViewController.h"
#import "WebViewController.h"

@interface RootViewController ()
@property (weak, nonatomic) IBOutlet UITextField *valueOneTextField;
@property (weak, nonatomic) IBOutlet UITextField *valueTwoTextField;
@property (weak, nonatomic) IBOutlet UILabel *multiplierLabel;
@property (weak, nonatomic) IBOutlet UINavigationItem *navController;
@property (weak, nonatomic) IBOutlet UIButton *webButton;

@property int result;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webButton.enabled = NO;

}


- (IBAction)onCalculateButtonPressed:(UIButton *)sender {
    int inputValueOne = [self.valueOneTextField.text intValue];
    int inputValueTwo = [self.valueTwoTextField.text intValue];

    self.result = inputValueOne * inputValueTwo;
    self.navController.title = [NSString stringWithFormat:@"%i", self.result];
    [self.view endEditing:YES];

    if (self.result % 5 == 0) {
        self.webButton.enabled = YES;
    }
    else {
        self.webButton.enabled = NO;
    }
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)webSegue sender:(id)sender {
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)webSegue sender:(id)sender {
    WebViewController *webView = webSegue.destinationViewController;
    webView.title = [NSString stringWithFormat:@"%i", self.result];
}

- (IBAction)onWebButtonPressed:(UIButton *)sender {
    [self performSegueWithIdentifier: @"webSegue" sender:self];
}






@end
