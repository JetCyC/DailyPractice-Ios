//
//  CZCarCell.h
//  dailypractice-ios
//
//  Created by 曹延昌 on 2019/1/19.
//  Copyright © 2019年 曹延昌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CZCar.h"

@interface CZCarCell : UITableViewCell
@property(nonatomic,strong) CZCar *czCars;
+(instancetype) carCellWithTableView:(UITableView *)tableView;
@end
