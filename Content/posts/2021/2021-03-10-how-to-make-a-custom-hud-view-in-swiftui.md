---
title: "How to Make a Custom HUD View in SwiftUI"
date: 2021-03-10 00:00
tags: Swift, SwiftUI
---

# How to Make a Custom HUD View in SwiftUI

In this post we are going to make a custom **HUD** view with a timer. The timer will dismiss our HUD view after about a second. Our **HUD** view will be similar to the pop up view we see on our screen when we put our phone into silent mode.

![](/images/silentMode.jpg)

Let's jump right in by creating a new SwiftUI file and naming it **HUDView**. Next we are going to copy the code below into our **HUDView.swift** file.

```
import SwiftUI

struct HUDView<Content: View>: View {
    var content: Content
    @ViewBuilder var body: some View {
        content
            .padding(.horizontal, 10)
            .padding(10)
            .background(
                Capsule()
                    .foregroundColor(Color.white)
                    .shadow(color: Color(.black).opacity(0.10), radius: 10, x: 0, y: 5)
            )
    }
}

struct HUD_Previews: PreviewProvider {
    static var previews: some View {
        HUDView(content: Text("HI"))
    }
}
```

Above we created a **HUD** view that takes in a view as a variable and then presents that view when the **HUD** appears. We also stylized our **HUD** to look like the pill shaped silent mode view in the image above. Now that we have created our **HUD** lets go add it to our **ContentView.swift** file.

In our **ContentView** file we will replace the boilerplate code with the code below.

```
import SwiftUI

struct ContentView: View {
    var body: some View {
        HUDView(content: Text("Hello, World!"))
    }
}
```

![](/images/Simulator-Screen-Shot-iPod-touch-7th-generation-2021-03-08-at-14.10.56-577x1024.png)

In our preview screen we should see a pill shaped view with a text view saying "Hello World!".

Next we will need to move our **HUD** view from the middle of our view to the top of our view. Let's take a look at the example below to see how we can setup our **HUD** view.

```
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top) {
            NavigationView {
                Button("Save") {
                    
                }
                .navigationTitle("Home")
            }
            HUDView(content: Text("Save"))
        }
    }
}
```

![](/images/Simulator-Screen-Shot-iPod-touch-7th-generation-2021-03-08-at-14.35.20-577x1024.png)

As you can see in the code above we added a **ZStack** to keep our **HUD** view aligned to the top and above the content on screen. Next we added a save button which will show our **HUD** view when we tap on the button. Lastly we added a **NavigationView** so we can have a navigation title on our screen for some style points.

Now when our save button is tapped we will want to present our **HUDView**. Then after 1.5 seconds we will have our **HUD** dismiss itself. To do this let us add the code below to our **ContentView** file.

```
import SwiftUI

struct ContentView: View {
    @State private var showHUD = false
    var body: some View {
        ZStack(alignment: .top) {
            NavigationView {
                Button("Save") {
                    withAnimation {
                        self.showHUD.toggle()
                        dismissHUD()
                    }
                }
                .navigationTitle("Home")
            }
            
            HUDView(content: Text("Save"))
                .offset(y: showHUD ? 0 : -100)
                .animation(.spring())
        }
    }

    func dismissHUD() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.showHUD = false
        }
    }

}
```

Above we added a **@State** property to track when we will show and hide the **HUD** view. Then we added the **dismissHUD()** function so that we can dismiss the **HUD** view after 1.5 seconds(feel free to change the time to dismiss to whatever you like best). Lastly we added an **.offset** and **.animation(.spring())** modifier to our **HUD** view. We added the **.offset** modifier so we can hide the **HUD** view offscreen when not being shown. We also added a spring animation to give our **HUD** some bounce when entering the view from off screen. Now when we run our app and press our save button, we should see our **HUD** appear and then disappear after 1.5 seconds.

https://videopress.com/v/GThOyjdD?controls=false&loop=true&preloadContent=metadata

Thanks for reading! Hope this helps you in your next SwiftUI project.

Happy Coding!

![Iron man GIF - Find on GIFER](/images/LhZn.gif)
