//
//  SectionModel.h
//  PopupSummary
//
//  Created by 綦 on 16/10/20.
//  Copyright © 2016年 PowesunHolding. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemModel.h"

@interface SectionModel : NSObject
@property (weak, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray *items;

+ (instancetype)sectionModelWithDic:(NSDictionary *)dic;
- (instancetype)initWithDic:(NSDictionary *)dic;


@end
