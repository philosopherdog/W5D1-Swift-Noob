//
//  Person.h
//  Interop
//
//  Created by steve on 2017-10-01.
//  Copyright © 2017 steve. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, copy, nonnull) NSString *name;
@property (nonatomic, nonnull) NSNumber *age;
@end
