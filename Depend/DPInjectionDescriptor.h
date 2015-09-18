//
//  DPClassInjectionDescriptor.h
//  Depend
//
//  Created by Rafael Gonzalves on 9/16/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@class DPInjectionPropertyDescriptor;

/**
 *  Injection descriptions describes every injectable property
 *  , selectors, protocols associated with the injection.
 */
@interface DPInjectionDescriptor : NSObject

#pragma mark - constructor
/**
 *  Construct an descriptor based on a injectable class.
 */
-(instancetype)initWithClass:(__unsafe_unretained Class)c;

#pragma mark - properties
/**
 *  Injectable Class recognized by DPCache.
 *
 *  @see DPCache
 */
@property (nonatomic,readonly, unsafe_unretained) Class injectClass;
/**
 *  All injectable property names.
 */
@property (nonatomic,readonly) NSArray *propertiesNames;
/**
 *  Contains DPInjectionPropertyDescriptor instances that
 *  knows everything about the injection: selector, context,
 *  protocol.
 *
 *  @see DPInjectionPropertyDescriptor
 */
@property (nonatomic,readonly) NSArray *properties;

#pragma mark - adding
/**
 *  Add a DPInjectionPropertyDescriptor isntance to properties array.
 *
 *  @param property an injectable property recognized by DPCache
 */
-(void)addProperty:(objc_property_t)property;

#pragma mark - retrieving
/**
 *  Search into properties array for the right property descriptor.
 */
-(DPInjectionPropertyDescriptor *)propertyDescriptorForSelector:(SEL)selector;
 
@end
