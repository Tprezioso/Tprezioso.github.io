---
title: "How to Show a Menu When a Button is Pressed in SwiftUI"
date: 2020-09-02 00:00
tags: Swift, SwiftUI
---
# How to Show a Menu When a Button is Pressed in SwiftUI

As of iOS 14 and SwiftUI 2 we can now add a pop out menu to any button in our app. We can implement this by using the new **[Menu](https://developer.apple.com/documentation/swiftui/menu?changes=latest_beta)** keyword. Menus in some way are going to replace the current action sheets used in iOS apps. The problem with action sheets is they only show up at the bottom of our screen. This doesn't look great on larger screens like the iPad and Mac. Menus allow the flexibility in where we would want to show pop out menus in our app instead of only showing them at the bottom of our screens.

Let's take a look at the example below of how we can implement this in our application.

struct ContentView: View {
    var body: some View {
        
        Menu("Create") {
            Button("Cancel", action: {})
            Button("Search", action: {})
            Button("Add", action: {})
        }
    }
}

As you can see in the example above we use the **Menu** keyword and name our menu "**Create**". Next inside the menu curly braces we can add as many buttons as we want. The order of how we place the buttons in the menu does matter. The first button we create will always be at the bottom and whatever button we create next will be on top of the pervious the button. Take a look at the example below.

![](https://swifttom.com/wp-content/uploads/2020/09/screen-shot-2020-08-31-at-8.08.59-pm.png?w=527)

![](https://swifttom.com/wp-content/uploads/2020/09/screen-shot-2020-08-31-at-8.09.14-pm.png?w=519)

As you can see in the above example once our create button is tapped we can see our menu of buttons appear in the specific order we placed them in our code.

We can also have menus inside of menus.

struct ContentView: View {
    var body: some View {
        
        Menu("Create") {
            Button("Cancel", action: {})
            Menu("More") {
                    Button("Rename", action: {})
                    Button("Developer Mode", action: {})
                }
            Button("Search", action: {})
            Button("Add", action: {})
        }
    }
}

![](https://swifttom.com/wp-content/uploads/2020/09/screen-shot-2020-09-02-at-12.16.09-pm.png?w=526)

![](https://swifttom.com/wp-content/uploads/2020/09/screen-shot-2020-09-02-at-12.17.08-pm.png?w=530)

Now if we tap on the Create button and then tap our More button we now get presented with our new menu inside of our main menu.

Lastly we can have customized text and icons in our menu by adding a label to our menu.

struct ContentView: View {
    var body: some View {
        
        Menu {
            Button("Cancel", action: {})
            Button("Search", action: {})
            Button("Add", action: {})
        } label: {
            Label("Create", systemImage: "plus.circle")
        }
    }
}

![](https://swifttom.com/wp-content/uploads/2020/09/screen-shot-2020-09-02-at-12.26.12-pm.png?w=516)

![](https://swifttom.com/wp-content/uploads/2020/09/screen-shot-2020-09-02-at-12.27.07-pm.png?w=528)

As you can see in the above example now we can add a custom title and icon to our menu button.

There is a great [WWDC video](https://developer.apple.com/videos/play/wwdc2020/10205) that can help explain menus if you are still confused.

I hope this helps you better understand how to use the menus in iOS 14 and SwiftUI 2.

💻👨🏻‍💻 Happy coding! 💻👨🏻‍💻
