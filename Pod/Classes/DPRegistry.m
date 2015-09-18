//
//  DPRegistry.m
//  Depend
//
//  Created by Rafael Gonzalves on 9/17/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import "DPRegistry.h"
#import <objc/runtime.h>
#import "DPImplementationKey.h"

@interface DPRegistry ()

@property (nonatomic,strong) NSMutableDictionary *mRegistrations;

@end

@implementation DPRegistry

#pragma mark - constructor
-(instancetype)init {
    if (self = [super init]) {
        self.mRegistrations = [[NSMutableDictionary alloc] init];
    } return self;
}

#pragma mark - singleton
+(DPRegistry *)sharedRegistry {
    static DPRegistry *reg;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        reg = [[self alloc] init];
    });
    return reg;
}

#pragma mark - getters
-(NSDictionary *)registrations {
    return [self.mRegistrations copy];
}

#pragma mark - retrieve
-(id)implementationForProtocol:(NSString *)protocolName andContext:(NSString *)context {
    DPImplementationKey * key = [[DPImplementationKey alloc] initWithProtocolName:protocolName andContext:context];
    id imp = [self.mRegistrations objectForKey:key];
    if (class_isMetaClass(object_getClass(imp))) {
        return [[(Class)imp alloc] init];
    } else {
        return imp;
    }
}

#pragma mark - add
-(void)registerImplementation:(id)imp forProtocol:(Protocol *)protocol context:(NSString *)context {
    NSAssert(imp != nil, @"Implementation cannot be nil, it needs to be a class (will be instantiated with default constructor or a instance");
    NSAssert(protocol != nil, @"Protocol cannot be nil when adding an implementation to the registry");
    DPImplementationKey *desc = [[DPImplementationKey alloc] initWithProtocolName:NSStringFromProtocol(protocol) andContext:context];
    [self.mRegistrations setObject:imp forKey:desc];
}

@end
