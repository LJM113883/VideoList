//
//  ZZVideoCellTableViewCell.m
//  viodeoList
//
//  Created by gupo on 2017/9/29.
//  Copyright © 2017年 person. All rights reserved.
//

#import "ZZVideoCellTableViewCell.h"

@implementation ZZVideoCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.converImg.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClicl:)];
    [self.converImg addGestureRecognizer:tap];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
///加载cell
+(ZZVideoCellTableViewCell *)loadCell{
    ZZVideoCellTableViewCell *cel = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    return cel;
}
-(void)configData:(id)data{
    
}
///播放开始
- (void)tapClicl:(id)sender {
    
    if (_delegate && [_delegate respondsToSelector:@selector(cellConverImgClick:data:)]) {
        [_delegate cellConverImgClick:self data:nil];
    }
}

@end
