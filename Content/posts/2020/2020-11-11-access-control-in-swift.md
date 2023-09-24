---
title: "Access Control in Swift"
date: 2020-11-11 00:00
tags: Swift, Xcode
---
# Access Control in Swift

What is Access Controls in Swift? According to the documentation **"Access control restricts access to parts of your code from code in other source files and modules. This feature enables you to hide the implementation details of your code, and to specify a preferred interface through which that code can be accessed and used."** We can implement access controlS by adding five different types of modifiers to our code. These modifiers are:

- **Public:** Which means anyone can read and write to this property.
- **Internal:** This is the default access control for any property we create. This allows us access within the same module.
- **File Private:** Like the name says, this modifier allows us to only access this property within the same file.
- **Private:** This is the most restrictive. This only allows access within the current enclosing it is being used in.
- **Open:** This is the most unrestricted. This property can be accessed from anywhere and other developers can subclass it and/or override it.

If you would like a deeper dive into Access Control check out the [Swift Documentation](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html) on it.

Thanks for reading and I hope this gives you a better understand of when to use Access Controls in Swift.

Happy Coding!!!
