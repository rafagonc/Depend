//
//  DPCache.m
//  Depend
//
//  Created by Rafael Gonzalves on 9/16/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import "DPCache.h"
#import <objc/runtime.h>

static NSMutableArray *injectClasses;

@implementation DPCache

+(void)load {
    injectClasses = [[NSMutableArray alloc] init];
    unsigned int class_count = objc_getClassList(NULL, 0);
    Class * classes = (Class *)calloc(class_count, sizeof(Class));
    objc_getClassList(classes, class_count);
    for (int i = 0; i < class_count; i++) {
        @autoreleasepool {
            Class class = classes[i];
            if ([DPCache shouldBeInjected:class]) {
                [injectClasses addObject:class];
            }
        }
    }
}
+(BOOL)shouldBeInjected:(Class)class {
    unsigned int property_count;
    objc_property_t *properties = class_copyPropertyList(class, &property_count);
    for (int i = 0; i < property_count; i++) {
        const char * attr = property_getAttributes(properties[i]);
        NSString *attrString = [NSString stringWithCString:attr encoding:NSUTF8StringEncoding];
        if ([attrString rangeOfString:@"injected"].location != NSNotFound) {
            return YES;
        }
    }
    return NO;
}

@end
