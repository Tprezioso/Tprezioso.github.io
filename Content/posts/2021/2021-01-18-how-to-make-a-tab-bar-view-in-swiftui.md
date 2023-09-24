---
title: "How to Make a Tab Bar View in SwiftUI"
date: 2021-01-18 00:00
tags: Swift, SwiftUI
---
# How to Make a Tab Bar View in SwiftUI

In this post we are going to take a look at how we can add a tab bar view to our SwiftUI app. Tab bar views are used to display a view when the tab item is selected. For this example we will simply have two tab views that will show a text view with a different background color. Let's start by creating our example views that we will assign to our tab bar.

```
import SwiftUI
struct FirstView: View {
    var body: some View {
        ZStack {
            Color(.green)
            Text("First View")
                .font(.title)
        }.ignoresSafeArea()
    }
}
```

```
struct SecondView: View {
    var body: some View {
        ZStack {
            Color(.blue)
            Text("Second View")
                .font(.title)
                .foregroundColor(.white)
        }.ignoresSafeArea()
    }
}
```

As you can see we have created two views with just a text view and a color for the background. Now that we have our views setup we can go to our **ContentView.swift** file and make our tab bar view.

```
import SwiftUI
struct ContentView: View {
    var body: some View {
        TabView {
            FirstView()
                .tabItem {
                    Image(systemName: "1.circle.fill")
                    Text("First View")
                }
        
            SecondView()
                .tabItem {
                    Image(systemName: "2.circle.fill")
                    Text("Second View")
                }
        }
    }
}
```

As you can see in the example above all we needed to do was make a **TabView** and initialize our two views as a .**tabItem**. Inside of our .**tabItem** we added an image and the title to be displayed on our tab. Now if we run our application we should see our app look like the images below.

![](https://i0.wp.com/swifttom.com/wp-content/uploads/2021/01/Simulator-Screen-Shot-iPhone-12-Pro-2021-01-18-at-16.02.47.png?fit=473%2C1024&ssl=1)

![](https://i0.wp.com/swifttom.com/wp-content/uploads/2021/01/Simulator-Screen-Shot-iPhone-12-Pro-2021-01-18-at-16.02.50.png?fit=473%2C1024&ssl=1)

I hope this helps you on your next SwiftUI project.

Thanks for reading and happy coding!
