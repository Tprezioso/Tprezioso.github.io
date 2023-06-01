---
title: "How to Detect Dark Mode in SwiftUI"
date: 2020-07-20 00:00
tags: Swift, SwiftUI
---
# How to Detect Dark Mode in SwiftUI

SwiftUI makes it really simply to detect when dark mode is enabled. We simply have to add a **@Enviroment** variable and use **.colorScheme** property to scan the settings on our device and see if dark mode is enabled.

Let's take a look at the example below.

struct ContentView: View {
    @Environment(\\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            Color(colorScheme == .light ? .blue : .red)
            Text("Hello, World!")
        }
    }
}

In the code above we are creating the **@Environment** variable to see if our device is in dark mode. Then inside of our body view we are setting the background color to red if its in dark mode or blue if its not in dark mode by using our **colorScheme** variable inside of a [ternary operator](http://swifttom.com/2020/04/01/what-is-a-ternary-operator-in-swift/).

A great use case for this is if you want to support different custom UI's for when the users device is in dark mode.

🌃 Happy Coding! 🌃
