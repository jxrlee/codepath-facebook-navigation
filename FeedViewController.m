//
//  FeedViewController.m
//  facebook-navigation
//
//  Created by Joseph Lee on 6/10/14.
//  Copyright (c) 2014 mn8. All rights reserved.
//

#import "FeedViewController.h"
#import "MoreViewController.h"

@interface FeedViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;
- (IBAction)onStatusButton:(id)sender;
- (IBAction)onMoreButton:(id)sender;

@end

@implementation FeedViewController

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
    
    // add search and message buttons
    /*UIImage *searchIcon = [UIImage imageNamed:@"search"];
    UIButton *searchButton = [[UIButton alloc] init];
    searchButton.frame = CGRectMake(10, 10, 22, 22);
    [searchButton setImage:searchIcon forState:(UIControlStateNormal)];
    [navigationController addSubview:searchButton];*/
    
    [self loadingSpinner];
    [self performSelector:@selector(loadFeed) withObject:nil afterDelay:2];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadingSpinner {
    
    [self.loadingIndicator startAnimating];
    
}

- (void)loadFeed {
    
    [self.loadingIndicator stopAnimating];
    
    CGRect feedSize = CGRectMake(0, 108, 320, 416);
    UIScrollView *newsfeed = [[UIScrollView alloc] initWithFrame:(feedSize)];
    
    // create newsfeed image view
    UIImageView *newsfeedImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"feed.png"]];
    
    // change width of frame
    CGRect frame = newsfeedImage.frame;
    frame.size.width = 320;
    newsfeedImage.frame = frame;
    
    // aspect fit image
    newsfeedImage.contentMode = UIViewContentModeScaleAspectFit;
    //newsfeedImage.contentMode = UIViewContentModeTop;
    
    // add subviews
    [newsfeed addSubview:newsfeedImage];
    [self.view addSubview:newsfeed];
    
    newsfeed.contentSize = newsfeedImage.frame.size;
}

- (IBAction)onStatusButton:(id)sender {
    
}

- (IBAction)onMoreButton:(id)sender {
    
    // load more view
    MoreViewController *vc = [[MoreViewController alloc] init];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    // load navigation controller
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    
    UIColor *blue = [UIColor colorWithRed:(58.0/255.0) green:(86.0/255.0) blue:(154.0/255.0) alpha:(1.0)];
    [[UINavigationBar appearance] setBarTintColor:blue];
    //navigationController.navigationBar.translucent = NO;
    navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    vc.title = @"More";

    
    
    [self presentViewController:navigationController animated:YES completion:nil];
    
}

@end
