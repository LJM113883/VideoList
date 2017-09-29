//
//  videoModel.h
//  viodeoList
//
//  Created by gupo on 2017/9/29.
//  Copyright © 2017年 person. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface videoModel : NSObject
///显示图片
@property (nonatomic, copy) NSString *cover;
///MP4地址
@property (nonatomic, copy) NSString *mp4_url;
///标题
@property (nonatomic, copy) NSString *title;
///价格
@property (nonatomic, copy) NSString *price;
///浏览的人数
@property (nonatomic, copy) NSString *borsCount;
@end
