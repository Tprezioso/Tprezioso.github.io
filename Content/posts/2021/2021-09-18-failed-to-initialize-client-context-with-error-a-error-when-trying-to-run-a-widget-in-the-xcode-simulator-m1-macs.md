---
title: "'Failed to initialize client context with error': A Error When Trying to Run a Widget in the Xcode Simulator (M1 Macs)"
date: 2021-09-18 00:00
tags: Xcode, Mac
---
# 'Failed to initialize client context with error': A Error When Trying to Run a Widget in the Xcode Simulator (M1 Macs)
This is a short post about an issue I recently had with updating a widget for a SwiftUI project. I kept getting a weird error every time I tried to run a widget target in the simulator. The error read "**Failed to initialize client context with error**". This was followed by a crazy long error message spit out by the debug console in Xcode. I googled everything and I finally found the solution! (**Note: This only happened on my M1 Mac**)

What you need to do to fix this error is toggle off the "**Open using Rosetta**" button. To do that you need to right click on the Xcode app icon and go to **"Get Info"**. In the Get Info window you are going to want to toggle off the "**Open using Rosetta**" button. Now if you quit Xcode and reopen, you shouldn't see that error pop up again. Go re-run the widget in the simulator and VOILÀ!

Until Apple fixes all the weird errors with supporting both **Intel** and **M1** chips for Xcode, you might need to toggle on and off "**Open using Rosetta**".

I really hope this helps you from losing your mind googling for an answer to this solution!

Thanks for reading!

![](/images/Screen-Shot-2021-09-17-at-7.35.52-PM-444x1024.png)
