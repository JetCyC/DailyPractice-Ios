//
//  CZCarHeaderview.m
//  dailypractice-ios
//
//  Created by 曹延昌 on 2019/2/16.
//  Copyright © 2019年 曹延昌. All rights reserved.
//

#import "CZCarHeaderview.h"

@interface CZCarHeaderview()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;



@end
@implementation CZCarHeaderview
+ (instancetype)headerView{
    CZCarHeaderview *headerView=[[[NSBundle mainBundle]  loadNibNamed:@"CZCarHeaderview" owner:nil options:nil] firstObject];
    return headerView;
}

-(void)awakeFromNib{
    //在这里就表示CZCarHeaderview已经从xib中创建好了
    
}
@end
