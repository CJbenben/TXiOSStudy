//
//  CJResponse.h
//  CJHttpRequest
//
//  Created by ChenJie on 16/5/18.
//  Copyright © 2016年 ChenJie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJResponse : NSObject

@property (strong, nonatomic) NSError *error;

@property (assign, nonatomic) NSInteger code;



//@property(strong, nonatomic) NSDictionary *header;
//@property(strong, nonatomic) NSNumber *status;
//@property(strong, nonatomic) NSString *messsage;
//@property(strong, nonatomic) NSDictionary *body;
//@property(strong, nonatomic) NSString *text;

@end
