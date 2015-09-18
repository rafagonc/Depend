//
//  DPInjectionPropertyDescriptor.m
//  Depend
//
//  Created by Rafael Gonzalves on 9/16/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import "DPInjectionPropertyDescriptor.h"

@interface DPInjectionPropertyDescriptor ()

@property (nonatomic,assign) objc_property_t property;

@end

@implementation DPInjectionPropertyDescriptor

#pragma mark - constructor
-(instancetype)initWithProperty:(objc_property_t)property {
    if (self = [super init]) {
        _property = property;
    } return self;
}

#pragma mark - getters
-(NSString *)propertyName {
    return [NSString stringWithCString:property_getName(self.property) encoding:NSUTF8StringEncoding];
}
-(SEL)injectionSelector {
    return NSSelectorFromString([self findInPropertyAttributesRegularExpressionFirstMatch:@"injected.*?(?=,)"]);
}
-(NSString *)protocolName {
    return [[self findInPropertyAttributesRegularExpressionFirstMatch:@"(?=<).*?(?=>)"] stringByReplacingOccurrencesOfString:@"<" withString:@""]; //im not an expert in regex;
}
-(NSString *)context {
    NSString *selector = NSStringFromSelector([self injectionSelector]);
    NSArray *separateContext = [selector componentsSeparatedByString:@"_"];
    return separateContext.count < 2 ? nil : [[separateContext objectAtIndex:1] stringByReplacingOccurrencesOfString:@":" withString:@""];
}

#pragma mark - helper
-(NSString *)findInPropertyAttributesRegularExpressionFirstMatch:(NSString *)pattern {
    NSError *error;
    NSString *attr = [NSString stringWithCString:property_getAttributes(self.property) encoding:NSUTF8StringEncoding];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    NSAssert(error == nil, error.localizedDescription);
    NSTextCheckingResult *result = [regex firstMatchInString:attr options:NSMatchingReportCompletion range:NSMakeRange(0, attr.length)];
    return [attr substringWithRange:result.range];
}

@end
