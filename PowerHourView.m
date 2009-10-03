//
//  PowerHourView.m
//  PowerHour
//
//  Created by Jose on 4/28/09.
//  Copyright 2009 IMT. All rights reserved.
//

#import "PowerHourView.h"
#import "PowerHourViewController.h"

#define TestInterval 59.0
#define EmptyInterval 1.0

@interface PowerHourView ()

@end

// Private interface, methods used only internally
@interface PowerHourView (PrivateMethods)


- (void)resetTimer;
- (void)emptyShotglass;
- (void)startMinuteTimer:(id)info;

@end



@implementation PowerHourView 



@synthesize phViewController, minuteTimerThread, emptyThread, timerDisplay, shotsDisplay;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		
		//init second timer
		phView = self;
		secondTime = 0.0;	
		
		
		// Set up default state
		self.backgroundColor = [UIColor blackColor];
		
        // Set up Front View
		UIImageView *shotglass = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Shotglass.png"]];
		shotglass.center = self.center;
		shotglass.opaque = NO;
		
		// Set up the beer
		shotglassBeer = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Shotglass_beer.png"]];
		CGFloat centerY = shotglass.center.y;
		shotglassBeer.center = CGPointMake(self.center.x, centerY);
		//shotglassBeer.layer.anchorPoint = CGPointMake(0.5, 0.0);
		shotglassBeer.opaque = NO;
		
		//set up black cover area
		UIImageView *blackCover  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blackcover.png"]];
		CGFloat blackY = 470;
		blackCover.center = CGPointMake(self.center.x, blackY);
		
		
		//Set up timer display
		CGFloat timerDisplayWidth = 100.0;
		CGFloat timerDisplayX = self.center.x - (timerDisplayWidth / 2.0)-120.0;
		CGFloat timerDisplayY = 420.0;
		CGFloat timerDisplayHeight = 18.0;
		
		CGRect timerRect = CGRectMake(timerDisplayX, timerDisplayY, timerDisplayWidth, timerDisplayHeight);
		timerDisplay = [[UILabel alloc] initWithFrame:timerRect];
		timerDisplay.font = [UIFont boldSystemFontOfSize:24.0];
		timerDisplay.backgroundColor = [UIColor clearColor];
		timerDisplay.textColor = [UIColor colorWithRed:255.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:1.0];		timerDisplay.textAlignment = UITextAlignmentCenter;
		
		//Set up shot# display
		CGFloat shotsDisplayWidth = 100.0;
		CGFloat shotsDisplayX = self.center.x - (timerDisplayWidth / 2.0)+100.0;
		CGFloat shotsDisplayY = 420.0;
		CGFloat shotsDisplayHeight = 18.0;
		
		CGRect shotsRect = CGRectMake(shotsDisplayX, shotsDisplayY, shotsDisplayWidth, shotsDisplayHeight);
		shotsDisplay = [[UILabel alloc] initWithFrame:shotsRect];
		shotsDisplay.font = [UIFont boldSystemFontOfSize:24.0];
		shotsDisplay.backgroundColor = [UIColor clearColor];
		shotsDisplay.textColor = [UIColor colorWithRed:255.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:1.0];
		shotsDisplay.textAlignment = UITextAlignmentCenter;
		shotsDisplay.text = [NSString stringWithFormat:@"0"];
		
		//Set up song display
		CGFloat songDisplayWidth = 400.0;
		CGFloat songDisplayX = self.center.x - (songDisplayWidth / 2.0);
		CGFloat songDisplayY = 30.0;
		CGFloat songDisplayHeight = 30.0;
		
		CGRect songRect = CGRectMake(songDisplayX, songDisplayY, songDisplayWidth, songDisplayHeight);
		songDisplay = [[UILabel alloc] initWithFrame:songRect];
		songDisplay.font = [UIFont boldSystemFontOfSize:24.0];
		songDisplay.backgroundColor = [UIColor clearColor];
		songDisplay.textColor = [UIColor colorWithRed:255.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:1.0];
		songDisplay.textAlignment = UITextAlignmentCenter;
		songDisplay.text = [NSString stringWithFormat:@"song"];
		
		UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
		infoButton.frame = CGRectMake(256, 432, 44, 44);
		[infoButton addTarget:self action:@selector(showInfo) forControlEvents:UIControlEventTouchUpInside];
		
		
		
		//Add the views in proper order and location
		[self addSubview:shotglassBeer];
		[self addSubview:shotglass];
		[self addSubview:blackCover];
		[self addSubview:timerDisplay];
		[self addSubview:shotsDisplay];
		[self addSubview:songDisplay];
		
		[shotglass release];
		
		[self setNeedsDisplay];
    }
    return self;
}

- (void)animateShotglassFilling {
	
	CABasicAnimation *fillAnimation = [CABasicAnimation animation];
	fillAnimation.keyPath = @"transform.translation.y";
	fillAnimation.fromValue = [NSNumber numberWithFloat:150.0];
	fillAnimation.toValue = [NSNumber numberWithFloat:0.0];
	fillAnimation.duration = TestInterval;
	fillAnimation.removedOnCompletion = NO;
	fillAnimation.fillMode = kCAFillModeBoth;
	fillAnimation.repeatCount = 0;
	fillAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	
	// Add the animation to the selection layer.  this causes it to begin animating
	[shotglassBeer.layer addAnimation:fillAnimation forKey:@"fillEmptyAnimation"];
}

- (void)animateShotglassEmptying {
	CABasicAnimation *emptyAnimation = [CABasicAnimation animation];
	emptyAnimation.keyPath = @"transform.translation.y";
	emptyAnimation.fromValue = [NSNumber numberWithFloat:0.0];
	emptyAnimation.toValue = [NSNumber numberWithFloat:150.0];
	emptyAnimation.duration = EmptyInterval;
	emptyAnimation.removedOnCompletion = NO;
	emptyAnimation.fillMode = kCAFillModeBoth;
	emptyAnimation.repeatCount = 0;
	emptyAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	
	[shotglassBeer.layer addAnimation:emptyAnimation forKey:@"fillEmptyAnimation"];
}

/*

- (void)startFillTimer:(id)info {
	[NSThread setThreadPriority:1.0];
	BOOL continuePlaying = YES:
	
	while (continuePlaying)
	{
		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
		
		[self performSelectorOnMainThread:@selector(animateShotglassFilling) withObject:nil waitUntilDone:NO];
		
		while (continuePlaying &&
		 
	}
}
 */

- (void) updateDisplay:(int) timer: (int) shotCount {
	[timerDisplay setText:[[NSNumber numberWithInt:timer] stringValue]];
	[shotsDisplay setText:[[NSNumber numberWithInt:shotCount] stringValue]];
}

- (void)startMinuteTimer:(id)info {
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	[NSThread setThreadPriority:1.0];
	BOOL continuePlaying = YES;
	
	NSAutoreleasePool *loopPool = [[NSAutoreleasePool alloc] init];
	
	[self performSelectorOnMainThread:@selector(animateShotglassFilling) withObject:nil waitUntilDone:NO];
		//else
		//	[self performSelectorOnMainThread:@selector(animateShotglassEmptying) withObject:nil waitUntilDone:NO];
		
	double interval;
	interval = TestInterval;
		
	NSDate *curtainTime = [[NSDate alloc] initWithTimeIntervalSinceNow:interval];
	NSDate *currentTime = [[NSDate alloc] init];
	NSDate *initTime = [currentTime copy];
				
	while (continuePlaying && ([currentTime compare:curtainTime] != NSOrderedDescending)) { 
		if ([minuteTimerThread isCancelled] == YES) {
			continuePlaying = NO;
			continue;
		}
		
		
		[NSThread sleepForTimeInterval:0.1];
		[currentTime release];
		currentTime = [[NSDate alloc] init];
	}
	[curtainTime release];		
	[currentTime release];
	[initTime release];
	
	[loopPool drain];
	[pool drain];
}

- (void)startEmptyTimerThread:(id) info {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	[NSThread setThreadPriority:1.0];
	BOOL continuePlaying = YES;
	
	while (continuePlaying) {
		NSAutoreleasePool *loopPool = [[NSAutoreleasePool alloc] init];
		

		[self performSelectorOnMainThread:@selector(animateShotglassEmptying) withObject:nil waitUntilDone:NO];
		
		double interval = EmptyInterval;

		
		NSDate *curtainTime = [[NSDate alloc] initWithTimeIntervalSinceNow:interval];
		NSDate *currentTime = [[NSDate alloc] init];
		
		while (continuePlaying && ([currentTime compare:curtainTime] != NSOrderedDescending)) { 
			if ([emptyThread isCancelled] == YES) {
				continuePlaying = NO;
				continue;
			}
			
			[NSThread sleepForTimeInterval:0.1];
			[currentTime release];
			currentTime = [[NSDate alloc] init];
		}
		[curtainTime release];		
		[currentTime release];		
		[loopPool drain];
	}
	[pool drain];
}

- (void)waitForMinuteTimerThreadToFinish {
	while (minuteTimerThread && ![minuteTimerThread isFinished]) {
		[NSThread sleepForTimeInterval:0.1];
	}
}

- (void) waitForEmptyTimerThreadToFinish {
	while (emptyThread && ![emptyThread isFinished])
		[NSThread sleepForTimeInterval:0.1];
}

- (void)stopTimerThread {
	if (minuteTimerThread != nil) {
		[minuteTimerThread cancel];
		[self waitForMinuteTimerThreadToFinish];
		self.minuteTimerThread = nil;
	}
}

- (void)startTimerThread {
	if (minuteTimerThread != nil) {
		[self stopTimerThread];
	}
	
	NSThread *timerThread = [[NSThread alloc] initWithTarget:self selector:@selector(startMinuteTimer:) object:self];
	self.minuteTimerThread = timerThread;
	[timerThread release];
	
	[self.minuteTimerThread start];
}

- (void)stopEmptyThread {
	if (emptyThread != nil) {
		[emptyThread cancel];
		[self waitForEmptyTimerThreadToFinish];
		self.emptyThread = nil;
	}
}

- (void)startEmptyThread {
	if (emptyThread != nil) {
		[self stopEmptyThread];
	}
	
	NSThread *newThread = [[NSThread alloc] initWithTarget:self selector:@selector(startEmptyTimerThread:) object:self];
	self.emptyThread = newThread;
	[newThread release];
	
	[self.emptyThread start];
}

- (void)showInfo
{
	
}

- (void)dealloc {
	[shotglassBeer release];
	[timerDisplay release];
	[shotsDisplay release];
	[songDisplay release];
    [super dealloc];
}


@end
