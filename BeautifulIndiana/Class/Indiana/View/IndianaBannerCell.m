//
//  IndianaHeadCell.m
//  BeautifulIndiana
//  类描述:夺宝头横幅Cell
//  Created by Helios on 16/2/1.
//  Copyright © 2016年 Helios. All rights reserved.
//

#import "IndianaBannerCell.h"
#import "SDCycleScrollView.h"

@interface IndianaBannerCell() <SDCycleScrollViewDelegate>

@end

@implementation IndianaBannerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        // 本地加载 --- 创建不带标题的图片轮播器
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 150) shouldInfiniteLoop:YES imageNamesGroup:[NSArray array]];
        cycleScrollView.delegate = self;
        cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        [self.contentView addSubview:cycleScrollView];
        //         --- 轮播时间间隔，默认1.0秒，可自定义
        //cycleScrollView.autoScrollTimeInterval = 4.0;
    }
    return self;
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"---点击了第%ld张图片", (long)index);
    if (self.bannerClick != nil) {
        self.bannerClick(index);
    }
}

#pragma mark Block
-(void)bannerClickMethod:(BannerClick)bannerClick{
    self.bannerClick = bannerClick;
}



@end
