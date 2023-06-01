---
date: 2019-12-14 00:00
title: "How to know when a user is having a first time launch of your iOS app?"
tags: Swift
---
# How to know when a user is having a first time launch of your iOS app?

The first time launch in an application is important for displaying things like tutorials to teach the user how to use your application or showing terms and service agreements. The problem is how do you know when was the users first time launching your app. For the best way to implement this we will need to head over to the AppDelegate.swift file. Then we will need to create a global variable outside of the AppDelegate methods like this.

var firstTimeLaunch: Bool!

Now that we have our global boolean, we will need to use the UserDefaults class to set and store the firstTimeLaunch boolean. We do this so we know if the use has launched the app before. Inside of the didFinishLaunchingWithOption method add the following code.

firstTimeLaunch = UserDefaults.standard.bool(forKey: "firstTimeLaunch")

// Check for first time launch of app
if (firstTimeLaunch) {
    firstTimeLaunch = true
} else {
    UserDefaults.standard.set(true, forKey: "firstTimeLaunch")
}

Above we are just making a simple check to see if it is the first time the user is opening the app. Then we are storing the boolean value in UserDefaults class so that on a relaunch of the app the bool will be read from memory if the user has open the app before. Also we will setup a function in the AppDelegate to set our boolean if firstTimeLaunch has happen. Add this code below to your Appdelegate.

func firstTimeLaunchHasAlreadyLaunched(){
    firstTimeLaunch = true
}

Now go back into your main ViewController file we are using at launch and we are going to make an instance of AppDelegate.

let appDelegate = UIApplication.shared.delegate as! AppDelegate

Then we will use the the viewDidAppear method and setup our check for if a first time launch of the app has occurred.

override func viewDidAppear(\_ animated: Bool) {
     if(!appDelegate.firstTimeLaunch){
     
          //set firstTimeLaunchHasAlreadyLaunched to false
          appDelegate.firstTimeLaunchHasAlreadyLaunched()

// Below display the view you want on the first time in app below 
          /\* 
             Code here
                       \*/
    }
}

Now if you let your code run, in your app you should see the view you want to display on the first time launch of your app. When you close the simulator and run it again the view will no longer appear. Its as simple as that! Happy Swift Programming 👨🏻‍💻!
