//
//  NXWriteViewController.h
//  newsApp
//
//  Created by 차용빈 on 2014. 12. 18..
//  Copyright (c) 2014년 차용빈. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NXWriteViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField * writeTitle;
@property (weak, nonatomic) IBOutlet UITextField * writeAuthor;
@property (weak, nonatomic) IBOutlet UITextView * writeContents;
@property (weak, nonatomic) IBOutlet UITextField * imgURL;

@end
