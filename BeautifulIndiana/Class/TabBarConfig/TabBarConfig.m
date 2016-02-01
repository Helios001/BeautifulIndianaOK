//
//  TabBarConfig.m
//  BeautifulIndiana
//
//  Created by Helios on 16/2/1.
//  Copyright © 2016年 Helios. All rights reserved.
//

#import "TabBarConfig.h"

//View Controllers
#import "YFIndianaViewController.h"
#import "YFLatestAnnouncementViewController.h"
#import "YFDiscoveryViewController.h"
#import "YFShoppingViewController.h"
#import "YFPersonalCenterViewController.h"


@interface TabBarConfig ()

@property (nonatomic, readwrite, strong) CYLTabBarController *tabBarController;

@end

@implementation TabBarConfig

/**
 *  lazy load tabBarController
 *
 *  @return CYLTabBarController
 */
- (CYLTabBarController *)tabBarController {
    
    if (_tabBarController == nil) {
        
        YFIndianaViewController *indianaController = [[YFIndianaViewController alloc] init];
        UIViewController *indianaNavigationController = [[UINavigationController alloc]
                                                       initWithRootViewController:indianaController];
        
        YFLatestAnnouncementViewController *latestAnnouncementController = [[YFLatestAnnouncementViewController alloc] init];
        UIViewController *latestAnnouncementNavigationController = [[UINavigationController alloc]
                                                        initWithRootViewController:latestAnnouncementController];
        
        YFDiscoveryViewController *discoveryController = [[YFDiscoveryViewController alloc] init];
        UIViewController *discoveryNavigationController = [[UINavigationController alloc]
                                                       initWithRootViewController:discoveryController];
        
        YFShoppingViewController *shoppingController = [[YFShoppingViewController alloc] init];
        UIViewController *shoppingNavigationController = [[UINavigationController alloc]
                                                        initWithRootViewController:shoppingController];
        
        YFPersonalCenterViewController *personalCenterController = [[YFPersonalCenterViewController alloc] init];
        UIViewController *personalCenterNavigationController = [[UINavigationController alloc]
                                                        initWithRootViewController:personalCenterController];
        CYLTabBarController *myTabBarController = [[CYLTabBarController alloc] init];
        _tabBarController = myTabBarController;
        
        /*
         *
         在`-setViewControllers:`之前设置TabBar的属性，设置TabBarItem的属性，包括 title、Image、selectedImage。
         *
         */
        [self setUpTabBarItemsAttributesForController:myTabBarController];
        
        [myTabBarController setViewControllers:@[
                                                 indianaNavigationController,
                                                 latestAnnouncementNavigationController,
                                                 discoveryNavigationController,
                                                 shoppingNavigationController,
                                                 personalCenterNavigationController
                                                 ]];

        /**
         *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性
         */
        [[self class] customizeTabBarAppearance];
        
    }
    
    return _tabBarController;
}

/**
 *
 *   在`-setViewControllers:`之前设置TabBar的属性，设置TabBarItem的属性，包括 title、Image、selectedImage。
 *
 **/
- (void)setUpTabBarItemsAttributesForController:(CYLTabBarController *)tabBarController {
    
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"夺宝",
                            CYLTabBarItemImage : @"indiana_normal",
                            CYLTabBarItemSelectedImage : @"indiana_checked",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"最新揭晓",
                            CYLTabBarItemImage : @"latestAnnouncement_normal",
                            CYLTabBarItemSelectedImage : @"latestAnnouncement_checked",
                            };
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"发现",
                            CYLTabBarItemImage : @"discovery_normal",
                            CYLTabBarItemSelectedImage : @"discovery_checked",
                            };
    NSDictionary *dict4 = @{
                            CYLTabBarItemTitle : @"购物车",
                            CYLTabBarItemImage : @"shopping_normal",
                            CYLTabBarItemSelectedImage : @"shopping_checked"
                            };
    NSDictionary *dict5 = @{
                            CYLTabBarItemTitle : @"个人中心",
                            CYLTabBarItemImage : @"personalCenter_normal",
                            CYLTabBarItemSelectedImage : @"personalCenter_checked"
                            };
    NSArray *tabBarItemsAttributes = @[
                                       dict1,
                                       dict2,
                                       dict3,
                                       dict4,
                                       dict5
                                       ];
    
    tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
}

/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性
 */
+ (void)customizeTabBarAppearance {
    
    // 去除 TabBar 自带的顶部阴影
    // [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    // NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    // normalAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:255/255.0 green:81/255.0 blue:81/255.0 alpha:1.0];
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    // [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    // [[UITabBar appearance] setSelectionIndicatorImage:[self imageFromColor:[UIColor colorWithRed:26 / 255.0 green:163 / 255.0 blue:133 / 255.0 alpha:1] forSize:CGSizeMake([UIScreen mainScreen].bounds.size.width / 5.0f, 49) withCornerRadius:0]];
    
    // set the bar background color
    // 设置背景图片
    // UITabBar *tabBarAppearance = [UITabBar appearance];
    // [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tabbar_background_ios7"]];
}

+ (UIImage *)imageFromColor:(UIColor *)color forSize:(CGSize)size withCornerRadius:(CGFloat)radius {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    UIGraphicsBeginImageContext(size);
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];
    // Draw your image
    [image drawInRect:rect];
    
    // Get the image, here setting the UIImageView image
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    return image;
}



@end
