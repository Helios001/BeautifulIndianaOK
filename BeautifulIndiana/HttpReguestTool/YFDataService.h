//
//  YFDataService.h
//  BeautifulIndiana
//  类描述:
//  Created by Helios on 16/2/1.
//  Copyright © 2016年 Helios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
#import "YFNetworkRequest.h"

@interface YFDataService : NSObject

/**
 GET请求转模型
 */
+ (void)getWithUrl:(NSString *)url param:(id)param modelClass:(Class)modelClass responseBlock:(responseBlock)responseDataBlock;

/**
 POST请求转模型
 */
+ (void)postWithUrl:(NSString *)url param:(id)param modelClass:(Class)modelClass responseBlock:(responseBlock)responseDataBlock;

/**
 数组、字典转模型，提供给子类的接口
 */
+ (id)modelTransformationWithResponseObj:(id)responseObj modelClass:(Class)modelClass;

@end
