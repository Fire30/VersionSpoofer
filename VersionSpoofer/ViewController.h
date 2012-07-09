//ViewController.m

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
}

//Button Action


- (IBAction)changeWord:(id)sender;

- (IBAction)PressedDonate:(id)sender;

//Outlet Label
//Outlet TextField
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *VerTextField;

@property (unsafe_unretained, nonatomic) IBOutlet UITextField *BuildTextField;

@property (unsafe_unretained, nonatomic) IBOutlet UILabel *CurrentVerLabel;

@property (unsafe_unretained, nonatomic) IBOutlet UILabel *CurrentBuildLabel;


@end