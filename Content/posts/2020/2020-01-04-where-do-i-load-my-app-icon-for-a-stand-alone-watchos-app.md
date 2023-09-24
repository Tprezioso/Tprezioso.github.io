---
date: 2020-01-04 00:00
title: "Where Do I Load My App Icon for a stand alone WatchOS App?"
tags: Swift, SwiftUI
---
# Where Do I Load My App Icon for a stand alone WatchOS App?

Recently I have been work on a little side project using SwiftUI in a stand alone watchOS app. When building my watchOS I was confused as to where I put the icon for my app since there are two Asset.xcassets file.

One asset file is in the main Watchkit project folder and the other can be found in the WatchKit project extension folder (This is the main area for coding your stand alone watchOS app).

The main Watchkit project folder is the one you want to add your app icon images too. Do yourself a favor and don't create your own like I did in the Watchkit extension and make a bunch of error messages popup. 🤦🏻‍♂️

Hope this saves some people from some pretty bad headaches. Don't make the same mistake I did! Happy Coding! 👨🏻‍💻💻 ⌚️
