//
//  ItemModel.m
//  PopupSummary
//
//  Created by 綦 on 16/10/20.
//  Copyright © 2016年 PowesunHolding. All rights reserved.
//

#import "ItemModel.h"

@implementation ItemModel

+ (instancetype)itemModelWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        if (dic) {
            self.title = dic[@"title"];
            self.subTitle = dic[@"subTitle"];
            self.option = dic[@"option"];
        }
    }
    
    return self;
}

@end
