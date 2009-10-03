//
//  PowerHourView.h
//  PowerHour
//
//  Created by Jose on 4/28/09.
//  Copyright 2009 IMT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "PowerHourViewController.h"

@class PowerHourViewController;

@interface PowerHourView : UIView {
	PowerHourViewController *phViewController;
	UIImageView *shotglassBeer;
	
	NSThread *minuteTimerThread;
	NSThread *emptyThread;
	
	UILabel *timerDisplay;
	UILabel *shotsDisplay;
	UILabel *songDisplay;
	CGFloat secondTime;
	
	id phView;
}

@property (nonatomic, assign) IBOutlet PowerHourViewController *phViewController;

@property (nonatomic, retain) NSThread *minuteTimerThread;
@property (nonatomic, retain) NSThread *emptyThread;

@property (nonatomic, retain) UILabel *timerDisplay;
@property (nonatomic, retain) UILabel *shotsDisplay;

- (void) startTimerThread;
- (void) waitForMinuteTimerThreadToFinish;
- (void) stopTimerThread;

- (void) startEmptyThread;
- (void) stopEmptyThread;

@end
