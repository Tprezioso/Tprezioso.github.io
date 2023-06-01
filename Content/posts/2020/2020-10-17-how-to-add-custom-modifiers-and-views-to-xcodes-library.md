---
title: "How to Add Custom Modifiers and Views to Xcode's Library"
date: 2020-10-17 00:00
tags: Swift, Xcode, SwiftUI
---
# How to Add Custom Modifiers and Views to Xcode's Library

SwiftUI allows us to add our own custom views and modifiers to Xcode's library. By doing this we are able to easily access our custom views and add them into our code in just a click. Let's see how we can take advantage of this in our own SwiftUI project.

First thing we will need is to add a new SwiftUI file to our project to store our custom views and modifiers. We'll name our file **LibraryContent** and replace the boilerplate code with the code in the example below.

import SwiftUI

struct LibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: \[LibraryItem\] {
        LibraryItem(CloseButton(), category: .control)
    }
}

In the example code we are creating a [LibraryItem](https://developer.apple.com/documentation/developertoolssupport/libraryitem) so we can add our custom view to the Xcode library. We chose to add our custom close button because we will most likely use this view throughout the app and we will want to have quick access to it from our Xcode library.

If we dive into the Documentation for [LibraryItem](https://developer.apple.com/documentation/developertoolssupport/libraryitem) we can see that we can add things like a title and category to our [LibraryItem](https://developer.apple.com/documentation/developertoolssupport/libraryitem). This is to help us better organization our views and modifiers in our Xcode Library. In our example we are adding the close button to the **.control** category. Also you will notice we didn't add a title to our **LibraryItem** but Xcode is smart enough to use the filename "CloseButton" as the title.

Now Xcode probably is showing some errors because it can't find our **CloseButton** view. Let's go ahead and create a new SwiftUI file and name it **CloseButton**.

In our **CloseButton.swift** file add the following code.

import SwiftUI

struct CloseButton: View {
    var body: some View {
        Image(systemName: "xmark")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.all, 10)
                    .background(Color.black.opacity(0.6))
                    .clipShape(Circle())
    }
}

struct CloseButton\_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton()
    }
}

If we go and run the preview canvas in **CloseButton.swift** we should see a circular button with an **X** in the center.

Now if we go to our Xcode library we can see that our close button has been added. We can open up our Xcode library by going to the **+** button in the top right of Xcode or by using the keyboard shortcut **Command + Shift + L**.

Now that the Xcode library is open we can use its search bar at the top to search for our custom "Close button". Like in the image below we should see our new custom view show up and allow us to drag and drop it or double click on it to add it to our current SwiftUI file.

![](https://swifttom.com/wp-content/uploads/2020/10/screen-shot-2020-10-13-at-3.39.02-pm.png?w=1024)

We can also add custom modifiers to our library like we did our custom view.

To add a reusable modifier we will need to add a **View** extension to our **LibraryContent.swift** file. Inside of the extension we will need to create a function that returns a view with the modifiers we want added.

Let's take a look at the example code below.

extension View {
    func customViewStyle() -> some View {
        return self
            .background(Color.red)
            .cornerRadius(22)
            .shadow(color: Color.red.opacity(0.3), radius: 20, x: 0, y: 10)

    }
}

Above we created our **customViewStyle()** function which is returning a view with 3 custom modifiers.

With just this code we can now go to any file in our project and apply our new custom modifier. Let's see this in action by going to our **ContentView.swift** file. At the end of the Hello World text view we can add our new modifier.

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .customViewStyle()
    }
}

![](https://swifttom.com/wp-content/uploads/2020/10/screen-shot-2020-10-14-at-5.25.26-pm.png?w=503)

This is great but the only problem is that our new modifier for our view doesn't show up in our Xcode library.

Let's go back to the **LibraryContent.swift** file and under our **CloseButton()** let's add another **@LibraryContentBuilder** with the following code.

    @LibraryContentBuilder
    func modifiers(base: Image) -> \[LibraryItem\] {
        LibraryItem(
            base.customViewStyle(),
            title: "Custom View Style 1",
            category: .effect
        )
    }

As you can see in the example above this code is very similar to how we added our custom close button to our library. Now if we go to our library with the second tab selected and search for our modifier we will see our "Custom View Style 1" modifier has been added.

![](https://swifttom.com/wp-content/uploads/2020/10/screen-shot-2020-10-14-at-5.37.05-pm.png?w=1024)

Lastly let's make our custom modifier customizable. We are going to change the hard coded values into variables so that anyone that is using our modifier can style it to their liking. Let's go back to our **LibraryContent.swift** file and add the following changes to our code.

    @LibraryContentBuilder
    func modifiers(base: Image) -> \[LibraryItem\] {
        LibraryItem(
            // Added default values for our customViewStyle function
            
            base.customViewStyle(color: Color.red, cornerRadius: 22),
            title: "Custom View Style 1",
            category: .effect
        )
    }
}

extension View {
    // Add variables to our function so we can customize it to our like for the specific view we are working on
    
    func customViewStyle(color: Color, cornerRadius: CGFloat) -> some View {
        return self
            .background(color)
            .cornerRadius(cornerRadius)
            .shadow(color: color.opacity(0.3), radius: 20, x: 0, y: 10)

    }
}

As you can see in the code above we added variables to our **customViewStyle()** function so we can change the color and the corner radius to whatever value we want. We also added our previously hard coded values as the default values for our modifier. Let's go back to our **ContentView.swift** file and apply our updated modifier to the Hello World text view.

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .customViewStyle(color: .green, cornerRadius: 10)
    }
}

![](https://swifttom.com/wp-content/uploads/2020/10/screen-shot-2020-10-14-at-5.48.55-pm.png?w=505)

Hope this helps you on your next SwiftUI project!

Thanks for reading!

All the code in this post can be found on my [Github](https://github.com/Tprezioso/AddingCustomLibraryComponents).

👨🏻‍💻 Happy coding! 👨🏻‍💻
