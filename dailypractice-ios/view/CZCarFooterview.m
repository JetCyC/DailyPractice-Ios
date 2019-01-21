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

+ (instancetype)footerView{
    CZCarFooterview *footerView=[[[NSBundle mainBundle] loadNibNamed:@"CZCarFooterview" owner:nil options:nil] lastObject];
    return footerView;
    
}

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
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //调用代理实现功能
        if ([self.delegate respondsToSelector:@selector(footerViewUpdateData:)]) {
            [self.delegate footerViewUpdateData:self];
        }
        self.bt_loadMore.hidden=NO;
        self.view_loding.hidden=YES;
    });
    
    //3，增加一条数据
    //4，刷新uitableview
    
}
@end
