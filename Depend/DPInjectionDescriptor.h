//
//  DPClassInjectionDescriptor.h
//  Depend
//
//  Created by Rafael Gonzalves on 9/16/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface DPInjectionDescriptor : NSObject

#pragma mark - constructor
-(instancetype)initWithClass:(__unsafe_unretained Class)c;

#pragma mark - properties
@property (nonatomic,unsafe_unretained) Class injectClass;
@property (nonatomic,strong)            NSArray *propertyNames;

#pragma mark - adding
-(void)addProperty:(objc_property_t)property;
 
@end
