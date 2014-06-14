//
//  MoreViewController.m
//  facebook-navigation
//
//  Created by Joseph Lee on 6/13/14.
//  Copyright (c) 2014 mn8. All rights reserved.
//

#import "MoreViewController.h"
#import "FeedViewController.h"
#import "AuthenticationViewController.h"


@interface MoreViewController () <UIActionSheetDelegate>

- (IBAction)onNewsfeedButton:(id)sender;
- (IBAction)onLogoutButton:(id)sender;

@end

@implementation MoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"More";
    [self loadMore];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadMore {
    
    CGRect moreSize = CGRectMake(0, 64, 320, 460);
    UIScrollView *moreView = [[UIScrollView alloc] initWithFrame:(moreSize)];
    
    // create newsfeed image view
    UIImageView *moreImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"more.png"]];
    [moreImage setUserInteractionEnabled:YES];
    
    // change width of frame
    CGRect frame = moreImage.frame;
    frame.size.width = 320;
    moreImage.frame = frame;
    
    // aspect fit image
    moreImage.contentMode = UIViewContentModeScaleAspectFit;
    
    // add logout button
    UIButton *logoutButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 578, 320, 44)];
    [logoutButton addTarget:self action:@selector(onLogoutButton:) forControlEvents:UIControlEventTouchUpInside];
    [moreImage addSubview:logoutButton];
    
    // add subviews
    [moreView addSubview:moreImage];
    [self.view addSubview:moreView];
    
    moreView.contentSize = moreImage.frame.size;
    
}



- (IBAction)onNewsfeedButton:(id)sender {
    
    // load news feed view
    FeedViewController *vc = [[FeedViewController alloc] init];
    
    // replace navcontroller's rootview
    [self.navigationController setViewControllers: [NSArray arrayWithObject: vc]
                                         animated: NO];

}

- (IBAction)onLogoutButton:(id)sender {
    
    NSLog(@"Logout Alert");
    
    UIActionSheet *logoutSheet = [[UIActionSheet alloc] initWithTitle:@"Are you sure you want to log out?"
                                                            delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:@"Log Out"
                                                    otherButtonTitles:nil];
    [logoutSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if  ([buttonTitle isEqualToString:@"Log Out"]) {
        NSLog(@"Log Out Pressed");
        
        AuthenticationViewController *vc = [[AuthenticationViewController alloc] init];
        vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        
        self.view.window.rootViewController = vc;
    }

}

@end
