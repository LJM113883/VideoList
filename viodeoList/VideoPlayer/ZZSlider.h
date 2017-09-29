//
//  ZZSlider.h
//  viodeoList
//
//  Created by gupo on 2017/9/29.
//  Copyright © 2017年 person. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZZSlider;

typedef void (^SliderValueChangeBlock) (ZZSlider *slider);
typedef void (^SliderFinishChangeBlock) (ZZSlider *slider);
typedef void (^DraggingSliderBlock) (ZZSlider *slider);

@interface ZZSlider : UIView

@property (nonatomic, assign) CGFloat value;        /* From 0 to 1 */
@property (nonatomic, assign) CGFloat middleValue;  /* From 0 to 1 */

@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) CGFloat sliderDiameter;
@property (nonatomic, strong) UIColor *sliderColor;
@property (nonatomic, strong) UIColor *maxColor;
@property (nonatomic, strong) UIColor *middleColor;
@property (nonatomic, strong) UIColor *minColor;

@property (nonatomic, copy) SliderValueChangeBlock valueChangeBlock;
@property (nonatomic, copy) SliderFinishChangeBlock finishChangeBlock;
@property (nonatomic, strong) DraggingSliderBlock draggingSliderBlock;

@end
