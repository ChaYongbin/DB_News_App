//
//  NXDetailViewController.h
//  newsApp
//
//  Created by 차용빈 on 2014. 12. 18..
//  Copyright (c) 2014년 차용빈. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NXDetailViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>

@property NSDictionary * selectedData;
@property NSString *imageField;
@property NSString *titleField;
@property NSString *timeField;
@property NSString *contentsField;
@property (weak, nonatomic) IBOutlet UILabel *detail_title;
@property (weak, nonatomic) IBOutlet UILabel *detail_time;
@property (weak, nonatomic) IBOutlet UIImageView *detail_img;
@property (weak, nonatomic) IBOutlet UITextView *detail_contents;
@property (weak, nonatomic) IBOutlet UITextField *commentField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
//@property (strong, nonatomic) IBOutlet UITableView *comment_table;

@end
