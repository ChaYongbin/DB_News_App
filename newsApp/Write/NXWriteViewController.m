//
//  NXWriteViewController.m
//  newsApp
//
//  Created by 차용빈 on 2014. 12. 18..
//  Copyright (c) 2014년 차용빈. All rights reserved.
//

#import "NXWriteViewController.h"

@interface NXWriteViewController ()

@end

@implementation NXWriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapSave:(id)sender {
    http://cfile7.uf.tistory.com/image/157DD34B502D1C21224CC3
    NSString * title = [self.writeTitle text];
    NSString * img_path = [self.imgURL text];
    NSString * contents = [self.writeContents text];
    NSString * user_email = [self.writeAuthor text];
    
    NSString * URLString = @"http://10.73.45.55:5000/upload";
    NSString * FormData = [NSString stringWithFormat:@"title=%@&img_path=%@&contents=%@&user_email=%@",title,img_path,contents,user_email];
    NSURL * url = [NSURL URLWithString:URLString];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[FormData dataUsingEncoding:NSUTF8StringEncoding]];
    
    //NSURLConnection 으로 Request 전송
    NSHTTPURLResponse * sResponse;
    NSError * error;
    NSData * resultData = [NSURLConnection sendSynchronousRequest:request returningResponse:&sResponse error:&error];
    NSLog(@"response = %ld", (long)sResponse.statusCode);
    NSLog(@"result = %@", [NSString stringWithUTF8String:resultData.bytes] );
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
