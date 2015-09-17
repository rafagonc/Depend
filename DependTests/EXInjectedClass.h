//
//  InjectedExampleClass.h
//  Depend
//
//  Created by Rafael Gonzalves on 9/17/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EXProtocol.h"

@interface EXInjectedClass : NSObject

@property (setter=injected:,readonly) id<EXProtocol> object;
@property (setter=injected_another:,readonly) id<EXProtocol> anotherObject;


@end
