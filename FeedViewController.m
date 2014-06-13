//
//  FeedViewController.m
//  facebook-navigation
//
//  Created by Joseph Lee on 6/10/14.
//  Copyright (c) 2014 mn8. All rights reserved.
//

#import "FeedViewController.h"

@interface FeedViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;

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
    CGRect feedSize = CGRectMake(0, 44, 320, 416);
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

@end
