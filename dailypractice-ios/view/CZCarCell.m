//
//  CZCarCell.m
//  dailypractice-ios
//
//  Created by 曹延昌 on 2019/1/19.
//  Copyright © 2019年 曹延昌. All rights reserved.
//

#import "CZCarCell.h"
#import "CZCar.h"
#define nameFont [UIFont systemFontOfSize:10]

@interface CZCarCell()
@property (strong, nonatomic) IBOutlet UIImageView *imageview;
@property (strong, nonatomic) IBOutlet UILabel *labelOne;

@property (strong, nonatomic) IBOutlet UILabel *labelTwo;

@property (strong, nonatomic) IBOutlet UILabel *labelThree;


@property (nonatomic,weak) UIImageView *imageVV;
@property (nonatomic,weak) UILabel *lb01;
@property (nonatomic,weak) UILabel *lb02;
@property (nonatomic,weak) UILabel *lb03;

@end


@implementation CZCarCell


//通过xib的方式创建view
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

//通过initWithStyle frame的方式创建view   重写initWithStyle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        //创建控件4个控件
        UIImageView *imgViewIcon=[[UIImageView alloc] init];
        [self.contentView addSubview:imgViewIcon];
        self.imageVV=imgViewIcon;
        
        UILabel *lb01=  [[UILabel alloc] init];
        [self.contentView addSubview:lb01];
        self.lb01=lb01;
        
        UILabel *lb02=[[UILabel alloc] init];
        [self.contentView addSubview:lb02];
        self.lb02=lb02;
        
        UILabel *lb03=[[UILabel alloc] init];
        [self.contentView addSubview:lb03];
        self.lb03=lb03;
        
    }
    return self;
}

//设置数据
-(void)setCzCars:(CZCar *)czCars{
    _czCars=czCars;
    [self settingData];
    [self settingFrame];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//设置坐标
-(void)settingFrame{
    CGFloat margin = 10;
    //1
    CGFloat iconW=35;
    CGFloat iconH=35;
    CGFloat iconX=margin;
    CGFloat iconY=margin;
    self.imageVV.frame=CGRectMake(iconX, iconY, iconW, iconH);
    //2
    NSString *lb01Name=self.lb01.text;
    CGFloat lb01X=CGRectGetMaxX(self.imageVV.frame)+margin;
    //根据label中文字的内容，来动态计算label的文字的尺寸
    CGSize lb01Size=[self sizeWithText:lb01Name andMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) andFont:nameFont];
    
    CGFloat nameW=lb01Size.width+20;
    CGFloat nameH=lb01Size.height+20;
    
    self.lb01.frame=CGRectMake(lb01X, margin, nameW, nameH);
    
    //3
    
    
    //4
}

//设置属性
-(void)settingData{
    //设置属性
    self.imageVV.image=  [UIImage imageNamed:_czCars.icon];
    
//    if([_czCars.name isEqualToString:@"C1"]){
//        //self.lb01.text=@"改变了C1";
//        self.lb01.hidden=NO;
//    }else{
//        self.lb01.hidden=YES;
    self.lb01.text=_czCars.name;
   // }
    self.lb02.text=[NSString stringWithFormat:@" ¥ %@",_czCars.name];
    self.lb03.text=[NSString stringWithFormat:@"%@ 人已购买",_czCars.name];
}

//根据给定的字符串，最大值的size，给定的字体
-(CGSize)sizeWithText:(NSString *)text andMaxSize:(CGSize) maxSize andFont:(UIFont *)font{
    NSDictionary *arr=@{NSFontAttributeName :font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:arr context:nil].size;
}

@end
