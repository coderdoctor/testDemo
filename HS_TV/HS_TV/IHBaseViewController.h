//
//  IHBaseViewController.h
//  HS_TV
//
//  Created by iURCoder on 12/13/15.
//  Copyright © 2015 iUR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IHBaseViewController : UIViewController

- (void)setAttributedTitle:(NSString *)title color:(UIColor *)color range:(NSRange)range;

- (void)setTitle:(NSString*)title font:(UIFont*)font fontColor:(UIColor*)color;

@end
