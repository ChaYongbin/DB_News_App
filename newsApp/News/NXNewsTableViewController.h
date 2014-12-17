//
//  NXNewsTableViewController.h
//  newsApp
//
//  Created by 차용빈 on 2014. 12. 18..
//  Copyright (c) 2014년 차용빈. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NXNewsTableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end
