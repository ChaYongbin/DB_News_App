//
//  NXDetailViewController.m
//  newsApp
//
//  Created by 차용빈 on 2014. 12. 18..
//  Copyright (c) 2014년 차용빈. All rights reserved.
//

#import "NXDetailViewController.h"
#import "commentCell.h"

@interface NXDetailViewController () {
    NSMutableArray * myObject;
    NSDictionary * dictionary;
    NSString * contents;
}
@end

@implementation NXDetailViewController
@synthesize titleField;
@synthesize imageField;
@synthesize timeField;
@synthesize contentsField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    myObject = [[NSMutableArray alloc] init];
    _detail_title.text = titleField;
    _detail_contents.text = contentsField;
    NSURL *url = [NSURL URLWithString:imageField];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc]initWithData:data];
    [_detail_img setImage:img];
    
    contents = @"contents";
    
    NSData * jsonSource  = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://10.73.45.55:5000/news/comment"]];
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:
                      jsonSource options:NSJSONReadingMutableContainers error:nil];
    for (NSDictionary *dataDict in jsonObjects) {
        NSString *contents_data = [dataDict objectForKey:@"contents"];
        
        NSLog(@"contents: %@", contents_data);
        
        dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                      contents_data,contents, nil];
        [myObject addObject:dictionary];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData]; // to reload selected cell
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return myObject.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    commentCell * cell = [tableView dequeueReusableCellWithIdentifier:@"commentCell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[commentCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"commentCell" ];
    }
    
    NSDictionary *tmpDict = [myObject objectAtIndex:indexPath.row];
    
    NSMutableString *text;
    //text = [NSString stringWithFormat:@"%@",[tmpDict objectForKey:title]];
    text = [NSMutableString stringWithFormat:@"%@", [tmpDict objectForKey:contents]];
    NSLog(@"%@",text);
    cell.Label.text = text;
    
    return cell;
}

- (IBAction)commentSave:(id)sender {
    NSString * article_id = @"18";
    NSString * a_contents = [self.commentField text];
    NSString * user_email = @"test@test.com";
    
    NSString * URLString = @"http://10.73.45.55:5000/upload/comment";
    NSString * FormData = [NSString stringWithFormat:@"article_id=%@&contents=%@&user_email=%@",article_id,a_contents,user_email];
    NSURL * url = [NSURL URLWithString:URLString];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[FormData dataUsingEncoding:NSUTF8StringEncoding]];
    
    //NSURLConnection 으로 Request 전송
    NSHTTPURLResponse * sResponse;
    NSError * error;
    NSData * resultData = [NSURLConnection sendSynchronousRequest:request returningResponse:&sResponse error:&error];
    NSLog(@"response = %ld", (long)sResponse.statusCode);
    NSLog(@"result = %@", [NSString stringWithUTF8String:resultData.bytes]);
    [self.tableView reloadData];
    [self tableView];
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
