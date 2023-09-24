---
title: "How to Customize Text in SwiftUI"
date: 2020-06-19 00:00
tags: Swift, SwiftUI
---
# How to Customize Text in SwiftUI

In this post we are going to take a quick look at how to style text in SwiftUI.

If we want to change the font of our text we can simply add the **.font** modifier.

![](https://swifttom.com/wp-content/uploads/2020/06/screen-shot-2020-06-14-at-1.51.43-pm.png?w=1024)

Above you can see Swift has preset options of font types like **title**, **body**, **large title** and many more. We also have the option of using our own custom fonts like the example below.

![](https://swifttom.com/wp-content/uploads/2020/06/screen-shot-2020-06-14-at-1.54.55-pm.png?w=854)

.font(.custom("Helvetica", size: 15))

Let's say we want to change the thickness or thinness of our text. We can do this by using the **.fontWeight()** modifier.

![](https://swifttom.com/wp-content/uploads/2020/06/screen-shot-2020-06-14-at-4.42.44-pm.png?w=778)

We can also change the color of the font by simply using **.foregroundColor()** modifier. This allows us to select the color of our text lettering.

You can also change the background color of the text view by using **.backgroundColor()** modifier.

Text("Warning")
    .background(Color.red)
    .foregroundColor(.white)

Lastly we can also change how far the spacing is between multiple lines by using **.lineSpacing** and **.lineLimit**.

The **.lineSpacing** modifier allows us to make the lines shorter or longer between line breaks and the **.lineLimit** modifier allows us to limit the lines in a text view.

.lineLimit(3)
.lineSpacing(10)

These are the basics on how to manipulate text so we can customize them to our liking.

I hope this helps you to better understand how to customize text in SwiftUI.

👨🏻‍💻💻 Happy Coding!! 👨🏻‍💻💻
