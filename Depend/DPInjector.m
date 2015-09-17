//
//  Depend.m
//  Depend
//
//  Created by Rafael Gonzalves on 9/16/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import "DPInjector.h"
#import "DPCache.h"
#import "DPInjectionDescriptor.h"
#import "DPInjectionPropertyDescriptor.h"
#import "DPRegistry.h"

@implementation DPInjector

#pragma mark - load
+(void)inject {
    [super load];
    for (NSString *classesNames in [DPCache injectClasses]) {
        [self swizzleGetters:[DPCache injectClasses][classesNames]];
    }
}

#pragma mark - swizzling
+(void)swizzleGetters:(DPInjectionDescriptor *)desc {
    for (NSString *s in desc.propertiesNames) {
        SEL getterSelector = NSSelectorFromString(s);
        Method getterMethod = class_getInstanceMethod(desc.injectClass, getterSelector);
        class_replaceMethod(desc.injectClass, getterSelector, (IMP)returnInjectedValue, method_getTypeEncoding(getterMethod));
    }
}

#pragma mark - generic getter method
id returnInjectedValue(id self, SEL _cmd) {
    DPInjectionDescriptor *injectionDescriptor = [DPCache descriptorWithClass:[self class]];
    DPInjectionPropertyDescriptor *propertyDescriptor = [injectionDescriptor propertyDescriptorForSelector:_cmd];
    const char *key = [propertyDescriptor.propertyName cStringUsingEncoding:NSUTF8StringEncoding];
    id injectedObject = objc_getAssociatedObject(self, key);
    if (injectedObject == nil) {
        objc_setAssociatedObject(self, key, [[DPRegistry sharedRegistry] implementationForProtocol:propertyDescriptor.protocolName andContext:propertyDescriptor.context] , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(self, key);
}

@end
