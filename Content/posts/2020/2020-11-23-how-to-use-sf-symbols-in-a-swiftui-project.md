---
title: "How to Use SF Symbols in a SwiftUI project"
date: 2020-11-23 00:00
tags: Swift, SwiftUI
---
# How to Use SF Symbols in a SwiftUI project

SF Symbols are set of over 2,000 symbols created by Apple for developers to use in there apps. SF Symbols are dynamic. This means that they will automatically align with the size and weight of text in our app. We can use these symbols for almost anything but they are most commonly used in toolbars, menus, and navigation bars.

We can use SF Symbols in our project by using the **Image(systemName:)** image view. In the system name parameter we will add the string of the SF Symbol we want to use.

> Image(systemName: “cloud.sun.fill”)

As you can see in the example above we added the “cloud.sun.fill” SF Symbol to our image view.

We can also customize SF Symbols. If we want to change something like the color of our SF Symbol all we need to do is change the .**foregroundColor()**. We can also change the size of our symbol by changing the **.font** size.

> Image(systemName: "cloud.heavyrain.fill")  
> .foregroundColor(.green)  
> .font(.title)

That was a quick look at how we can add SF Symbols to our SwiftUI projects. For more info checkout Apples [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/sf-symbols/overview/) on how you should use SF Symbols in our projects.

Thanks for reading and Happy Coding!
