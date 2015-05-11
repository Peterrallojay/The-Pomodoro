//
//  Timer.h
//  The-Pomodoro-iOS8
//
//  Created by Austin Mecham on 5/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const SecondTickNotification;
static NSString *const TimerCompleteNotificiation;
static NSString *const NewRoundNotification;


@interface Timer : NSObject
@property (nonatomic) NSUInteger *minutes;
@property (nonatomic) NSUInteger *seconds;


- (void)startTimer;
+ (instancetype)sharedInstance;

@end
