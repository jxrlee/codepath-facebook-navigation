//
//  AuthenticationViewController.m
//  facebook-navigation
//
//  Created by Joseph Lee on 6/10/14.
//  Copyright (c) 2014 mn8. All rights reserved.
//

#import "AuthenticationViewController.h"

@interface AuthenticationViewController ()


@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIImageView *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)onTap:(id)sender;
- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;
- (IBAction)onLoginButton:(id)sender;
- (BOOL)authenticate:(NSString *)username :(NSString *)password;
- (IBAction)authEdit:(id)sender;



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
    // Do any additional setup after loading the view from its nib.
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
    
    // start spinner
    
    // check username and password
    
    
    
}

- (BOOL)authenticate:(NSString *)username :(NSString *)password {
    // username filled AND password is 'password'
    if (username.length > 0 && [password isEqualToString:@"password"]) {
        return 1;
    } else {
        return 0;
    }
}

- (IBAction)authEdit:(id)sender {
    
    // check if user and password fields are filled
    if (self.usernameTextField.text.length > 0 && self.passwordTextField.text.length > 0) {
        // change to enabled login button
        UIImage *image = [UIImage imageNamed: @"logging_in_button.png"];
        [self.loginButton setImage:image];
    } else {
        // change to disabled login button
        UIImage *image = [UIImage imageNamed: @"login_button_disabled.png"];
        [self.loginButton setImage:image];
    }

}





@end
