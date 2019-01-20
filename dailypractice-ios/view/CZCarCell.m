//
//  CZCarCell.m
//  dailypractice-ios
//
//  Created by 曹延昌 on 2019/1/19.
//  Copyright © 2019年 曹延昌. All rights reserved.
//

#import "CZCarCell.h"
#import "CZCar.h"

@interface CZCarCell()
@property (strong, nonatomic) IBOutlet UIImageView *imageview;
@property (strong, nonatomic) IBOutlet UILabel *labelOne;

@property (strong, nonatomic) IBOutlet UILabel *labelTwo;

@property (strong, nonatomic) IBOutlet UILabel *labelThree;

@end


@implementation CZCarCell

+ (instancetype)carCellWithTableView:(UITableView *)tableView{
    static NSString *ID=@"car_cell";
    //2.2根据重用id去缓存池中获取对应的cell对象
    CZCarCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    //2.3如果没有获取到，那么就创建一个
    if (cell==nil) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"CZCarCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

-(void)setCzCars:(CZCar *)czCars{
    _czCars=czCars;
    //这只属性
    self.imageView.image=[UIImage imageNamed:czCars.icon];
    self.labelOne.text=czCars.name;
    self.labelTwo.text=[NSString stringWithFormat:@" ¥ %@",czCars.name];
    self.labelThree.text=[NSString stringWithFormat:@"%@ 人已购买",czCars.name];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
