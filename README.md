codepath-facebook-navigation
============================

####How many hours did it take to complete?  
~ 10 hours  


####Which required and optional stories have you completed?  
#####Completed
######Login Page
- Tapping in the UITextField repositions the elements, as shown in the screenshots.
- Tapping anywhere dismisses the keyboard
- If email and password field are both blank, button should be disabled.
- Password field should be secure with no autocorrection.
- After tapping log in button, show the loading indicator in the button. After a 2 second delay, check the password.
	- If the password is 'password', transition to the next screen.
	- If the password is anything else, display the password error alert.

######News Feed
- Immediately after launch, display the loading indicator.
- After 2 seconds, show the feed, which is a long image in a scrollable view.
- Navigation bar should have the search button and messages button.
- Tapping a profile picture should push a profile page.

######More
- Add a scrollable view of the "More" page. 
- Upon tapping Log Out, return to the login screen.
- Add a UIRefreshControl for a pull to refresh.
- After a pull to refresh, delay for 2 seconds before ending.
	- Every other time, display an error message.
 

####GIF
![alt tag](https://raw.githubusercontent.com/jxrlee/codepath-facebook-navigation/master/facebook.gif)
