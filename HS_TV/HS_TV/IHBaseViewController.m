//
//  IHBaseViewController.m
//  HS_TV
//
//  Created by iURCoder on 12/13/15.
//  Copyright © 2015 iUR. All rights reserved.
//

#import "IHBaseViewController.h"

@interface IHBaseViewController ()

@end

@implementation IHBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setTitleView:(UIView*)titleView
{
    self.navigationItem.titleView = titleView;
}
- (void)setTitle:(NSString*)title font:(UIFont*)font fontColor:(UIColor*)color
{
    UILabel* laber = [[UILabel alloc] init];
    laber.text = title;
    laber.textAlignment = NSTextAlignmentCenter;
    laber.font = font;
    laber.textColor = color;
    [laber sizeToFit];
    [self setTitleView:laber];
}

- (void)setAttributedTitle:(NSString *)title color:(UIColor *)color range:(NSRange)range
{
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:title];
    [AttributedStr addAttribute:NSForegroundColorAttributeName
                          value:color
                          range:range];
    UILabel* laber = [[UILabel alloc] init];
    laber.font = [UIFont systemFontOfSize:16];
    laber.frame = CGRectMake(0, 0, 100, 30);
    laber.textAlignment = NSTextAlignmentCenter;
    laber.attributedText = AttributedStr;
    [laber sizeToFit];
    [self setTitleView:laber];
}

@end
