//
//  YFDataService.m
//  BeautifulIndiana
//  类描述:
//  Created by Helios on 16/2/1.
//  Copyright © 2016年 Helios. All rights reserved.
//

#import "YFDataService.h"
#import "AFNetworking.h"

static id dataObj;

@implementation YFDataService

+ (void)getWithUrl:(NSString *)url param:(id)param modelClass:(Class)modelClass responseBlock:(responseBlock)responseDataBlock {
        [YFNetworkRequest getRequest:url params:param success:^(id responseObj) {
        //数组、字典转化为模型数组
           
        dataObj = [self modelTransformationWithResponseObj:responseObj modelClass:modelClass];
        responseDataBlock(dataObj, nil);
        
    } failure:^(NSError *error) {
        
        responseDataBlock(nil, error);
    }];
}

+ (void)postWithUrl:(NSString *)url param:(id)param modelClass:(Class)modelClass responseBlock:(responseBlock)responseDataBlock {
    
       [YFNetworkRequest postRequest:url params:param success:^(id responseObj) {
        
        dataObj = [self modelTransformationWithResponseObj:responseObj modelClass:modelClass];
        responseDataBlock(dataObj, nil);
    } failure:^(NSError *error) {
        
        responseDataBlock(nil, error);
    }];
}

/**
  数组、字典转化为模型
 */
+ (id)modelTransformationWithResponseObj:(id)responseObj modelClass:(Class)modelClass {
        
    return nil;
}



@end
