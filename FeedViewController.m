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

UIRefreshControl *refreshControl;
BOOL refresh_flag = 1;


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
    UIImage *searchIcon = [UIImage imageNamed:@"search"];
    UIButton *searchButton = [[UIButton alloc] init];
    searchButton.frame = CGRectMake(10, 30, 22, 22);
    searchButton.adjustsImageWhenHighlighted = NO;
    [searchButton setImage:searchIcon forState:(UIControlStateNormal)];
    [self.navigationController.view addSubview:searchButton];

    self.navigationItem.title = @"News Feed";
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
    
    
    // add refreshcontrol
    refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(startRefresh) forControlEvents:UIControlEventValueChanged];
    [newsfeed addSubview:refreshControl];
    
    
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

    // replace navcontroller's rootview
    [self.navigationController setViewControllers: [NSArray arrayWithObject: vc]
                                                        animated: NO];
}

- (void)startRefresh {
    
    if(!refresh_flag) {
        NSLog(@"Refresh Fail");
        // show alert
        [self performSelector:@selector(refreshAlert) withObject:nil afterDelay:2];
    } else {
        NSLog(@"Refresh Success");
        // stop refreshing
        [self performSelector:@selector(endRefresh) withObject:nil afterDelay:2];
    }
    
    refresh_flag = !refresh_flag;

}

- (void)refreshAlert {
    
    [refreshControl endRefreshing];
    
    // show alert
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Please Try Again Later" message:@"An error occurred. Please try again in a few minutes." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    [alertView show];
    
}

- (void)endRefresh {
    
    [refreshControl endRefreshing];
    
}

@end
