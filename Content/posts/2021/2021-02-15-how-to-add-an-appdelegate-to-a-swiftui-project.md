---
title: "How to Add an AppDelegate to a SwiftUI Project"
date: 2021-02-15 00:00
tags: Swift, SwiftUI
---
# How to Add an AppDelegate to a SwiftUI Project

When you create a new SwiftUI project, you will see that we no longer have the **AppDelegate.swift** file. This doesn't mean we don't need or use the **AppDelegate** file anymore. If we want to implement something like push notifications we will need to use an **AppDelegate** in our SwiftUI app. Let's take a look at how we can add an **AppDelegate** file to our SwiftUI project.

First we will need to create a new swift file and name it **AppDelegate**. Now inside of our new **AppDelegate** file we will need to copy and paste the code below (Feel free to add any **AppDelegate** functions you need for your project).

```
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        // Your Code Here!
        return true
    }
}
```

Now that we have our **AppDelegate** created, we will need to tell our app to use the **AppDelegate.swift** file. Let us navigate over to the App file in our project. This file is named after your project with **"App**" at the end. In this example my file is named **AppDelegateBlogProjectApp.swift** (Not the best name in the world 🤣).

In this file we will create and wrap our AppDelegate property in the **UIApplicationDelegateAdaptor** property wrapper. This tells SwiftUI we want to use the **AppDelegate** file we just created.

```
@main
struct AppDelegateBlogProject: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

That is all we need to make an **AppDelegate** in a SwiftUI project!

Thanks for reading!
