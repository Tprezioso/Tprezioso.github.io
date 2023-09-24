---
title: "How to Use Link to Open Webpages in SwiftUI"
date: 2020-12-11 00:00
tags: Swift, SwiftUI
---
# How to Use Link to Open Webpages in SwiftUI

SwiftUI makes opening a URL with your default web browser super easy with the **Link** view. All you need to do is give it a title and a destination URL. Let us take a look at the example below.

```
import SwiftUI

struct ContentView: View {
    var body: some View {
        Link("Swift Tom!", destination: URL(string: "https://www.swifttom.com/")!)
        
    }
}
```

- ![](https://swifttom.com/wp-content/uploads/2020/12/simulator-screen-shot-iphone-12-2020-12-11-at-17.05.00-1.png?w=473)
    
- ![](https://swifttom.com/wp-content/uploads/2020/12/simulator-screen-shot-iphone-12-2020-12-11-at-17.05.05-1.png?w=473)
    

As you can see in our example we are added a title of "Swift Tom!" and our destination URL swifttom.com. If we go and run this code in our simulator we will see our Link button that when it is tapped will bring us to my swifttom.com webpage.

Hope you enjoyed this quick look at how we can use Link views to our SwiftUI project.

For more on how to use Link views we can check out Apple's Documentation [here](https://developer.apple.com/documentation/swiftui/link).

🔗🔗🔗 Happy Coding! 🔗🔗🔗
