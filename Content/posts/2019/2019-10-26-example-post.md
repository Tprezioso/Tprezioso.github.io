---
date: 2019-10-26 00:00
title: "What is a SceneDelegate in Swift?"
tags: Swift
---
# What is a SceneDelegate in Swift?

In short the SceneDelegate.swift file is there to help with the new multi-window support that was announced with iOS 13.

The UISceneDelegate protocol is used to manage the life cycle for one instance of your app. Apple gave a good example of this when showing multiple instances of their notes app in split screen alongside other apps at the [WWDC keynote](https://developer.apple.com/videos/play/wwdc2019/212/).

Think of SceneDelegate as a offshoot of the AppDelegate. The AppDelegate will still handle things like configuring the initial scenes and register for services like push notifications but now the AppDelegate will be sharing its responsibility of the apps life cycle with the SceneDelegate.

Things like state transition methods or life cycle methods that use to be handled in the AppDelegate, like "will enter foreground", "will become active", and "when it enters the background" are now handled in the SceneDelegate.

For a more indepth look into the SceneDelegate and all the changes to the AppDelegate I recommend reading this great [article by Reinder de Vries](https://learnappmaking.com/scene-delegate-app-delegate-xcode-11-ios-13/). Reinder takes a deep dive look into how to get started using the SceneDelegate and what has changed in iOS 13.
