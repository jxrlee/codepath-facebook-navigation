//
//  ProfileViewController.m
//  facebook-navigation
//
//  Created by Joseph Lee on 6/14/14.
//  Copyright (c) 2014 mn8. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

- (IBAction)onMoreButton:(id)sender;

@end

@implementation ProfileViewController

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
    
    NSLog(@"Profile loaded");
    
    [super viewDidLoad];

    self.navigationItem.title = @"Wayne Mak";
    [self.navigationItem.backBarButtonItem setAction:@selector(onBackButton:)];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onMoreButton:(id)sender {
    
    NSLog(@"More clicked");
    
}

- (void) onBackButton:(id)sender {
    
    // add search and message buttons
    /*UIImage *searchIcon = [UIImage imageNamed:@"search"];
    UIButton *searchButton = [[UIButton alloc] init];
    searchButton.frame = CGRectMake(10, 30, 22, 22);
    searchButton.adjustsImageWhenHighlighted = NO;
    [searchButton setImage:searchIcon forState:(UIControlStateNormal)];
    searchButton.tag = 1;
    [self.navigationController.view addSubview:searchButton];*/
    
}

@end
