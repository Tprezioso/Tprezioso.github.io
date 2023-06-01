---
title: "What are Life Cycle Functions in SwiftUI?"
date: 2020-05-21 00:00
tags: Swift
---
# What are Life Cycle Functions in SwiftUI?

If you have done any development with UIKit you have used a life cycle function. These UIKit life cycle functions would be **viewDidLoad**, **viewWillAppear**, **viewWillDisappear**, and **viewDidDisappear**. In SwiftUI we lose these life cycle functions because there are no more ViewControllers in SwiftUI, only views. SwiftUI replaces these functions with two methods called **onAppear( )** and **onDisappear( )**.

**onAppear( ):** is a function that runs every time a view appears on screen. The **onAppear( )** function is similar to the **viewWillAppear** function used in UIKit. A good example of how we can use the **onAppear( )** function is for any network calls we would need for that view.

**onDisappear( ):** is a function that runs when a view disappears from our apps screen. This function is similar to the **viewWillDisappear** function in UIKit. A example for when to use the **onDisappear( )** function is for clearing any data before dismissing that view.

By using the [**onAppear(**](https://developer.apple.com/documentation/swiftui/text/3276931-onappear) **)** and **[onDisappear( )](https://developer.apple.com/documentation/swiftui/text/3276933-ondisappear)** functions in SwiftUI we can achieve similar behavior and functionality to the UIKit lifecycle functions.

Thanks for reading and I hope this helps in your learning of SwiftUI!

👨🏻‍💻 Happy Programming 👨🏻‍💻
