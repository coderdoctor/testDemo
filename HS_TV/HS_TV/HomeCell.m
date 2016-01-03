//
//  HomeCell.m
//  HS_TV
//
//  Created by iURCoder on 12/13/15.
//  Copyright © 2015 iUR. All rights reserved.
//

#import "HomeCell.h"

@interface HomeCell ()

@property (nonatomic, weak) IBOutlet UIImageView * image;
@property (nonatomic, weak) IBOutlet UILabel     * title;
@property (nonatomic, weak) IBOutlet UILabel     * subTitle;

@end

@implementation HomeCell

- (void)loadCellWithData:(NSDictionary *)dic
{
    self.image.image   = [UIImage imageNamed:dic[@"image"]];
    self.title.text    = dic[@"titlt"];
    self.subTitle.text = dic[@"subtitle"];
}

@end
