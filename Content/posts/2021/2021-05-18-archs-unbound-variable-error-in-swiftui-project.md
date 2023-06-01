---
title: "ARCHS[@]: unbound variable" error in SwiftUI Project"
date: 2021-05-18 00:00
tags: Swift, SwiftUI, Mac, Xcode
---
# "ARCHS[@]: unbound variable\" error in SwiftUI Project
Recently I ran into an error when trying to run a SwiftUI Project on my iPhone. I'm running this project on a **M1 Macbook Pro**. The error seemed to start happening when my project started using certain **Cocoapods**. The error reads "**ARCHS\[@\]: unbound variable**".

To fix this error all you need to do is navigate to the **Project File** **\>** **Info** **\>** **Excluded Architecture**. If in **Excluded Architecture** you see **arm64**, all you need to do is remove the **arm64** and reload your Xcode project.

![](/images/Screen-Shot-2021-05-18-at-1.06.06-PM-1024x303.png)

Hope this quick post helps anyone struggling with this weird error in your SwiftUI project. If this doesn't help please check out this [stack overflow post](https://stackoverflow.com/questions/64474801/archs-unbound-variable-in-xcode-12).

Happy coding!
