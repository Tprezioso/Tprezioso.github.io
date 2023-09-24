---
title: "How to Use AsyncImage in SwiftUI 3"
date: 2021-06-24 00:00
tags: Swift, SwiftUI
---
# How to Use AsyncImage in SwiftUI 3

Recently Apple has announced **[AsyncImage](https://developer.apple.com/documentation/swiftui/asyncimage?changes=__5)** at WWDC 2021. This makes loading images from a URL very easy in SwiftUI projects supporting iOS 15 and above. Let's take a look at an example below.

If we want to load an image from a URL, all we need to do is add the following line of code.

```
AsyncImage(url: https://i1.wp.com/swifttom.com/wp-content/uploads/2019/10/img_8186-2.jpg?resize=338%2C452&ssl=1)
```

That's it! This is all the work we have to do to load an image from a URL! The only problem here is the URL image will most likely take up the whole screen because we didn't set the image modifiers. We also would want some sort of placeholder image while the URL image loads. No worries, **[AsyncImage](https://developer.apple.com/documentation/swiftui/asyncimage?changes=__5)** has us covered.

By adding initializers to our **[AsyncImage](https://developer.apple.com/documentation/swiftui/asyncimage?changes=__5)**, we can have a placeholder while the image is loading and style our image once is has loaded.

```
            AsyncImage(
                url:https://i1.wp.com/swifttom.com/wp-content/uploads/2019/10/img_8186-2.jpg?resize=338%2C452&ssl=1,
                content: { image in
                    image.resizable()
                         .scaledToFit()
                         .frame(maxWidth: 100, maxHeight: 100)
                },
                placeholder: {
                    ProgressView()
                }
            )
```

In the example above we have added a **content** parameter to our **[AsyncImage](https://developer.apple.com/documentation/swiftui/asyncimage?changes=__5)**. This allows us to set the image modifiers to give our image styling. We also added a **placeholder** parameter which allows us to show a view as a placeholder until our image has loaded. In the example above we are using a **[ProgressView](https://developer.apple.com/documentation/swiftui/progressview/)** as our placeholder until the image loads.

I hope you find this useful in your next SwiftUI 3 projects! Happy coding!! 🌁📸🤳
