//
//  DPInjectionPropertyDescriptor.m
//  Depend
//
//  Created by Rafael Gonzalves on 9/16/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import "DPInjectionPropertyDescriptor.h"

@interface DPInjectionPropertyDescriptor ()

@property (nonatomic,assign) objc_property_t property;

@end

@implementation DPInjectionPropertyDescriptor

#pragma mark - constructor
-(instancetype)initWithProperty:(objc_property_t)property {
    if (self = [super init]) {
        self.property = property;
    } return self;
}

#pragma mark - getters
-(NSString *)propertyName {
    return [NSString stringWithCString:property_getName(self.property) encoding:NSUTF8StringEncoding];
}

@end
