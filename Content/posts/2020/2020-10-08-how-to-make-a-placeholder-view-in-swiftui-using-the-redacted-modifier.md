---
title: "How to Make a Placeholder View in SwiftUI using the Redacted Modifier"
date: 2020-10-08 00:00
tags: Swift, SwiftUI
---
# How to Make a Placeholder View in SwiftUI using the Redacted Modifier

As of iOS 14 we can now use the new **[.redacted(reason:)](https://developer.apple.com/documentation/swiftui/view/redacted(reason:))** modifier in SwiftUI to make placeholders for our views. Let's take a look at the example below to get a better understanding of how we can add placeholders to our SwiftUI project.

        Text("Hello world!")
            .padding()
            .redacted(reason: .placeholder)

- ![](https://swifttom.com/wp-content/uploads/2020/10/screen-shot-2020-10-06-at-5.58.32-pm-2.png?w=514)
    
- ![](https://swifttom.com/wp-content/uploads/2020/10/screen-shot-2020-10-06-at-5.58.48-pm-1.png?w=509)
    

By adding the redacted modifier our users will get a outline preview of our content. This is great to use when content is being loaded to our views.

We can also redact groups of SwiftUI views. Let's write some code to see how we can implement this in a example. First let's create a new SwiftUI file and name it ComplexView. Next let's add the following code below.

import SwiftUI

struct ComplexView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Image("husky")
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
            Text("Husky World!")
                .font(.title)
            .fontWeight(.bold)
                Spacer()
            Text("A husky is a sled dog used in the polar regions. One can differentiate huskies from other dog types by their fast pulling-style. They represent an ever-changing crossbreed of the fastest dogs (the Alaskan Malamute, by contrast, pulled heavier loads at a slower speed). Humans use huskies in sled-dog racing. Various companies have marketed tourist treks with dog sledges for adventure travelers in snow regions. Huskies are also kept as pets, and groups work to find new pet homes for retired racing and adventure-trekking dogs.")
            HStack() {
                Spacer()
                Button("More Huskies!") {
                    print("Huskies!!!!")
                }
                .padding()
                .font(.system(size: 32))
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}

We should now see a view about huskies in our preview canvas!

![](https://swifttom.com/wp-content/uploads/2020/10/screen-shot-2020-10-06-at-6.44.59-pm.png?w=511)

Now if we go to our ContentView.Swift file we can add our ComplexView() to our body. Here we will add the redacted modifier to the ComplexView to redact all of the views inside of the container.

import SwiftUI

struct ContentView: View {
    var body: some View {
        ComplexView()
            .redacted(reason: .placeholder)
    }
}

![](https://swifttom.com/wp-content/uploads/2020/10/screen-shot-2020-10-06-at-6.47.35-pm.png?w=509)

We can also redact specific views in our ComplexView.swift file. Let's say we wanted to show a placeholder for everything in our complex view except for our "Husky World!" text. We can simply go back to our ComplexView.swift file and add the **.unredacted()** modifier to our "Husky World!" text view.

struct ComplexView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Image("husky")
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
            Text("Husky World!")
                .font(.title)
                .fontWeight(.bold)
                // Added Unredacted
                .unredacted()
            Spacer()
            Text("A husky is a sled dog used in the polar regions. One can differentiate huskies from other dog types by their fast pulling-style. They represent an ever-changing crossbreed of the fastest dogs (the Alaskan Malamute, by contrast, pulled heavier loads at a slower speed). Humans use huskies in sled-dog racing. Various companies have marketed tourist treks with dog sledges for adventure travelers in snow regions. Huskies are also kept as pets, and groups work to find new pet homes for retired racing and adventure-trekking dogs.")
            HStack() {
                Spacer()
                Button("More Huskies!") {
                    print("Huskies!!!!")
                }
                .padding()
                .font(.system(size: 32))
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}

Now when we look at our preview for our Complex view we should see everything redacted except "Husky World!".

![](https://swifttom.com/wp-content/uploads/2020/10/screen-shot-2020-10-06-at-6.55.30-pm.png?w=510)

It is good to note that buttons are not disabled when using the redacted modifier. This means users can still tap on buttons while the placeholder for the button is being shown. You will need to use a @State or @Enviorment variable to handle disabling any buttons in your view so that button actions won't get triggered as your redacted view is being shown.

The example code for this post can be found on my [GitHub](https://github.com/Tprezioso/PlaceholderViewInSwiftUIBlog).

Thanks for reading my post and I hope this helps in your next SwiftUI project.

Happy Coding!

![Redact GIFs - Get the best GIF on GIPHY](/images/giphy.gif)
