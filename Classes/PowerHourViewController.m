//
//  PowerHourViewController.m
//  PowerHour
//
//  Created by Jose on 4/27/09.
//  Copyright IMT 2009. All rights reserved.
//

#import "PowerHourViewController.h"
#import "PowerHourView.h"
#import "PowerHourMediaPlayerController.h"

@implementation PowerHourViewController

@synthesize powerhourView, phMediaPlayer;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

- (PowerHourViewController *) initWithMediaPlayer:(PowerHourMediaPlayerController *)mediaPlayer {
	if (self = [super init]) {
		self.phMediaPlayer = mediaPlayer;
	}
	return self;
}

- (void)showMediaPlayer {
	
	PowerHourMediaPlayerController *controller = [[PowerHourMediaPlayerController alloc] init];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}

-(void) onTimer {
	count--;
	[powerhourView.timerDisplay setText:[[NSNumber numberWithInt:count] stringValue]];	
	
	if (count == FREQ - 1)
	{
		[powerhourView stopEmptyThread];
		[powerhourView startTimerThread];
	} else if (count == 0)
	{
		[powerhourView stopTimerThread];
		[powerhourView startEmptyThread];
		shotNumber++;
		[powerhourView.shotsDisplay setText:[[NSNumber numberWithInt:shotNumber] stringValue]];
		[phMediaPlayer skip];
		count = FREQ;
	}
	
	
}

- (void)loadView {
	PowerHourView *view = [[PowerHourView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
	view.phViewController = self;
	
	self.view = view;
	self.powerhourView = view;
	count = FREQ;
	[powerhourView.timerDisplay setText:[[NSNumber numberWithInt:FREQ] stringValue]];
	shotNumber = 0;
	
	[view release];
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
	
	[phMediaPlayer play];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

- (void)PowerHourMediaPlayerDidFinish:(PowerHourMediaPlayerController *)controller {
	[self dismissModalViewControllerAnimated:YES];
}

@end
