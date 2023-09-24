---
title: "How to Make Keyboard Shortcuts in SwiftUI"
date: 2020-08-19 00:00
tags: Swift, SwiftUI
---
# How to Make Keyboard Shortcuts in SwiftUI

As of WWDC 2020, SwiftUI has made it insanely easy to add [keyboard shortcuts](https://developer.apple.com/documentation/swiftui/keyboardshortcut) to any SwiftUI app. Let's look at how we can add keyboard shortcuts to our project by looking at the code example below.

struct ContentView: View {
    var body: some View {
        
        Button(action: {
            print("Button Tapped!!")
        }) {
            Text("Button")
        }.keyboardShortcut("T")
        
    }
}

As you can see in the example above all we needed to do was add the **.keyboardShortcut()** modifier to our button and assign it a key. Now by holding the command button on our external keyboard and pressing "T", our action for our button will be triggered.

We can customize our shortcut by modifying which buttons need to be pressed.

.keyboardShortcut("T", modifiers: .control)

In the example above if we want to trigger our new modified shortcut we need to press the control button and the "T" button.

We can also use different combinations of modifier keys in an array.

.keyboardShortcut("T", modifiers: \[.command, .control\])

Like in the example before we need to hold the control and "T" key but now we also need to hold the command key to get our shortcut to work.

We can also use other keyboard keys like directional keys, spacebar, and many [more](https://developer.apple.com/documentation/swiftui/keyequivalent).

.keyboardShortcut("T", modifiers: \[.command, .shift, .space\])

Also be mindful that system keyboard shortcuts like cut, copy, and paste take priority over app shortcuts. Keep this in mind when assigning your keyboard shortcuts.

I hope this helps you to expand keyboard shortcuts to your SwiftUI app!

⌨️ 🩳 💇‍♂️ Happy Coding ⌨️ 🩳 💇‍♂️
