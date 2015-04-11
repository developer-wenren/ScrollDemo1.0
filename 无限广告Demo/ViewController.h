//
//  ViewController.h
//  无限广告Demo
//
//  Created by zjsruxxxy3 on 15/4/11.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SuccessBlock)(id json);

typedef void(^FailureBlock)(NSError *error);



@interface ViewController : UIViewController

+(void)postWithUrl:(NSString *)url params:(NSDictionary *)params success:(SuccessBlock)success failure:(void(^)(NSError *error))failure;



@end

