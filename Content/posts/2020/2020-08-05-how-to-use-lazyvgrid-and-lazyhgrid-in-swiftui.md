---
title: "How to use LazyVGrid and LazyHGrid in SwiftUI"
date: 2020-08-05 00:00
tags: Swift, SwiftUI
---
# How to use LazyVGrid and LazyHGrid in SwiftUI

As of iOS 14, SwiftUI now gives developers two new UI components called [LazyVGrid](https://developer.apple.com/documentation/swiftui/lazyvgrid) and [LazyHGrid](https://developer.apple.com/documentation/swiftui/lazyhgrid). [LazyVGrid](https://developer.apple.com/documentation/swiftui/lazyvgrid) is used for creating vertical grids and [LazyHGrid](https://developer.apple.com/documentation/swiftui/lazyhgrid) is used for horizontal grids. The keyword **Lazy** means that the grids view does not create items for the grid until they are needed to appear on screen. This allows our app to have much faster loading times when using grids!

In this post we are going to look at how to make a **LazyVGrid**. All the examples in this post can be applied to **LazyHGrid**.

There are three things we need to make a **LazyVGrid**.

1. We need a list of data to display
2. We need a **GridItem**. This defines how we want the layout to look
3. We need to choose if we want our grid to be vertical or horizontal

    private var gridLayout = \[
        GridItem(.flexible()),
        GridItem(.flexible())
    \]

Above we are creating the **gridLayout** variable which is an array of **GridItem**'s. We will use this variable to set the layout we want for our grid. Later we will talk about the **.flexible()** but for now don't worry.

In this example we want two columns in our grid. The more **GridItem**'s we add to the array will mean more columns of our data to be displayed on the screen. We can add as many columns as our display can handle but for this example we are going to use two columns.

Next we need to add a **ScrollView** and our **LazyVGrid**.

    private var gridLayout = \[
        GridItem(.flexible()),
        GridItem(.flexible())
    \]
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: gridLayout, spacing: 20) {
                ForEach((1...100), id: \\.self) {
                    Text("\\($0)")
                        .font(.title)
                        .foregroundColor(Color.white)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                        .background(Color.red)
                }
            }
            .padding(.all, 10)
        }
    }

In the above code we are applying our **gridLayout** variable to our **LazyVGrid** with a spacing of 20. Then we are adding a ForEach statement that will display numbers in a text view from 1 to 100 and we added a little styling to the text view.

Now if we run the code above we should get two columns of numbers in a vertical grid like in the image below.

![](https://swifttom.com/wp-content/uploads/2020/07/screen-shot-2020-07-31-at-5.34.42-pm.png?w=541)

In the above example we used the **flexible** lazy grid style. This **flexible** style allows us to specify how big we want each item to be and also lets us control of how many columns we want to display. There are two other types of grid styles called **fixed** and **adaptive**.

The **fixed** grid type will make any of our column's fixed to a particular width size. To show this in an example we are going to run the same code as above but switch our first **GridItem** style.

    private var gridLayout = \[
        GridItem(.fixed(100)),
        GridItem(.flexible())
    \]

![](https://swifttom.com/wp-content/uploads/2020/08/screen-shot-2020-08-02-at-2.48.36-pm.png?w=588)

You can now see that our first **GridItem** in our grid will always have a **fixed** width of 100, while the **flexible** style on the second **GridItem** will take up the rest of the row space.

Next we have the **adaptive** grid layout which will take a minimum width and display as many rows as it can on the screens layout.

    private var gridLayout = \[
        GridItem(.adaptive(minimum: 100)),
    \]

![](https://swifttom.com/wp-content/uploads/2020/08/screen-shot-2020-08-02-at-2.53.55-pm.png?w=549)

All of these same methods for customizing **LazyVGrid** can be used when creating **LazyHGrid**. A reminder you can only use this style of lazy grids in apps supporting iOS 14 and above.

Hope this helps you to be more lazy with your grids!

😴🛌 Happy Coding 😴🛌
