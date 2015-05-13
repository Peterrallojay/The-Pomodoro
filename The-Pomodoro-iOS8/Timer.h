//
//  Timer.h
//  The-Pomodoro-iOS8
//
//  Created by Austin Mecham on 5/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

static NSString *const SecondTickNotification = @"secondTickNotification";
static NSString *const TimerCompleteNotificiation = @"timerCompleteNotification";
static NSString *const NewRoundNotification = @"newRoundNotification";
static NSString *const expirationDate = @"expireDate";


@interface Timer : NSObject

@property (assign, nonatomic) NSInteger minutes;
@property (assign, nonatomic) NSInteger seconds;


- (void)startTimer;
- (void)cancelTimer;
- (void)endTimer;
- (void)prepareForBackground;
- (void)loadFromBackground;


+ (instancetype)sharedInstance;

@end
