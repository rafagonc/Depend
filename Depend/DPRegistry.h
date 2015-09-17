//
//  DPRegistry.h
//  Depend
//
//  Created by Rafael Gonzalves on 9/17/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPRegistry : NSObject

#pragma mark - singleton
+(DPRegistry *)sharedRegistry;

#pragma mark - properties
@property (nonatomic,readonly) NSDictionary *registrations;

#pragma mark - methods
-(void)addImplementation:(id)imp forProtocol:(Protocol *)protocol context:(NSString *)context;

#pragma mark - retrieve
-(id)implementationForProtocol:(NSString *)protocolName andContext:(NSString *)context;

@end
