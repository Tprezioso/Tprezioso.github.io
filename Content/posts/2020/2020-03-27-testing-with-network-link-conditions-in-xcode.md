---
title: "Testing with Network Link Conditions in Xcode"
date: 2020-03-27 00:00
tags: Xcode
---
# Testing with Network Link Conditions in Xcode

Testing how your app works in different networking conditions is really important before you release an app. As of Xcode 11, testing different network conditions built right to make our lives easier.

First thing we need to do is connect our device with Xcode. Then we need to load the app we want to test on to our device. After that we need to go to the top of the screen and click on Window drop down and then go to Devices and Simulator.

![](https://swifttom.com/wp-content/uploads/2020/03/screen-shot-2020-03-22-at-10.31.57-am.png?w=1024)

Next in Devices and Simulator you should see your connected device. While the app is connected and running you can now scroll down to the bottom and see device conditions.

![](https://swifttom.com/wp-content/uploads/2020/03/deviceconditionsxcode.png?w=1024)

In device conditions click on the profile drop down. You will see a list of networking conditions that you can use to change the networking speed.

Once you selected your networking condition you then want then press the start button. Your app will now be running at that networking speed that you have selected.

When your done testing remember to stop the device condition or else you will have poor networking on your device.

You can do this same network testing on the device itself. If you go to your iPhone/iPads settings app. Go to Developer > Network Link Conditioner > Enable.

![](https://swifttom.com/wp-content/uploads/2020/03/img_8656.png?w=473)

![](https://swifttom.com/wp-content/uploads/2020/03/img_8657.png?w=473)

Once enabled, you now can add a profile to test on device just like we did in Xcode.

That's all there is too it.

Happy Testing 👨🏻‍💻
