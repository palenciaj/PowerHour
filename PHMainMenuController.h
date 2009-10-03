#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "PowerHourMediaPlayerController.h"

@interface PHMainMenuController : UIViewController {
	PowerHourMediaPlayerController *playlistController;
    IBOutlet UITableView *playlistTable;
}
- (IBAction)playButtonPressed:(id)sender;
- (IBAction)play:(id)sender;

@property (nonatomic, retain) PowerHourMediaPlayerController *playlistController;

@end
