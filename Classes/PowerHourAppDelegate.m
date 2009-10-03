//
//  PowerHourAppDelegate.m
//  PowerHour
//
//  Created by Jose on 4/27/09.
//  Copyright IMT 2009. All rights reserved.
//

#import "PowerHourAppDelegate.h"
#import "PowerHourViewController.h"
#import "PowerHourView.h"
#import "PHMainMenuController.h"

@implementation PowerHourAppDelegate

@synthesize window;
@synthesize phViewController;
@synthesize phMainMenuController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch
	PHMainMenuController *viewController2 = [[PHMainMenuController alloc] initWithNibName:@"PHMainMenu" bundle:nil];
	self.phMainMenuController = viewController2;
	[viewController2 release];
	
	phMainMenuController.view.frame = [UIScreen mainScreen].applicationFrame;
	[window addSubview:phMainMenuController.view];
	
	[window makeKeyAndVisible];
	
	//phMainMenuController.view.
	/*
	PowerHourViewController *viewController = [[PowerHourViewController alloc] init];
	self.phViewController = viewController;
	[viewController release];
	
	
	phViewController.view.frame = [UIScreen mainScreen].applicationFrame;
	//[window addSubview:phViewController.view];
	
    //[window makeKeyAndVisible];
	 */
}


- (void)dealloc {
    //[phViewController release];
	[phMainMenuController release];
    [window release];
    [super dealloc];
}


@end
