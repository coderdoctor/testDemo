//
//  HeadView.m
//  demo
//
//  Created by iURCoder on 12/11/15.
//  Copyright © 2015 mac2. All rights reserved.
//

#import "HeadView.h"
#import "WFLoopShowView.h"

@interface HeadView ()<WFLoopShowViewDelegate>
@property (nonatomic, strong) WFLoopShowView     * bannerView;

@end

@implementation HeadView

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self addSubview:self.bannerView];
    NSArray *titles = @[@"煎饼侠 － 拯救不开心限时免费",
                        @"大嘴飙电影 － 《谍中谍5》",
                        @"大嘴飙电影 － 《港囧》越玩越嗨"];
    [self.bannerView loadImage:@[@"banner_1.jpg",@"banner_2.jpg",@"banner_3.jpg"] titltData:titles];
}

- (WFLoopShowView *)bannerView
{
    if (!_bannerView) {
        _bannerView = [[WFLoopShowView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Width*9/16)];
        _bannerView.loopShowViewDelegate = self;
        [_bannerView setAnimationDuration:5];
    }
    return _bannerView;
}

- (void)loopSHowView:(WFLoopShowView *)loopShowView didTapAtIndex:(NSInteger)index
{
    NSLog(@"点击滑动");
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"backToHeadView" object:nil];
}

@end
