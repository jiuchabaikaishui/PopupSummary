//
//  SectionModel.m
//  PopupSummary
//
//  Created by 綦 on 16/10/20.
//  Copyright © 2016年 PowesunHolding. All rights reserved.
//

#import "SectionModel.h"

@implementation SectionModel

+ (instancetype)sectionModelWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        if (dic) {
            self.title = dic[@"title"];
            NSMutableArray *items = [NSMutableArray arrayWithCapacity:1];
            ItemModel *itemModel;
            for (NSDictionary *itemDic in dic[@"items"]) {
                itemModel = [ItemModel itemModelWithDic:itemDic];
                [items addObject:itemModel];
            }
            self.items = items;
        }
    }
    
    return self;
}

@end
