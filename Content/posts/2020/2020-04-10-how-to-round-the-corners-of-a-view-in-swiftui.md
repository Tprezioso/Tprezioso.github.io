---
title: "How to Round the Corners of a View in SwiftUI"
date: 2020-04-10 00:00
tags: Swift, SwiftUI
---
# How to Round the Corners of a View in SwiftUI

In this quick post we are going to look at how we can make views in SwiftUI have rounded corners. You can round the corners of any SwiftUI view by using the **cornerRadius()** modifier. Simply add a value to the **cornerRadius** to control how rounded you want the view to be. Let us look at a simple example below.

struct ContentView: View {
    
    @State private var hovering = false
    
    var body: some View {
        Button(action: {}) {
            Text("Button")
        }
        .buttonStyle(PlainButtonStyle())
        .padding()
        .background(Color.green)
        .cornerRadius(10)
    }
}

![](https://swifttom.com/wp-content/uploads/2020/04/screen-shot-2020-04-09-at-4.38.44-pm.png?w=366)

By adding a cornerRadius of 10 to our button we now get nice rounded corners on our button. This can be used on any view that you want to manipulate the corners to have rounded edges.

Hope this helps in styling your views in SwiftUI!
