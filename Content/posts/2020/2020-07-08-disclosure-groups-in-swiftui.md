---
title: "Disclosure Groups in SwiftUI"
date: 2020-07-08 00:00
tags: Swift, SwiftUI
---
# Disclosure Groups in SwiftUI

At WWDC 2020 disclosure groups were announced for SwiftUI. Disclosure groups are very similar to how drop down menus work on the Mac. [Apple's documentation](https://developer.apple.com/documentation/swiftui/disclosuregroup) defines it as "A view that shows or hides another content view, based on the state of a disclosure control".

Before we get started on building a disclosure group you will need to have Xcode 12 installed and be running your project for iOS 14 or newer.

In this post we will be using disclosure groups to help us build parts of a settings menu in a app.

Let's open a new SwiftUI project in Xcode and get started.

The first thing we will need for our disclosure group is a @State variable so we can keep track of if our disclosure view is expanded or not.

@State private var isSettingsExpanded: Bool = false

Next we need to add our disclosure group to our body view.

@State private var isSettingsExpanded: Bool = false
    
var body: some View {
        DisclosureGroup("Settings", isExpanded: $isSettingsExpanded) {
            Text("Terms of service")
        }
        .padding()
    }

![](https://swifttom.com/wp-content/uploads/2020/07/screen-shot-2020-07-08-at-2.30.44-pm.png?w=531)

If we go and run this code you should see a disclosure group labeled "Settings" and if we tap on the arrow we should see a drop down that has our "Terms of Service" text view.

What's really cool is that we can nest Disclosure groups as well.

@State private var isSettingsExpanded: Bool = false
@State private var isTermsOfServiceExpanded: Bool = false

var body: some View {
    DisclosureGroup("Settings", isExpanded: $isSettingsExpanded) {
        DisclosureGroup("Terms of Service", isExpanded: $isTermsOfServiceExpanded) {
            Text("NO ONE READS THESE THINGS!")
        }
    }
    .padding()
}

![](https://swifttom.com/wp-content/uploads/2020/07/screen-shot-2020-07-08-at-2.28.45-pm.png?w=558)

Above we added another state property and a disclosure group like we did before. Now we have our "Terms of Service" disclosure view nested to our parent "Settings" disclosure view.

We also are not limited to just using text, we can also use any kind of view in our disclosure group. For example maybe we want to turn on and off dark mode in our app. We can simply add a toggle to our disclosure group.

@State private var isDarkModeOn = true
@State private var isSettingsExpanded: Bool = true

var body: some View {
    DisclosureGroup("Settings", isExpanded: $isSettingsExpanded) {
        Toggle("Dark Mode", isOn: $isDarkModeOn)
    }
    .padding()
}

![](https://swifttom.com/wp-content/uploads/2020/07/screen-shot-2020-07-08-at-2.32.12-pm.png?w=543)

With just a few lines of code we can have all kinds of information being displayed or hidden from the user.

I hope this brief look into disclosure groups helps you to build amazing SwiftUI apps!

Happy Coding!
