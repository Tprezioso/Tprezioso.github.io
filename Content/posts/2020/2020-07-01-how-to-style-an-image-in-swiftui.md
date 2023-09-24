---
title: "How to Style an Image in SwiftUI"
date: 2020-07-01 00:00
tags: Swift, SwiftUI
---
# How to Style an Image in SwiftUI

In this post we are going to take a look at how to customize images in SwiftUI.

First thing we need to do is open a new SwiftUI Xcode project and add an image to our assets folder. I downloaded a random image of a husky as my image asset but feel free to use any image you would like.

Next we will set our image in our **ContentView.swift** file like the example below.

struct ContentView: View {
    var body: some View {
        Image("husky")
    }
}

Now that we have our image set let us customize it so that it fits our screen better. We can start by resizing our image using the **.resizeable()** modifier.

struct ContentView: View {
    var body: some View {
        Image("husky")
            .resizable()
    }
}

![](https://swifttom.com/wp-content/uploads/2020/06/screen-shot-2020-06-30-at-5.07.23-pm.png?w=574)

Now the image fits the screen but we definitely want the image to look a little less crammed on screen. We can fix this by adding the **.scaledToFit()** modifier. This allows the image to fit the screen without making the image look crammed.

struct ContentView: View {
    var body: some View {
        Image("husky")
            .resizable()
            .scaledToFit()
    }
}

![](https://swifttom.com/wp-content/uploads/2020/06/screen-shot-2020-06-30-at-5.09.20-pm.png?w=562)

We can also resize the frame of our image by add the **.frame()** modifier.

struct ContentView: View {
    var body: some View {
        Image("husky")
            .resizable()
            .scaledToFit()
            .frame(width: 300.0, height: 300.0)
    }
}

![](https://swifttom.com/wp-content/uploads/2020/06/screen-shot-2020-06-30-at-5.13.39-pm.png?w=552)

We can also clip our image into a shape. In this example we are going to clip out image into a circular shape like how many apps show profile pictures. SwiftUI makes this real easy by adding the **.clipShape(Circle())** modifier.

struct ContentView: View {
    var body: some View {
        Image("husky")
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
    }
}

![](https://swifttom.com/wp-content/uploads/2020/06/screen-shot-2020-06-30-at-5.23.18-pm.png?w=553)

These are some of the ways we can manipulate images in SwiftUI.

As a recap we learned how to use **.resizeable()** modifier which allows us to resize the aspect ratio of the image. We also used **.aspectRatio()** or the **.scaledToFit()** modifier to fill the content of our image so it will look proper on screen. Lastly we learned how to resize the frame of an image and saw how we can clip images into shapes like we did with the circle image.

I hope this helps to show how powerful and easy it is to customize images in SwiftUI.

📷🌉 Happy Coding!! 🌉📷
