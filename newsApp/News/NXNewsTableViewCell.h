//
//  NXNewsTableViewCell.h
//  newsApp
//
//  Created by 차용빈 on 2014. 12. 18..
//  Copyright (c) 2014년 차용빈. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NXNewsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *news_Img;
@property (weak, nonatomic) IBOutlet UILabel *news_Title;

@end
