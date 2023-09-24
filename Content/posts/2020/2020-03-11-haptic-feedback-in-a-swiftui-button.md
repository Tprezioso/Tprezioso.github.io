---
title: "Haptic Feedback in a SwiftUI Button"
date: 2020-03-11 00:00
tags: Swift, SwiftUI
---
# Haptic Feedback in a SwiftUI Button

In this post we are going to see how we can add haptic feedback to a button in SwiftUI. Apple gives us preset haptic options for us to choose from in the UINotificationFeedbackGenerator class. The haptics we can choose from are as follows:

- .success
- .error
- .warning
- .light
- .medium
- .heavy
- selectionChanged()

_NOTE: You will need to run this code on a iPhone otherwise you will not be able to feel the different vibrations._

Let's start out by opening a new Xcode project and go to our contentView.swift file.

First thing is we will need to create a UINotificationFeedbackGenerator called generator.

let generator = UINotificationFeedbackGenerator()

Next replace the default "Hello World" text label with a button. In the action section of the button we are going to set our feedback generator. Lastly we will add some text to the button label that just says "Success".

        Button(action: {
            self.generator.notificationOccurred(.success)
        }) {
            Text("Success")
        }

Now if we run this on our iPhone you will see a button in the middle of the screen that says "Success". If you tap the Success button you will feel the success haptic vibration feedback.

Awesome!!

Now let us test out the rest of the different haptic vibrations. Let's add our success button to a VStack and add the following code.

        VStack(alignment: .center, spacing: 30.0) {
            Button(action: {
                self.generator.notificationOccurred(.success)
            }) {
                Text("Success")
            }
            
            Button(action: {
                self.generator.notificationOccurred(.error)
            }) {
                Text("Error")
            }
            
            Button(action: {
                self.generator.notificationOccurred(.warning)
            }) {
                Text("Warning")
            }
            
            Button(action: {
                let impactLight = UIImpactFeedbackGenerator(style: .light)
                impactLight.impactOccurred()
            }) {
                Text("Light")
            }
            
            Button(action: {
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
            }) {
                Text("Medium")
            }
            
            Button(action: {
                let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                impactHeavy.impactOccurred()
            }) {
                Text("Heavy")
            }
            
            Button(action: {
                let selectionFeedback = UISelectionFeedbackGenerator()
                selectionFeedback.selectionChanged()
            }) {
                Text("Selection Feedback Changed")
            }
        }
        .padding(.all, 30.0)
    }

Now if you run this code on your device you will get a list of buttons that we can tap through to see the different haptic feedbacks we can use!

For a little bit of a deeper dive check out this [article](http://bit.ly/2IDOWW7). It helped me research this post and also thanks to Harry Harrison's gist that I found on Github. I used and edited his gist to demonstrate this article. Here is the full code in my fork of the [gist](http://bit.ly/2IGtZdg).

Hope this helps shake up your next coding project! 😅

Happy Swift Coding!

👨🏻‍💻💻
