//
//  AuthenticationViewController.m
//  facebook-navigation
//
//  Created by Joseph Lee on 6/10/14.
//  Copyright (c) 2014 mn8. All rights reserved.
//

#import "AuthenticationViewController.h"
#import "FeedViewController.h"

@interface AuthenticationViewController ()


@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIImageView *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

- (IBAction)onTap:(id)sender;
- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;
- (IBAction)onLoginButton:(id)sender;


@end

@implementation AuthenticationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        // Register the methods for the keyboard hide/show events
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // preload news feed view
    // load news feed
    FeedViewController *vc = [[FeedViewController alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    
    // dismiss keyboard
    [self.view endEditing:YES];

}

- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the mainView
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.mainView.frame = CGRectMake(
                            0, self.view.frame.size.height - kbSize.height - self.mainView.frame.size.height, self.mainView.frame.size.width, self.mainView.frame.size.height);
                     }
                     completion:nil];
    
    // Move signup button
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.bottomView.frame = CGRectMake(
                            0, self.view.frame.size.height - kbSize.height - self.bottomView.frame.size.height +60, self.bottomView.frame.size.width, self.bottomView.frame.size.height);
                     }
                     completion:nil];

}

- (void)willHideKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the mainView
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.mainView.frame = CGRectMake(0, 0, self.mainView.frame.size.width, self.mainView.frame.size.height);
                     }
                     completion:nil];
    
    // Move signup button
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.bottomView.frame = CGRectMake(
                            0, self.view.frame.size.height - self.bottomView.frame.size.height, self.bottomView.frame.size.width, self.bottomView.frame.size.height);
                     }
                     completion:nil];
}

- (IBAction)onLoginButton:(id)sender {
    
    // change buttonState
    [self startAuth];
    
    // perform authentication
    [self performSelector:@selector(authenticate) withObject:nil afterDelay:2];
    [self performSelector:@selector(stopAuth) withObject:nil afterDelay:2];
    
}

- (BOOL)authenticate {
    
    NSLog(@"Authenticating");
    
    // username filled AND password is 'password'
    if (self.usernameTextField.text.length > 0 && [self.passwordTextField.text isEqualToString:@"password"]) {
        
        [self successfulAuth];
        return 1;
    
    } else {
        
        [self showFailedAuthAlert];
        return 0;
        
    }
    
}

- (void)startAuth {
    
    // check if user and password fields are filled
    if (self.usernameTextField.text.length > 0 && self.passwordTextField.text.length > 0) {
        
        // change to enabled login button
        UIImage *image = [UIImage imageNamed: @"logging_in_button.png"];
        [self.loginButton setImage:image];
        
        // start spinner
        [self.activityIndicator startAnimating];
        
    } else {
        
        // change to disabled login button
        UIImage *image = [UIImage imageNamed: @"login_button_disabled.png"];
        [self.loginButton setImage:image];
        
    }

}

- (void)stopAuth {
    
    // change to disabled login button
    UIImage *image = [UIImage imageNamed: @"login_button_disabled.png"];
    [self.loginButton setImage:image];
    
    // stop spinner
    [self.activityIndicator stopAnimating];
    
}


- (void)showFailedAuthAlert {
    
    NSLog(@"Failed auth");
    
    // show alert
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Password" message:@"The password you entered is incorrect. Please try again." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    [alertView show];
    
}

- (void)successfulAuth {
    
    NSLog(@"Successful auth");
    
    
    
}


@end
