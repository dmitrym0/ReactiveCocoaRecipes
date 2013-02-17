//
//  RACRSynchronizeTwoAsyncOperations.m
//  ReactiveCocoaRecipes
//
//  Created by Dmitry M on 2013-02-17.
//  Copyright (c) 2013 Dmitry M. All rights reserved.
//

#import "RACRSynchronizeTwoAsyncOperations.h"
#import "RACRAsynchronousEventGenerator.h"

@implementation RACRSynchronizeTwoAsyncOperations
-(void) run
{
    
    RACSubject* generator1Subject = [RACReplaySubject subject];
    RACSubject* generator2Subject = [RACReplaySubject subject];
    
    RACRAsynchronousEventGenerator* generator1 = [[RACRAsynchronousEventGenerator alloc] initWithNumberOfEventsToGenerate:5
                                                                                                    andDelayBetweenEvents:0.5];
    
    RACRAsynchronousEventGenerator* generator2 = [[RACRAsynchronousEventGenerator alloc] initWithNumberOfEventsToGenerate:4
                                                                                                    andDelayBetweenEvents:0.75];
    
    generator1.next = ^(id value) {
        [generator1Subject sendNext:value];
    };
    
    generator1.completed = ^(id value) {
        [generator1Subject sendNext:value];
        [generator1Subject sendCompleted];
    };
    
    
    generator2.next = ^(id value) {
        [generator2Subject sendNext:value];
    };
    
    generator2.completed = ^(id value) {
        [generator2Subject sendNext:value];
        [generator2Subject sendCompleted];
    };

    
    [generator1Subject subscribeNext:^(id x) {
        DLog(@"gen1: Intermediate result: %@", x);
    } completed:^{
        DLog(@"gen1: completed");
    }];

    [generator2Subject subscribeNext:^(id x) {
        DLog(@"gen2: Intermediate result: %@", x);
    } completed:^{
        DLog(@"gen2: completed");
    }];
    
    
    
    [[RACSignal
      merge:@[generator1Subject, generator2Subject]]
     subscribeCompleted:^{
         NSLog(@"They're both done!");
     }];
}
@end
