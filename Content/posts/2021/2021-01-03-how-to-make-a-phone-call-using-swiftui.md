---
title: "How to Make a Phone Call using SwiftUI"
date: 2021-01-03 00:00
tags: Swift, SwiftUI
---
# How to Make a Phone Call using SwiftUI

Making a phone call from a SwiftUI app is easy and only takes a few lines of code to implement. All we need to do is setup a button that will open the phone app and make a phone call with a phone number we pass in.

Let's look at some code below to see what we need to implement this.

```

struct ContentView: View {

    var phoneNumber = "718-555-5555"

    var body: some View {
        VStack {
            Button(action: {
                let phone = "tel://"
                let phoneNumberformatted = phone + phoneNumber
                guard let url = URL(string: phoneNumberformatted) else { return }
                UIApplication.shared.open(url)
               }) {
               Text(phoneNumber)
                .foregroundColor(.blue)
            }
        }
    }
}
```

In the example above we first create a string variable with the phone number we would like to use. Next we create a button and within the action of our button we format the phone number to our URL. The "**tel://**" is the url needed to tell our device to open the phone app and make a call. (_We can use the same code above to open other apps on our device. For example if we wanted to open the mail app we just need to replace the url with **messages://** instead of **tel://**_)

Next we have a **guard let** statement to check to see if we have a formatted phone number. Then we use **UIApplication** to open the phone app and make a call using the url with the phone number we passed in. Lastly we set our button label to show the phone number we want to call.

(_Side note: We will need to run this on a device to test because the simulator can not make phone calls._)

That is all that we need to make a phone call from our SwiftUI app. Hope this helps you on your next SwiftUI project!

Thanks for reading!

☎️📱🤳Happy coding ☎️📱🤳
