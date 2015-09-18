//
//  DPImplementation.m
//  Depend
//
//  Created by Rafael Gonzalves on 9/17/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import "DPImplementationKey.h"

@interface DPImplementationKey ()


@end

@implementation DPImplementationKey

#pragma mark - constructor
-(instancetype)initWithProtocolName:(NSString *)protocolName andContext:(NSString *)context {
    if (self = [super init]) {
        _protocolName = protocolName;
        _context = context;
    } return self;
}

#pragma mark - equality
-(BOOL)isEqual:(id)object {
    if (object == nil || [object isKindOfClass:[DPImplementationKey class]] == NO) return NO;
    DPImplementationKey *anotherImplementation = (DPImplementationKey *)object;
    if ([self.context isEqualToString:anotherImplementation.context] == NO) {
        if (self.context == nil && anotherImplementation.context == nil) {
            
        } else {
            return NO;
        }
    }
    if ([self.protocolName isEqualToString:anotherImplementation.protocolName] == NO) {
        return NO;
    }
    return YES;
}
-(NSUInteger)hash {
    return self.context.hash ^ self.protocolName.hash;
}

#pragma mark - NSCopying
-(id)copyWithZone:(NSZone *)zone {
    DPImplementationKey *impKey = [[DPImplementationKey alloc] initWithProtocolName:[self.protocolName copy] andContext:[self.context copy]];
    return impKey;
}

@end
