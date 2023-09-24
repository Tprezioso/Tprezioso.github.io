---
title: "What are Life Cycle Methods in Swift"
date: 2020-05-21 00:00
tags: Swift
---
# What are Life Cycle Methods in Swift

In Swift our view controllers have life cycle methods. Knowing your apps life cycle is really important for developers to understand how there app works. In this post we are going to run through all the life cycle methods we should know about when developing in iOS.

**loadView:** This method loads or creates a view and assigns it to the `[view](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621460-view)` property_._ This method is most commonly used if you are creating your view controllers programmatically.

**viewDidLoad:** This is called one time in a view controllers life cycle when the view controller is initially created. It gets called when the content view is created in memory. Some common use cases for this method would be to make network calls, set up user interface, or anything that needs to be called once when the view has been loaded.

**viewWillAppear:** This is called before the content view is added to the view hierarchy in your app. This means that this is called just before the view shows up on screen. This method will also be called every time the view is going to appear on screen. This is the main difference between viewDidLoad. You can override viewWillAppear to display custom views and animation like hiding fields or disable actions before the view is visible to the user.

**viewDidAppear:** This is called right after the view appears on screen. This method is good to use for taking care of things like saving data to core data or starting animations.

**viewWillDisappear:** This is called right before the view is removed from the screen. Things that are usually handled in this method are saving changes in the app. A example of this is having a form for the user to sign up to your app. Let's imagine our user was half way done filling out the form and then the user leaves the app. In viewWillDisappear we can save the users inputs before leaving the app so progress isn't lost.

**viewDidDisappear:** This is called after all view controllers views have been removed from the view hierarchy. We can use this to stop listening to device sensors or stop listening for any notifications.

**viewWillLayoutSubviews:** This is called when the content views bounds change but before it lays out its subviews. A example of this is when the bounds change when we rotate the device from portrait to landscape. This always us to layout any customization before the rotation happens.

**viewDidLayoutSubviews:** Similar to **viewWillLayoutSubviews**, this method is called when the content views bounds change but after it lays out its subviews.

These are the main life cycle method you should know when programming in swift. Knowing when and how to use these methods can help in solving error for when the app should do a particular task. Below is an image for you to try and visualize the flow of the life cycle methods when being used in an app.

![](/images/167c0-https3a2f2fcdn-images-1.medium.com2fmax2f16002f1jb1y17gwqcri2xcky7_qhq.png)

I hope this helps to shed some light on how and when to use a particular life cycle method in swift.

🚴‍♂️ Happy coding 🚴‍♂️
