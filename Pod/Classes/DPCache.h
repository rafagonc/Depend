//
//  DPCache.h
//  Depend
//
//  Created by Rafael Gonzalves on 9/16/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DPInjectionDescriptor;

@interface DPCache : NSObject
/**
 *  Create or just return and dictionary with
 *  injectable class names as keys and DPInjectionDescriptor
 *  as values. It is inside an dispatch_once so its done
 *  just one time. Class that are detected as injectable has
 *  a property with setter=inject[Anything]_[context].
 *
 *  @return an dictionary with injectable classes.
 *  @see DPInjectionDescriptor
 */
+(NSDictionary *)injectClasses;
/**
 *  Gets from the dictionary the DPInjectionDescriptor
 *  for the injectable class.
 *
 *  @return injection descriptor.
 *  @see DPInjectionDescriptor
 */
+(DPInjectionDescriptor *)descriptorWithClass:(Class)c;

@end
