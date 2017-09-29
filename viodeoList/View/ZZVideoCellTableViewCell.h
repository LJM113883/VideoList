//
//  ZZVideoCellTableViewCell.h
//  viodeoList
//
//  Created by gupo on 2017/9/29.
//  Copyright © 2017年 person. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZZVideoCellDelegate;


@interface ZZVideoCellTableViewCell : UITableViewCell
///播放占位图
@property (weak, nonatomic) IBOutlet UIImageView *converImg;
///课程标题
@property (weak, nonatomic) IBOutlet UILabel *courseTitle;
///课程价格
@property (weak, nonatomic) IBOutlet UILabel *coursePrice;
///浏览人数
@property (weak, nonatomic) IBOutlet UIButton *brosCount;

@property (nonatomic ,weak) id<ZZVideoCellDelegate> delegate;

+(ZZVideoCellTableViewCell*)loadCell;

-(void)configData:(id)data;
@end


@protocol ZZVideoCellDelegate<NSObject>

- (void)cellConverImgClick:(UITableViewCell*)cel data:(id)data;

@end
