//
//  MoreViewController.m
//  facebook-navigation
//
//  Created by Joseph Lee on 6/13/14.
//  Copyright (c) 2014 mn8. All rights reserved.
//

#import "MoreViewController.h"
#import "FeedViewController.h"

@interface MoreViewController ()
- (IBAction)onNewsfeedButton:(id)sender;

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
    
    // change width of frame
    CGRect frame = moreImage.frame;
    frame.size.width = 320;
    moreImage.frame = frame;
    
    // aspect fit image
    moreImage.contentMode = UIViewContentModeScaleAspectFit;
    //newsfeedImage.contentMode = UIViewContentModeTop;
    
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
@end
