---
date: 2019-11-18 00:00
title: "SwiftUI on iPad in Swift Playgrounds"
tags: Swift, Swift Playgrounds
---
# SwiftUI on iPad in Swift Playgrounds

Did you know that you can write SwiftUI code on your iPad! Apple’s update to Swift Playgrounds on the iPad now supports SwiftUI! This means we can build SwiftUI components anywhere we can take our iPads. This is really exciting because this brings developers one step closer to making iOS apps on the iPad (One day we will get Xcode for iPad 😕).

This is how you get started coding on your iPad with SwiftUI. Open a Blank Playground and add the boilerplate code below to your Playground.

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        Text("Hello World")
    }
}

PlaygroundPage.current.setLiveView(ContentView())

Don't forget to hit the "Run Code" button but thats all there is to start writing SwiftUI components on your iPad. Happy iPad coding!
