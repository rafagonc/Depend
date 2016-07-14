//
//  DPImplementationValue.m
//  Depend
//
//  Created by Banco Santander Brasil on 7/14/16.
//  Copyright © 2016 Rafael Gonçalves. All rights reserved.
//

#import "DPImplementationValue.h"

@implementation DPImplementationValue

#pragma mark - constructor
-(instancetype)initWithImp:(id)imp andIsSingleton:(BOOL)isSingleton {
    if (self = [super init]) {
        _imp = imp;
        _isSingleton = isSingleton;
    } return self;
}

@end
