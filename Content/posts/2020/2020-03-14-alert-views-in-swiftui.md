---
title: "Alert Views in SwiftUI"
date: 2020-03-14 00:00
tags: Swift, SwiftUI
---
# Alert Views in SwiftUI

In this post we are going to take a look at how to show an alert in SwiftUI!

Implementing an alert is very simple and all we need is just a few lines of code.

Open up Xcode and create an new SwiftUI project.

In the ContentView.swift file let's creating a simple @State bool to keep track of when to show and hide our alert.

@State private var showingAlert = false

Next we will make a button and in the action part of the button we will switch the state of our **showingAlert** variable to true. Then we'll name the button label "Alert". Lastly we add the .alert modifier to the end of our button. In the modifier we set the state showing the alert. We also set the title, message, and dismiss button of the alert.

    var body: some View {
        Button(action: {
            self.showingAlert = true
        }) {
            Text("Alert")
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Alert"), message: Text("Something Went Wrong"), dismissButton: .default(Text("OK")))
        }
    }

Now if we go and run this in our simulator you will see an alert button in the middle of the screen. When tapped our alert will popup with our title, message, and our dismiss button!

With minimal code we made and alert which can be used for all kinds of things in our apps.

How this helps you in learning SwiftUI!

👨🏻‍💻💻👨🏻‍💻💻👨🏻‍💻💻👨🏻‍💻💻👨🏻‍💻💻👨🏻‍💻💻👨🏻‍💻💻👨🏻‍💻💻👨🏻‍💻💻👨🏻‍💻💻👨🏻‍💻💻👨🏻‍💻💻👨🏻‍💻💻
