//
//  EXInjectedSubclass.m
//  Depend
//
//  Created by Rafael Gonzalves on 10/27/15.
//  Copyright © 2015 Rafael Gonçalves. All rights reserved.
//

#import "EXInjectedSubclass.h"

@implementation EXInjectedSubclass

-(instancetype)init {
    if (self = [super init]) {
        NSLog(@"%@",self.anotherObject);
    } return self;
}


@end
