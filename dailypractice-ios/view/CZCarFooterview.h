//
//  CZCarFooterview.h
//  dailypractice-ios
//
//  Created by 曹延昌 on 2019/1/20.
//  Copyright © 2019年 曹延昌. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZCarFooterview;
//协议
@protocol CZCarFooterViewDelegate<NSObject,UIScrollViewDelegate>
@required
-(void)footerViewUpdateData:(CZCarFooterview *)footerView;
@end

@interface CZCarFooterview : UITableViewCell
@property(nonatomic,weak)id<CZCarFooterViewDelegate> delegate;
@end
