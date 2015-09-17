//
//  DPCache.m
//  Depend
//
//  Created by Rafael Gonzalves on 9/16/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import "DPCache.h"
#import <objc/runtime.h>
#import "DPInjectionDescriptor.h"

@implementation DPCache

#pragma mark - get injectable classes
+(NSDictionary *)injectClasses {
    static NSMutableDictionary *injectClasses;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        injectClasses = [[NSMutableDictionary alloc] init];
        unsigned int class_count = objc_getClassList(NULL, 0);
        Class * classes = (Class *)calloc(class_count, sizeof(Class));
        objc_getClassList(classes, class_count);
        for (int i = 0; i < class_count; i++) {
            @autoreleasepool {
                Class class = classes[i];
                [DPCache shouldBeInjected:class withResult:^(DPInjectionDescriptor *descriptor) {
                    [injectClasses setObject:descriptor forKey:NSStringFromClass(class)];
                }];
            }
        }
    });
    return [injectClasses copy];
}
+(void)shouldBeInjected:(Class)class withResult:(void(^)(DPInjectionDescriptor *descriptor))result {
    unsigned int property_count;
    objc_property_t *properties = class_copyPropertyList(class, &property_count);
    DPInjectionDescriptor *desc = [[DPInjectionDescriptor alloc] initWithClass:class];
    for (int i = 0; i < property_count; i++) {
        const char * attr = property_getAttributes(properties[i]);
        NSString *attrString = [NSString stringWithCString:attr encoding:NSUTF8StringEncoding];
        if ([attrString rangeOfString:@"injected"].location != NSNotFound) {
            [desc addProperty:properties[i]];
        }
    }
    if (desc.properties.count) result(desc);
}

#pragma mark - retrieving
+(DPInjectionDescriptor *)descriptorWithClass:(Class)c {
    return [DPCache injectClasses][NSStringFromClass(c)];
}

@end
