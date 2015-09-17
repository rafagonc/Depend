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

@implementation DPInjector


+(void)load {
    [super load];
    for (DPInjectionDescriptor *desc in [DPCache injectClasses]) {
        [self swizzleGetters:desc];
    }
}

+(void)swizzleGetters:(DPInjectionDescriptor *)desc {
    for (NSString *s in desc.propertiesNames) {
        SEL getterSelector = NSSelectorFromString(s);
        Method getterMethod = class_getInstanceMethod(desc.injectClass, getterSelector);
        class_replaceMethod(desc.injectClass, getterSelector, (IMP)returnInjectedValue, method_getTypeEncoding(getterMethod));
    }
}


id returnInjectedValue(id self, SEL _cmd) {
    NSString *propertyName = NSStringFromSelector(_cmd);
    DPInjectionDescriptor *injectionDescriptor = [DPCache descriptorWithClass:[self class] andPropertyName:propertyName];
    [self setValue:[[NSObject alloc] init] forKey:propertyName];
    return [[NSObject alloc] init];
}

@end
