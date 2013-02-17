//
//  main.m
//  ReactiveCocoaRecipes
//
//  Created by Dmitry M on 2013-02-17.
//  Copyright (c) 2013 Dmitry M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RACRAsyncEventGeneratorDemo.h"
#import "RACRScenarioRunner.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSLog(@"Starting main.m...");
        
        RACRScenarioRunner* delegate = [[RACRScenarioRunner alloc] init];
        NSApplication * application = [NSApplication sharedApplication];
        [application setDelegate:delegate];
        [NSApp run];
        
        NSLog(@"main.m done.");
    }
    return 0;
}

