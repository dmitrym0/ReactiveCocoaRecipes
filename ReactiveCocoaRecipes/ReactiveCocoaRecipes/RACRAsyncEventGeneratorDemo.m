//
//  RACRAsyncEventGeneratorDemo.m
//  ReactiveCocoaRecipes
//
//  Created by Dmitry M on 2013-02-17.
//  Copyright (c) 2013 Dmitry M. All rights reserved.
//

#import "RACRAsyncEventGeneratorDemo.h"
#import "RACRAsynchronousEventGenerator.h"

@implementation RACRAsyncEventGeneratorDemo
-(void) run {
    DLog(@"Starting %s", object_getClassName(self));
    RACRAsynchronousEventGenerator* generator = [[RACRAsynchronousEventGenerator alloc] init];
    
    __block NSUInteger counter = 0;
    
    generator.next = ^(id value) {
        DLog(@"Value: %@", value);
        counter++;
    };
    
    generator.completed = ^(id value) {
        counter++;
        DLog(@"Completed: %@", value);
        NSAssert(counter == 3, @"Expecting counter to be 3!");
    };
}
@end
