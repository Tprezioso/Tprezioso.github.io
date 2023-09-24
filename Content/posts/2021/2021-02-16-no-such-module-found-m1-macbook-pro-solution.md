---
title: "No Such Module Found (M1 Macbook Pro Solution)"
date: 2021-02-16 00:00
tags: Xcode, Mac
---

# No Such Module Found (M1 Macbook Pro Solution)

Recently I have been working on a new project with my new M1 Macbook Pro. In this project I needed to use third party libraries such as **FBSDKCoreKit** (Facebook) so the user could sign in with their Facebook account. The problem I ran into was that no matter what I did the [Cocoapods](https://cocoapods.org/) I loaded into my project would not run. Xcode would give me error messages such as "**No such module found**" or "**module 'FBSDKCoreKit' not found**".

After hours of googling and looking at Github issues on the topic, I found the solution. If you are running into this problem on a M1 Mac you need to open Xcode using **Rosetta**. What is **Rosetta**? Without getting too technical **Rosetta** allows the new M1 Mac's to run x86 architecture apps. For a deeper dive into Rosetta check out the link [here](https://www.computerworld.com/article/3597949/everything-you-need-to-know-about-rosetta-2-on-apple-silicon-macs.html). If you need to install Rosetta 2 on your M1 Mac click on this link [here](https://osxdaily.com/2020/12/04/how-install-rosetta-2-apple-silicon-mac/) and follow the tutorial.

Now to fix this issue we need to go into our **Finder** > **Applications** **\>** and right click (command ⌘ + click) on Xcode. Then we need to select "**Get Info**"

![](/images/Screen-Shot-2021-02-16-at-9.21.05-AM.png)

Once we have the **"Get Info**" window opened, we then need to click on "**Open using Rosetta**"

![](/images/Screen-Shot-2021-02-16-at-9.23.02-AM.png)

Now if we relaunch our Xcode and build our project we shouldn't see anymore errors like "**Module not Found**". I hope this helps save you some time and headaches.

Thanks for reading. Happy Coding!
