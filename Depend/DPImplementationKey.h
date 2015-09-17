//
//  DPImplementation.h
//  Depend
//
//  Created by Rafael Gonzalves on 9/17/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPImplementationKey : NSObject <NSCopying>

#pragma mark - constructor
-(instancetype)initWithProtocolName:(NSString *)protocolName andContext:(NSString *)context;

#pragma mark - properties
@property (nonatomic,  copy, readonly) NSString * context;
@property (nonatomic,strong, readonly) NSString * protocolName;



@end
