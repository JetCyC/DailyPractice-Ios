//
//  CZCar.m
//  UiTableView
//
//  Created by 曹延昌 on 2019/1/7.
//  Copyright © 2019年 曹延昌. All rights reserved.
//

#import "CZCar.h"

@implementation CZCar
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)carWithDict:(NSDictionary *)dict{
    
    return [[self alloc] initWithDict:dict];
}
@end
