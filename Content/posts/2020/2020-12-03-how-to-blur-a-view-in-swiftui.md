---
title: "How to Blur a View in SwiftUI"
date: 2020-12-03 00:00
tags: Swift, SwiftUI
---
# How to Blur a View in SwiftUI

SwiftUI makes it easy to add a blur effect to any view. All we need to do is add the **.blur()** modifier to our view. Let’s see how we can apply this by looking at the example below.

 import SwiftUI
import PlaygroundSupport
struct ContentView: View {
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            Text("Hello Tom")
        }
    }
}
PlaygroundPage.current.setLiveView(ContentView()) 

![](https://swifttom.com/wp-content/uploads/2020/12/img_0039.png?w=460)

As you can see in the example we have a **ZStack** with a green background and a text view. If we want to add a blur effect to our text view all we need to do is add the **.blur()** modifier to it.

 import SwiftUI
import PlaygroundSupport
struct ContentView: View {
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            Text("Hello Tom")
                .blur(radius: 1.5)
        }
    }
}
PlaygroundPage.current.setLiveView(ContentView()) 

![](https://swifttom.com/wp-content/uploads/2020/12/img_0038.png?w=460)

As you can see above we added the blur effect with a **1.5 radius** to our “Hello Tom” text view. It is good to know that the higher the radius the more blurry the view will appear.

Thanks for reading and happy coding!
