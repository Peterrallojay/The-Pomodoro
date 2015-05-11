//
//  Timer.m
//  The-Pomodoro-iOS8
//
//  Created by Austin Mecham on 5/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Timer.h"

@interface Timer()
@property (nonatomic) BOOL isOn;

@end

@implementation Timer


//decrease second void method


+ (instancetype)sharedInstance {
    
    static Timer *timer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timer = [Timer new];
    });

    return timer;
}

-(void)startTimer {
    
    self.isOn = YES;
    //[self checkActive];
    
    
}

-(void)endTimer {
    
    self.isOn = NO;
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    //Instructions unclear on sending TimerCompletionNotification
    
    
    
    
}
@end
