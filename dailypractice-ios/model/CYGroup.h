//
//  CYGroup.h
//  UiTableView
//
//  Created by 曹延昌 on 2019/1/7.
//  Copyright © 2019年 曹延昌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYGroup : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,strong) NSArray *cars;

-(instancetype) initWithDict:(NSDictionary *)dict;
+(instancetype) groupWithDict:(NSDictionary *)dict;

@end
