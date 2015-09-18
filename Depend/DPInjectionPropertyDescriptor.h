//
//  DPInjectionPropertyDescriptor.h
//  Depend
//
//  Created by Rafael Gonzalves on 9/16/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

/**
 *  The purprose of this class is to extract
 *  information from the objc_property_t
 *  type into useful data.
 */
@interface DPInjectionPropertyDescriptor : NSObject

#pragma mark - constructor
/**
 *  Constructor recieving a runtime property 
 *  declaration that are consumed by the 
 *  readonly properties
 */
-(instancetype)initWithProperty:(objc_property_t)property;

#pragma mark - properties
/**
 *  Property name or the selector (same thing)
 */
@property (nonatomic,readonly) NSString * propertyName;
/**
 *  the selector specigied in the setter=
 *  when the injection is declared!
 */
@property (nonatomic,readonly) SEL injectionSelector;
/**
 *  The context specified after the _ (underline)
 *  in the setter= injection selector.
 */
@property (nonatomic,readonly) NSString * context;
/**
 *  The protocol name that the property conforms too.
 */
@property (nonatomic,readonly) NSString * protocolName;


@end
