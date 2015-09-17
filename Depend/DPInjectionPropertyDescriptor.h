//
//  DPInjectionPropertyDescriptor.h
//  Depend
//
//  Created by Rafael Gonzalves on 9/16/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface DPInjectionPropertyDescriptor : NSObject

#pragma mark - constructor
-(instancetype)initWithProperty:(objc_property_t)property;

#pragma mark - properties
@property (nonatomic,readonly) NSString * propertyName;
@property (nonatomic,readonly) SEL injectionSelector;
@property (nonatomic,readonly) NSString * context;
@property (nonatomic,readonly) NSString * protocolName;


@end
