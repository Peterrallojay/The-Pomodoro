//
//  Timer.h
//  The-Pomodoro-iOS8
//
//  Created by Austin Mecham on 5/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const SecondTickNotification = @"secondTickNotification";
static NSString *const TimerCompleteNotification = @"timerCompleteNotification";
static NSString *const NewRoundNotification = @"newRoundNotification";


@interface Timer : NSObject
@property (assign, nonatomic) NSInteger minutes;
@property (assign, nonatomic) NSInteger seconds;

+ (Timer *)sharedInstance;

- (void)startTimer;
- (void)cancelTimer;
- (void)endTimer;

@end
