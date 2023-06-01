---
date: 2020-02-06 00:00
title: "How to Share Content in Your App Using UIActivityViewController in SwiftUI"
tags: Swift, SwiftUI
---
# How to Share Content in Your App Using UIActivityViewController in SwiftUI

**UIActivityViewController** is a class that makes sharing content to other services on your apple device super simple. All you need to do is tell it what kind of content you want to share and **UIActivityViewController** take care of most of the heavy lifting. Here is how to implement it.

First we need to **import UIKit** to get access to **UIActivityViewController**. Then we are going to add the following struct to our code outside of our **ContentView**.

struct ActivityViewController: UIViewControllerRepresentable {

    var itemsToShare: \[Any\]
    var servicesToShareItem: \[UIActivity\]? = nil

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: itemsToShare, applicationActivities: servicesToShareItem)
        return controller
    }

    func updateUIViewController(\_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}

}

What this struct is doing is setting itself as a **UIViewControllerRepresentable** so we can gain access to UIKit's classes. Next we are setting up our variables **itemsToShare** and **servicesToShareItem**. The variable **itemsToShare** is for our content that we want to pass to other services and **servicesToShareItem** is to get a list of service we can uses to share our content.

Next we setup the **makeUIViewController** function. This is where we sent the context to **UIActivityViewController** so it can be displayed in SwiftUI. Then inside of the function we set our **UIActivityViewController** with the content (****itemsToShare****) and the list of services (****servicesToShareItem****) we want to display in the controller. We also added **updateUIViewController** function to keep the Controller up to date with any changes.

Now we are going to go to the ContentView and add the following code.

struct ContentView: View {
    
    @State private var isShareViewPresented: Bool = false
    
    var body: some View {
        Button("Share") {
            self.isShareViewPresented = true
        }
        .sheet(isPresented: $isShareViewPresented, onDismiss: {
            print("Dismiss")
        }, content: {
            ActivityViewController(activityItems: \[URL(string: "https://www.swifttom.com")!\])
        })
    }
    
}

First we added a @State variable to keep track of presenting our share sheet. Next we create a button called "Share" and set our **@State** property to true if the button was tapped. Then we add the **.sheet** which tracks our state property and presents or dismisses our ActivityViewController. In this example we are sharing a url to this site.

When we run the code you should see something like below.

![](https://swifttom.com/wp-content/uploads/2020/02/simulator-screen-shot-iphone-11-pro-2020-02-06-at-17.25.29.png?w=473)

![](https://swifttom.com/wp-content/uploads/2020/02/simulator-screen-shot-iphone-11-pro-2020-02-06-at-17.25.41.png?w=473)

Just note that if you want to send content like an image or a video from your photos app you need to get permission from the user. You'll need to add the following to your **Info.plist** file.

- Open your **Info.plist** file.
- Click **+** icon.
- Choose the **Privacy - Photo Library Additions Usage Description** key.
- Set the value to **We need access to your photos gallery**

That's all there is too it! I happy coding! 👨🏻‍💻📱💻
