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
    Class class = [self class];
    DPInjectionDescriptor *injectionDescriptor = [DPCache descriptorWithClass:[self class]];
    DPInjectionPropertyDescriptor *propertyDescriptor = [injectionDescriptor propertyDescriptorForSelector:_cmd];
    while (propertyDescriptor == nil) {
        class = class_getSuperclass(class);
        injectionDescriptor = [DPCache descriptorWithClass:class];
        propertyDescriptor = [injectionDescriptor propertyDescriptorForSelector:_cmd];
        if (class_isMetaClass([NSObject class])) break;
    }
    id injectedObject = objc_getAssociatedObject(self, _cmd);
    if (injectedObject == nil) {
        objc_setAssociatedObject(self, _cmd, [[DPRegistry sharedRegistry] implementationForProtocol:propertyDescriptor.protocolName andContext:propertyDescriptor.context] , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(self, _cmd);
}

@end
