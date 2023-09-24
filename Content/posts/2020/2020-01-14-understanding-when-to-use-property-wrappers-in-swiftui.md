---
date: 2020-01-14 00:00
title: "Understanding When to Use Property Wrappers in SwiftUI"
tags: Swift, SwiftUI
---
# Understanding When to Use Property Wrappers in SwiftUI

What are property wrappers? Property wrappers in SwiftUI can be described as _@_State, @Binding, @ObservedObject, @EnvironmentObject, and @Environment. Let's go through each one and get a better understanding of how to use these property wrappers to help us program in SwiftUI.

**Property Wrappers**:

Property Wrappers are defined as properties with logic which can be reused across different codebases.

**@State :**

@State is a one of the property wrappers in which we can use it to describe a views state. SwiftUI uses internal memory to store the state outside of the view struct. Only the view where the state is declared in has access to the state. When the state changes SwiftUI will rebuild the whole view to whatever the state has changed too.

**@Binding** **:**

@Binding creates a reference to a value similar to @State. Bindings are best explained and used in a example of a parent view having its state accessible to its child view. We use $ symbol to pass a binding reference, because without $ Swift will pass the value as a copy of the value instead of passing bindable reference.

**@ObservedObject :**

@ObservedObject is like @State but can be used in multiple views. When that @ObservedObject changes SwiftUI will rebuild all views that have a reference to that object in it. SwiftUI watches for the changes on ObservableObject's with the help of @Published property wrapper. @Published is the reference used to watch ObservableObject's, when a property marked with @Published changes SwiftUI rebuilds all Views bound to that to that object.

**@ EnvironmentObject :**

Instead of using ObservableObject all over your app for updating views we can use the @EnvironmentObject for of our view hierarchy. By doing this, we create the opportunity for all children views to have access to our @EnvironmentObject. @EnvironmentObject uses dynamic member lookup to find class instances in the environment. This helps in not having to pass the @EnvironmentObject from view to view.

**@Environment :**

Lastly the @Environment is a way we can easily access system-wide settings. Examples of system settings like Locale and Calendar are controlled with the @Environment property wrapper. If these system setting are to change SwiftUI will react and rebuild or view automatically.

These are property wrappers in SwiftUI. It can be confusing at first but the more you uses these property wrappers the better off you will be at knowing where and when to use them. I hope this helps to understand property wrappers in SwiftUI. Happy Coding! 👨🏻‍💻📱💻
