---
title: "How to Make a Sidebar Menu in SwiftUI"
date: 2020-09-22 00:00
tags: Swift, SwiftUI
---
# How to Make a Sidebar Menu in SwiftUI

Sidebars are really useful for navigating on bigger screen such as iPad's and the Mac's. We are going to take a look at how we can implement sidebars into a multiplatform SwiftUI app.

The first thing we need to do is open a new Xcode project and create a new SwiftUI file. In this example we are going to name our file **SideBar**. Inside the **Sidebar** file we are going to replace the boilerplate code with the code below.

struct Sidebar: View {
    var body: some View {
        NavigationView {
            List {
                Label("Books", systemImage: "book.closed")
                Label("Tutorials", systemImage: "list.bullet.rectangle")
                Label("Video Tutorials", systemImage: "tv")
                Label("Contacts", systemImage: "mail.stack")
                Label("Search", systemImage: "magnifyingglass")
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Code")
        }

    }
}

![](https://swifttom.com/wp-content/uploads/2020/09/screen-shot-2020-09-18-at-2.54.26-pm.png?w=395)

In the above example we have created a simple list view with a few labels for our sidebar. Then we set our list with the sidebar style by simply adding the **.listStyle(SidebarListStyle())** modifier. We also added a navigation view so we can have a nice title label and add navigation to our sidebar labels in the future.

Now we are going to run this code on our iPad simulator and rotate our simulator 90°. We can now see how our sidebar looks on a bigger iPad screen.

![](https://swifttom.com/wp-content/uploads/2020/09/simulator-screen-shot-ipad-8th-generation-2020-09-18-at-18.19.27.png?w=1024)

Let's fill in the blank space of our example to see how this would look in a real app. First we will remove the **NavigationView** from our Sidebar.swift file. Then we will go into our **ContentView** file and add the following code below.

struct ContentView: View {
    var body: some View {
        NavigationView {
            Sidebar()
            List(0 ..< 20) {\_ in
                Text("Book")
            }
            .navigationTitle("Book List")
        }
        
        
    }
}

Now when we run our application we get a mock book list next to our sidebar.

![](https://swifttom.com/wp-content/uploads/2020/09/simulator-screen-shot-ipad-8th-generation-2020-09-18-at-18.34.04.png?w=1024)

If we wanted to make this sidebar available on a Mac version of our app all we would need to do is add a few lines of code to our project.

The first thing we will need to do is extract out the code in between the **NavigationView** curly braces. We can do this by holding down the command button and clicking on **List**. Next scroll down and select **Extract subview**. We will rename our subview **SideBarContent**. Now we need to add **#if**, **#else**, and **#endif** under our NavigationView. This will allow us to specify how we want our sidebar layout to look for the different operating systems.

struct Sidebar: View {
    var body: some View {
        NavigationView {
            #if os(iOS)
            SideBarContent()
                .navigationTitle("Code")
            #else
            SideBarContent()
                .frame(minWidth: 200, idealWidth: 250,maxWidth: 300)
            #endif
        }

    }
}

The code above is allowing us to adapt our sidebar code to the different **OS**'s (Operating Systems) our app is going to run on. We need to separate our code because there are different requirements for running our code on the different operating systems. In the first part of our **#if** statement we are checking to see if our **OS** is iOS and if it is we are then setting our sidebar with a navigation title. We need to add our **.navigationTitle()** modifier here because it is not supported in MacOS. In the **#else** statement all we need to do is set the minimum frame of our Mac app's window. Lastly we end our if statement with the **#endif**.

Now we can run our sidebar code on both the iOS and MacOS (We need to have MacOS Big Sur installed on your Mac to run this on the Mac simulator).

That's all there is too adding a native sidebar to a multiplatform SwiftUI app. Feel free to check out the example code here on my [Github](https://github.com/Tprezioso/SideBarSwiftUI).

💻👨🏻‍💻 Happy Coding! 💻👨🏻‍💻
