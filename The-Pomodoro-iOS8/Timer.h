//
//  Timer.h
//  The-Pomodoro-iOS8
//
//  Created by Austin Mecham on 5/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const SecondTickNotification = @"secondTickNotification";
static NSString *const TimerCompleteNotificiation = @"timerCompleteNotification";
static NSString *const NewRoundNotification = @"newRoundNotification";


@interface Timer : NSObject
@property (nonatomic) NSInteger minutes;
@property (nonatomic) NSInteger seconds;


- (void)startTimer;
- (void)cancelTimer;
- (void)endTimer;


+ (instancetype)sharedInstance;

@end
