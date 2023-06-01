---
title: "How to Set an Image as a WatchOS Complication"
date: 2020-07-13 00:00
tags: Swift, WatchOS
---
# How to Set an Image as a WatchOS Complication

The reason I'm writing this post is because I had submitted a WatchOS side project I was working on ([Status of Github)](https://apps.apple.com/us/app/status-of-github/id1493860473) to the app store. The problem was that I submitted the app with all complications activated but had no image or placeholders for the complications (How embarrassing 🤦🏻‍♂️). So let's jump into the project and fix this issue by setting a image to our complications.

Let's get started by going into the WatchOS project folder at the top of our file navigation.

We need to select the **General** tab at the top and then scroll down to the **Complication Configuration** section.

Next we will select which complications we want to support for our project.

![](https://swifttom.com/wp-content/uploads/2020/07/screen-shot-2020-07-10-at-5.56.07-pm.png?w=1024)

Now we will need to add the image we want to use to the **Assets** folder in the **WatchKit Extension** part of our WatchOS app.

![](https://swifttom.com/wp-content/uploads/2020/07/screen-shot-2020-07-10-at-5.52.12-pm.png?w=528)

In the **Assets** folder you will see another folder named **Complication**.

![](https://swifttom.com/wp-content/uploads/2020/07/screen-shot-2020-07-10-at-6.06.01-pm.png?w=1024)

In this folder we will add the image that we want to show for the complication types we chose to support in the **Complication Configuration**.

I would recommend checking out Apple's [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/watchos/overview/complications/) to get the right dimensions for each complication so we have the right size image to display.

Now we will move on to the **Complication Controller** file where we will set the image from our assets folder to our complications.

![](https://swifttom.com/wp-content/uploads/2020/07/screen-shot-2020-07-10-at-6.10.35-pm.png?w=1024)

    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry

        if complication.family == .circularSmall {
            let template = CLKComplicationTemplateCircularSmallRingImage()
            guard let image = UIImage(named: "Complication/Circular") else { handler(nil); return}
            template.imageProvider = CLKImageProvider(onePieceImage: image)
            let timelineEntry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            handler(timelineEntry)
            
        } else if complication.family == .utilitarianSmall {
            let template = CLKComplicationTemplateUtilitarianSmallRingImage()
            guard let image = UIImage(named: "Complication/Utilitarian") else { handler(nil); return}
            template.imageProvider = CLKImageProvider(onePieceImage: image)
            let timelineEntry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            handler(timelineEntry)
            
        } else if complication.family == .modularSmall {
            let template = CLKComplicationTemplateModularSmallRingImage()
            guard let image = UIImage(named: "Complication/Modular") else { handler(nil); return}
            template.imageProvider = CLKImageProvider(onePieceImage: image)
            let timelineEntry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            handler(timelineEntry)
            
        } else if complication.family == .graphicCircular {
            let template = CLKComplicationTemplateGraphicCircularImage()
            guard let image = UIImage(named: "Complication/GraphicCircular") else { handler(nil); return}
            template.imageProvider = CLKFullColorImageProvider(fullColorImage: image)
            let timelineEntry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            handler(timelineEntry)
            
        } else if complication.family == .graphicCorner {
            let template = CLKComplicationTemplateGraphicCornerCircularImage()
            guard let image = UIImage(named: "GraphicCorner") else { handler(nil); return}
            template.imageProvider = CLKFullColorImageProvider(fullColorImage: image)
            let timelineEntry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            handler(timelineEntry)

        } else {
            handler(nil)
        }

    }

In the code above we created a image template for each of the complications. Then we set our image to the template. Lastly we set our temple to a complication timeline entry so that it can be displayed to the watch face.

Now let's run our code in the simulator and go to the watch face home screen.

Here we can press and hold on the screen to customize the watch face and set our new complication.

Now that our complication is on our watch face, we can simply tap on our complication and we will be take directly into our app!

![](https://swifttom.com/wp-content/uploads/2020/07/simulator-screen-shot-apple-watch-series-5-44mm-2020-07-11-at-17.26.27.png?w=368)

I hope this helps you from making the same mistake I made!

If you want to learn more about complications in WatchOS I highly recommend checking out this WWDC15 video called [Creating Complications with ClockKit](https://developer.apple.com/videos/play/wwdc2015/209/).

⌚️ Happy Coding! ⌚️
