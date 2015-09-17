//
//  InjectedExampleClass.m
//  Depend
//
//  Created by Rafael Gonzalves on 9/17/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import "EXInjectedClass.h"

@implementation EXInjectedClass

-(instancetype)init {
    if (self = [super init]) {
        NSLog(@"%@",_object);
        NSLog(@"%@",self.object);
        NSLog(@"%@",_object);
    } return self;
}

@end
