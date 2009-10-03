//
//  PowerHourAppDelegate.h
//  PowerHour
//
//  Created by Jose on 4/27/09.
//  Copyright IMT 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PowerHourViewController;
@class PHMainMenuController;

@interface PowerHourAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PowerHourViewController *phViewController;
	PHMainMenuController *phMainMenuController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PowerHourViewController *phViewController;
@property (nonatomic, retain) IBOutlet PHMainMenuController *phMainMenuController;

@end

