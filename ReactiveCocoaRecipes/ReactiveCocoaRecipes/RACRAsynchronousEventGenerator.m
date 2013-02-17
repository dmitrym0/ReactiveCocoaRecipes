//
//  RACRAsynchronousEventGenerator.m
//  ReactiveCocoaRecipes
//
//  Created by Dmitry M on 2013-02-17.
//  Copyright (c) 2013 Dmitry M. All rights reserved.
//

#import "RACRAsynchronousEventGenerator.h"
@interface RACRAsynchronousEventGenerator ( )
@property (assign, nonatomic) NSUInteger numberOfEventsToGenerate;
@property (assign, nonatomic) NSTimeInterval delay;
@property (strong, nonatomic) NSTimer* timer;
@property (assign, nonatomic) NSUInteger internalValue; // the value we'll return
@end


@implementation RACRAsynchronousEventGenerator

- (id)init
{
    return [self initWithNumberOfEventsToGenerate:3 andDelayBetweenEvents:1];
}
            
-(id) initWithNumberOfEventsToGenerate:(NSUInteger) numberOfEventsToGenerate andDelayBetweenEvents:(NSTimeInterval) delay {
    self = [super init];
    if (self) {
        _numberOfEventsToGenerate = numberOfEventsToGenerate;
        _delay = delay;
        _timer = [NSTimer scheduledTimerWithTimeInterval:_delay
                                                  target:self
                                                selector:@selector(timerFired)
                                                userInfo:nil
                                                 repeats:YES];
        DLog(@"Created an event generator that will generate %ld events, ever %f seconds.", _numberOfEventsToGenerate, _delay);
        
    }
    return self;
    
}

-(void) timerFired
{
    self.numberOfEventsToGenerate--;
    self.internalValue++;
    
    NSString* value = [NSString stringWithFormat:@"%ld", self.internalValue];
    
    if (self.numberOfEventsToGenerate == 0)
    {
        [self.timer invalidate];
        if (self.completed)
            self.completed(value);
    } else {
        if (self.next)
            self.next(value);
    }
}

@end
