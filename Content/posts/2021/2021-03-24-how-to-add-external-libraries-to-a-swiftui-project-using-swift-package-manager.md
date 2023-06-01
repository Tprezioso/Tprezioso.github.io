---
title: "How to Add External Libraries to a SwiftUI Project Using Swift Package Manager"
date: 2021-03-24 00:00
tags: Swift, SwiftUI, Swift Package
---
# How to Add External Libraries to a SwiftUI Project Using Swift Package
In this post we are going to look at how we can add a Swift package to our SwiftUI Project. Let's start by going to the [Swift Package Index](http://swiftpackageindex.com) website and searching through the libraries. For this post we are going to use the [SwiftUICharts](https://swiftpackageindex.com/AppPear/ChartView) package to add to our project.

![](/images/Screen-Shot-2021-03-19-at-6.42.32-PM.png)

**SwiftUICharts** is an amazing library that makes it super easy to get beautifully animated charts into your SwiftUI project.

Now that we have picked the library we want to add to our project, we now need to click on the copy button under the **SwiftUICharts** title. This copies the link to **SwiftUICharts** **GitHub** so that we can download the package to our project.

Now that we have our link to **SwiftUICharts** repo, we will need to go to our Xcode project and click on **File** **\>** **Swift** **Packages** **\> Add Package Dependency** and then paste in the repo's url: `**https://github.com/AppPear/ChartView**`

![](/images/Screen-Shot-2021-03-22-at-2.15.39-PM-1024x622.png)

Once you click on the next button, you will then have to choose what version, branch or commit from the package you would like to use.

![](/images/Screen-Shot-2021-03-22-at-2.17.25-PM-1024x612.png)

Here we will not mess with any of the options and just click on the next button. This will now download the package into your Xcode project. Once downloaded, we will make sure our package is selected and click on the finish button.

Now we should see that our package has been successfully added to our project.

![](/images/Screen-Shot-2021-03-22-at-2.21.29-PM-1024x327.png)

Thats all there is too it!

From here we can import the **SwiftUICharts** library into a file and start using all the amazing charts and animations **SwiftUICharts** has to offer.

If you would like a deeper dive into **Swift Package Manager** I would recommend checking out this [great article](https://medium.com/xcblog/apple-swift-package-manager-a-deep-dive-ebe6909a5284) by @Shashikant86

Thanks for reading and happy coding!
