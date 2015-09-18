//
//  Depend.h
//  Depend
//
//  Created by Rafael Gonzalves on 9/16/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPInjector : NSObject
/**
 *  Swizzle all getter methods for injectable 
 *  properties, you should call this on
 *  application:didFinishLauchingWithOptions:
 *  on app delegate. Properties that are injected
 *  get the getter IMP replaces with a generic
 *  get/set with association objects. This is the only
 *  way that the framework don't require any calls from
 *  injectable classes
 *
 *  @see Method Swizzling
 */
+(void)inject;

@end
