//
//  CZCarFooterview.m
//  dailypractice-ios
//
//  Created by 曹延昌 on 2019/1/20.
//  Copyright © 2019年 曹延昌. All rights reserved.
//

#import "CZCarFooterview.h"

@interface CZCarFooterview()

@property (weak, nonatomic) IBOutlet UIButton *bt_loadMore;
@property (weak, nonatomic) IBOutlet UIView *view_loding;
- (IBAction)btnLoadMoreClick:(id)sender;

@end

@implementation CZCarFooterview

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}
//加载更多按钮
- (IBAction)btnLoadMoreClick:(id)sender {
    //1，隐藏加载更多按钮
    self.bt_loadMore.hidden=YES;
    //2，显示等待指示器所在的那个UIview
    self.view_loding.hidden=NO;
    //调用代理实现功能
    if ([self.delegate respondsToSelector:@selector(footerViewUpdateData:)]) {
        [self.delegate footerViewUpdateData:self];
    }
    //3，增加一条数据
    //4，刷新uitableview
    
}
@end
