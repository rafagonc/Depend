//
//  DPImplementationValue.h
//  Depend
//
//  Created by Banco Santander Brasil on 7/14/16.
//  Copyright © 2016 Rafael Gonçalves. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPImplementationValue : NSObject

-(instancetype)initWithImp:(id)imp andIsSingleton:(BOOL)isSingleton;

@property (nonatomic,strong) id imp;
@property (nonatomic,assign) BOOL isSingleton;

@end
