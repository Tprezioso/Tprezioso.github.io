---
title: "Adding Pointer Hover Effects on iPadOS using SwiftUI"
date: 2020-04-02 00:00
tags: Swift, SwiftUI
---
# Adding Pointer Hover Effects on iPadOS using SwiftUI

Apple's latest update now includes support for you to connect a mouse or a trackpad to your iPad in iPadOS 13.4! This is really cool but how can we implement this in our own SwiftUI app for iPad. The good news is Apple makes this simple by giving us two modifiers **.hoverEffect** and **.onHover** to add to our SwiftUI views. Let us start by opening up Xcode and in a SwiftUI project add the following code.

struct ContentView: View {
    var body: some View {
        Button(action: {}) {
            Text("Button")
        }
        .hoverEffect()
    }
}

Here we created a button and added the **hoverEffect** modifier. By adding **hoverEffect** modifier we get the iPadOS hover effect that clings to the nearest view like buttons or labels. This modifier has three types of effects that we can set to the pointer. By default the **hoverEffect** modifier uses the first type called **automatic**. The other two types are **highlight** and **lift**.

.hoverEffect(.lift)
.hoverEffect(.highlight)

**Lift** is a effect that slides the pointer behind the view object and goes aways as the view scales up.

**Highlight** is a effect that changes the pointer into a platter behind the view and shows a light source showing the cursors position.

Next we are going to look at the **onHover** modifier. This modifier allows us to make custom effects when the pointer hovers over a view. The **onHover** modifier uses a closure that is called whenever the cursor of the trackpad or mouse goes over the view. This is where we can set some state to track the cursor and implement our custom animation. Take a look at the example code below.

    @State private var hovering = false
    
    var body: some View {
        Button(action: {}) {
            Text("Button")
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(hovering ? 1.5 : 1.0)
        .animation(.spring())
        .padding()
        .background(Color.green)
        .cornerRadius(10)
        .onHover { isHovered in
            self.hovering = isHovered
            
        }
    }

The above code created a hovering state property to keep track of if the cursor is over our button. If the cursor is hovering over our button we set the state to true in our .onHover closure. This will trigger our **scaleEffect** of the spring animation. This makes our text animate by enlarging it when our button has the cursor over our it.

Pretty neat!

If you have an iPad app and are using SwiftUI, definitely support the use of the trackpad and mouse in your app!

Hope this was helpful and happy coding!!

👨🏻‍💻🖱👨🏻‍💻🖱👨🏻‍💻🖱
