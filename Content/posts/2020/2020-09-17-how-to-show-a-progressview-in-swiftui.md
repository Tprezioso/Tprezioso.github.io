---
title: "How to Show a ProgressView in SwiftUI"
date: 2020-09-17 00:00 
tags: Swift, SwiftUI
---
# How to Show a ProgressView in SwiftUI

At WWDC 2020 Apple introduced [**ProgressView**'s](https://developer.apple.com/documentation/swiftui/progressview) to SwiftUI. A **[ProgressView](https://developer.apple.com/documentation/swiftui/progressview)** allows us to show either a circular progress view or a linear progress view for when tasks are loading in our app.

The first type of progress view we will look at is the **Indeterminate Progress** **view**. The indeterminate progress view creates a spinning loading view. The example below shows how we can easily add this into our code.

ProgressView()

We can also add text to the progress view by adding a string inside the parentheses.

ProgressView("Loading...")

![](https://swifttom.com/wp-content/uploads/2020/09/screen-shot-2020-09-14-at-8.13.53-pm.png?w=266)

The second type of progress view we will look at is the **Linear Progress** **view**. Linear progress views are great for when we have something loading and we want to show the progress to our user.

To make a linear progress view we need to specify two parameters, the **current value** and the **total value** of our progress view.

ProgressView("Downloading…", value: 25, total: 100)  
    .padding()

![](https://swifttom.com/wp-content/uploads/2020/09/screen-shot-2020-09-14-at-10.28.48-pm.png?w=628)

As you can see in the above example all we did was add a current value of 25 and a total value of 100. This shows our current progress as the blue line at 25% of our total value which is 100%.

We can see how a linear progress view works by adding a simple timer that changes the current value over time until it reaches our total value.

struct LinearProgressView: View {
    @State private var currentValue = 0.0
    let timer = Timer.publish(every: 0.09, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ProgressView("Downloading…", value: currentValue, total: 100)
            .padding()
            .onReceive(timer) { \_ in
                if currentValue < 100 {
                    currentValue += 1
                }
            }
    }
}

In the example above we added a **@State** property called **currentValue**. This will update the current progress of our linear progress view. Then we created and added our **timer** to the **.onReceive** modifier. This will update our **currentValue** variable every time our **timer** hits 0.09 seconds. We also check to make sure that the **currentValue** never exceeds the total value of the progress view because this can cause problems in your code and Xcode will yell at us.

Lastly we can customize your linear progress view by changing the accent color of the progress bar with the **.accentColor** modifier and by changing the text color by using the **.foregroundColor** modifier.

struct LinearProgressView: View {
    @State private var currentValue = 0.0
    let timer = Timer.publish(every: 0.09, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ProgressView("Downloading…", value: currentValue, total: 100)
            .padding()
            .onReceive(timer) { \_ in
                if currentValue < 100 {
                    currentValue += 1
                }
            }
            .accentColor(.purple)
            .foregroundColor(.red)
    }
}

![](https://swifttom.com/wp-content/uploads/2020/09/screen-shot-2020-09-15-at-10.01.08-pm.png?w=612)

If you would like to play around with these progress view examples please check out the code for this blog on my [Github](https://github.com/Tprezioso/ProgressViewSwiftUIBlog).

Hope this helps shed some light on how to use progress views in SwiftUI!

💻 ꩜ Happy Programming! ꩜💻
