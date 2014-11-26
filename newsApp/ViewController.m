//
//  ViewController.m
//  newsApp
//
//  Created by 차용빈 on 2014. 11. 26..
//  Copyright (c) 2014년 차용빈. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputID;
@property (weak, nonatomic) IBOutlet UITextField *inputPassword;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)register:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController* controller = [storyboard instantiateViewControllerWithIdentifier:@"register"];
    
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)login:(id)sender {
    
    BOOL correct;
    
    correct = YES;
    
    if (correct == YES) {
        @autoreleasepool {
            ViewController *nextView=[[ViewController alloc] init];
            [UIView  beginAnimations:nil context:NULL];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            [UIView setAnimationDuration:0.75];
            [self.navigationController pushViewController:nextView animated:NO];
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
            [UIView commitAnimations];
        }
       
    }
    else {
        self.inputID.textColor = [UIColor redColor];
        self.inputID.text = @"다시 입력해주세요.";
    }
}

@end
