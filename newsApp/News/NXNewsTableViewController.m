//
//  NXNewsTableViewController.m
//  newsApp
//
//  Created by 차용빈 on 2014. 12. 18..
//  Copyright (c) 2014년 차용빈. All rights reserved.
//

#import "NXNewsTableViewController.h"
#import "NXNewsTableViewCell.h"

@interface NXNewsTableViewController () {
    NSMutableArray * myObject;
    NSDictionary * dictionary;
    NSString * title;
    NSString * link;
}

@end

@implementation NXNewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    title = @"title";
    link = @"link";
    
    myObject = [[NSMutableArray alloc] init];
    
//    NSString * URLString = @"http://10.73.45.55:5000/register/email";
//    NSString * FormData = [NSString stringWithFormat:@"email=%@",email];
//    NSURL * url = [NSURL URLWithString:URLString];
//    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
//    
//    [request setHTTPMethod:@"POST"];
//    [request setHTTPBody:[FormData dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    NSHTTPURLResponse * response;
//    NSError * error;
//    NSData * resultData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//    
//    NSString * result = [NSString stringWithUTF8String:resultData.bytes];
//    //result = [NSString stringWithFormat:@"%s"];
//    
//    NSLog(@"response = %ld", (long)response.statusCode);
//    NSLog(@"result = %@", result);
    
    NSString * URLString = @"http://10.73.45.55:5000/news";
    
    NSData * jsonSoure = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://10.73.45.55:5000/news"]];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}


- (NXNewsTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NXNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCell" forIndexPath:indexPath];
    
    cell.news_Title.text = @"'NHN넥스트' 사태 타 기관에도 불똥?";
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
