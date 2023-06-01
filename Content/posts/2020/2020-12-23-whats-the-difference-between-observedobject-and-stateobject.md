---
title: "What’s the Difference between @ObservedObject and @StateObject"
date: 2020-12-23 00:00
tags: Swift, SwiftUI
---
# What’s the Difference between @ObservedObject and @StateObject

**@StateObject** and **@ObservedObject** are very similar in that they both keep track of an objects state. The difference is **@**StateObject**** is owned by the view it was created in where as **@ObservedObject** is owned by another view.

An example of when to use **@ObservedObject** is to keep track of external classes so the view can be updated when a change occurs. We would want to use an **@ObservedObject** for something like fetching new data from an API or a database.

We want to use **@StateObject** when we want the view to keep track of its own objects state. A example of how we would use **@StateObject** is if we had something like a number counter in a view and we wanted to keep track of the count as the numbers changed.

I hope this helps you better understand the difference between when to use **@ObservedObject** and **@StateObject**.

For a deeper dive into **@StateObject** vs **@ObservedObject** checkout these great articles by [Donny Wals](https://www.donnywals.com/whats-the-difference-between-stateobject-and-observedobject/) and [Swapnanil Dhol](https://swapnanildhol.medium.com/stateobject-vs-observedobject-in-swiftui-40499592853).

Thanks for reading and happy coding 👨🏻‍💻👨🏻‍💻👨🏻‍💻
