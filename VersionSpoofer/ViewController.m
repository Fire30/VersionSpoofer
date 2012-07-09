#import "ViewController.h"

@implementation ViewController;
@synthesize VerTextField;
@synthesize BuildTextField;
@synthesize CurrentVerLabel;
@synthesize CurrentBuildLabel;



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    VerTextField.delegate = self;
    BuildTextField.delegate = self;
    
    NSString *filePath = @"/System/Library/CoreServices/SystemVersion.plist";
    NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    
    NSString *vervalue;
    vervalue = [plistDict objectForKey:@"ProductVersion"];
    
    NSString *buildvalue;
    buildvalue = [plistDict objectForKey:@"ProductBuildVersion"];
    
    NSString *CurrentVerMessage = [[NSString alloc]initWithFormat:@"Current System Version =  %@",vervalue];
    NSString *CurrentBuildMessage = [[NSString alloc]initWithFormat:@"Current Build Version =  %@",buildvalue];
    
    [CurrentVerLabel setText:CurrentVerMessage];
    [CurrentBuildLabel setText:CurrentBuildMessage];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
    initWithTarget:self
    action:@selector(dismissKeyboard)];
    
    tap.numberOfTapsRequired = 2;
    
    [self.view addGestureRecognizer:tap];
    
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setVerTextField:nil];
    [self setBuildTextField:nil];
    [self setCurrentVerLabel:nil];
    [self setCurrentBuildLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)changeWord:(id)sender {
  
    NSString *Nullstring = @"";
    
    if([VerTextField.text isEqualToString:Nullstring] || [BuildTextField.text isEqualToString:Nullstring])
    {
        UIAlertView *dog = [[UIAlertView alloc]initWithTitle:@"Erorr"
        message:@"You Did Not Fill in a System and/or Build Version!"
        delegate:nil
        cancelButtonTitle:@"Okay"
        otherButtonTitles: nil];
        [dog show];
    }
    
    else{
        
    
    NSString *hax = [[NSString alloc]initWithFormat:@"Device System Version Spoofed To %@ \n Device Build Version Spoofed To %@",[VerTextField text], [BuildTextField text]];
    UIAlertView *myAlert = [[UIAlertView alloc]initWithTitle:@"Finished"
                                                     message:hax
                                                    delegate:nil
                                           cancelButtonTitle:@"Okay"
                                           otherButtonTitles: nil];
    
    NSString *filePath = @"/System/Library/CoreServices/SystemVersion.plist";
    NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    
    [plistDict setValue:[VerTextField text] forKey:@"ProductVersion"];
    [plistDict writeToFile:filePath atomically: YES];
    
    [plistDict setValue:[BuildTextField text] forKey:@"ProductBuildVersion"];
    [plistDict writeToFile:filePath atomically: YES];
    
    [myAlert show];
    
    [VerTextField resignFirstResponder];//Dismiss the Keyboard
}
}

- (IBAction)PressedDonate:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=tjcorley30%40hotmail%2ecom&lc=US&item_name=Fire30&item_number=Tweaks&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donateCC_LG%2egif%3aNonHosted"]];    
}

-(void)dismissKeyboard {
    [VerTextField resignFirstResponder];
    [BuildTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [VerTextField resignFirstResponder];
    [BuildTextField resignFirstResponder];
    
    return YES;
}
@end