---
title: "@Appstorage in SwiftUI"
date: 2021-02-08 00:00
tags: Swift, SwiftUI
---
# @Appstorage in SwiftUI

**[Appstorage](https://developer.apple.com/documentation/swiftui/appstorage)** is a property wrapper for getting stored values from **[UserDefaults](https://developer.apple.com/documentation/foundation/userdefaults)** in SwiftUI. We use **@Appstorage** too reload our body view property whenever the value changes of our **UserDefaults**. This keeps our view up to date with the data that we have stored. Let's take a look at an example on how we can use **@Appstorage** in our SwiftUI project.

```
import SwiftUI

struct ContentView: View {
    @AppStorage("isCookieTime") var isCookieTime = false
    
    var body: some View {
            Toggle("Cookie time", isOn: $isCookieTime)
        .padding()
    }
}
```

In the example above we have a Toggle view for "Cookie time" 🍪. We use our **@AppStorage** property to watch our **isCookieTime** variable. If the value changes it is then stored in our **UserDefaults**. Now our toggle will show the stored value depending on the **@AppStorage**.

A example of where I use **@AppStorage** is for storing things like a users settings options in a settings screen of an app. I hope this helps explain how to use **@AppStorage** in SwiftUI.

Thanks for reading and happy coding.

![](/images/storageFull.jpg)
