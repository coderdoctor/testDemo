//
//  IHNavigationController.m
//  HS_TV
//
//  Created by iURCoder on 12/13/15.
//  Copyright © 2015 iUR. All rights reserved.
//

#import "IHNavigationController.h"
#import "HomeViewController.h"

@interface IHNavigationController ()

@end

@implementation IHNavigationController

+(void)initialize{
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:HEX_RGB(0x333333)};
    [[UIBarButtonItem appearance] setTitleTextAttributes:attributes forState:UIControlStateNormal];
    UIImage *backButtonImage = [[UIImage imageNamed:@"arrow-back"] imageWithAlignmentRectInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    backButtonImage = [backButtonImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [[UINavigationBar appearance] setBackIndicatorImage:backButtonImage];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:backButtonImage];
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    //    [[UINavigationBar appearance] setShadowImage:[UIImage imageWithColor:HEX_RGB(0xff666666) size:CGSizeMake(1/ScreenScale, 1/ScreenScale)]];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    [UINavigationBar appearance].layer.opacity = 1;
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlackOpaque];
    [[UINavigationBar appearance] setBarTintColor:HEX_RGB(0xffffff
                                                          )];
}

- (instancetype)init
{
    HomeViewController * homeScene = [[HomeViewController alloc] init];
    self = [super initWithRootViewController:homeScene];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.translucent = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
