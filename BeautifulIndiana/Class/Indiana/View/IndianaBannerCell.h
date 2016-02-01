//
//  IndianaHeadCell.h
//  BeautifulIndiana
//  类描述:夺宝头横幅Cell
//  Created by Helios on 16/2/1.
//  Copyright © 2016年 Helios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"

typedef void(^BannerClick)(NSInteger bannerIndex);

@interface IndianaBannerCell : BaseTableViewCell

@property(nonatomic,copy) BannerClick bannerClick;

-(void)bannerClickMethod:(BannerClick)bannerClick;

@end
