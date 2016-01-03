//
//  UIView+WWFrame.h
//  HS_TV
//
//  Created by iURCoder on 12/13/15.
//  Copyright © 2015 iUR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WWFrame)
// Frame
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

// Frame Origin
@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;

// Frame Size
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

// Frame Borders
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;

// Center Point
#if !IS_IOS_DEVICE
@property (nonatomic) CGPoint center;
#endif
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

// Middle Point
@property (nonatomic, readonly) CGPoint middlePoint;
@property (nonatomic, readonly) CGFloat middleX;
@property (nonatomic, readonly) CGFloat middleY;


+ (id)viewFromNib;
- (void)setCornerRadius:(CGFloat)radius;
- (void)clipRound;
@end
