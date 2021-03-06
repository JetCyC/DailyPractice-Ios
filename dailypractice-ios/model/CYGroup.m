//
//  CYGroup.m
//  UiTableView
//
//  Created by 曹延昌 on 2019/1/7.
//  Copyright © 2019年 曹延昌. All rights reserved.
//

#import "CYGroup.h"
#import "CZCar.h"

@implementation CYGroup
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
        //创建一个用来保存模型的数组
        NSMutableArray *arrayModels=[NSMutableArray array];
        //字典转模型
        for(NSDictionary *item_dict in dict[@"cars"]){
            CZCar *model=[CZCar carWithDict:item_dict];
            [arrayModels addObject:model];
        }
        self.cars=arrayModels;
    }
    return self;
}

+(instancetype)groupWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
