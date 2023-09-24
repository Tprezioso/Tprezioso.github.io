---
title: "How to Make a Launch Screen in SwiftUI"
date: 2021-05-08 00:00
tags: Swift, SwiftUI
---
# How to Make a Launch Screen in SwiftUI
In this post we are going to look at how we can implement a launch screen in our SwiftUI project. In the past we would usually have to use a storyboard or XIB file to make our launch screens. In SwiftUI, we can now use the **Info.plist** to make our launch screen.

Let us get started by first navigating to our **Info.plist** file and towards the bottom we should see a **"Launch Screen"** area in our plist.

![](/images/Screen-Shot-2021-05-06-at-7.02.08-PM.png)

If we click the little plus button next to where it says **"Dictionary"** we should see a list of options popup.

![](/images/Screen-Shot-2021-05-06-at-7.05.44-PM.png)

1. **Background color:** Here we can set the color of the launch screens background
2. **Image name:** Here we can set an image to our launch screen at the images size / resolution
3. **Image respects safe area insets:** This is a bool where we can allow the image to respect or exceed the safe area of the screen
4. **Show navigation bar:** This is a bool where we can display a mock up of a Navigation bar
5. **Show Tab bar:** This is a bool where we can display a mock up of a Tab bar
6. **Show Toolbar:** This is a bool where we can display a mock up of a tool bar

In this example we are only going to add an image to our launch screen. To do this we will click on the **"Image Name"** option. This will add an image name property to our plist with a blank string. We will leave this blank for now but we will soon fill it in with our image name.

Next we will need to add an image to our **Assets.xcassets** file. Once we have dragged and dropped an image into our **Assets.xcassets** file, we will now copy the image name and paste it into the string area of **"Launch Screen**" "**Image Name"** back in our plist.

![](/images/Screen-Shot-2021-05-07-at-6.51.18-PM-1-1024x210.png)

![](/images/Screen-Shot-2021-05-07-at-6.51.59-PM-1.png)

As you can see in the images above we added an image named **"144"** to our projects assets file. We then set that image in our **Info.plist** to be our launch screen image (_Don't ever name an image with a number_ 🤢). Now if we go and run our app we should see a quick glimpse of our launch screen image before the app loads.

![](/images/Simulator-Screen-Shot-iPhone-12-Pro-2021-05-07-at-19.01.03-473x1024.png)

That is all you need to make a launch screen in SwiftUI! This is just another example of how SwiftUI makes developers lives that much easier.

Hope this helps you on your next SwiftUI project!

Thanks for reading and Happy coding 🚀📱 🚀📱
