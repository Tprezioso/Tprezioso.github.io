---
title: "How to Add Sign In with Apple to a SwiftUI Project"
date: 2020-09-28 00:00
tags: Swift, SwiftUI
---
# How to Add Sign In with Apple to a SwiftUI Project

**Sign in with Apple** makes it safe and secure for users to login to websites and apps. We can implement [Sign in with Apple](https://developer.apple.com/documentation/sign_in_with_apple?language=data) easily with SwiftUI 2. For us to use **Sign in with Apple** in our app we are required to use **iOS 14** or later and **Xcode 12** or later.

The first thing we need to do is go to our project file which is located at the top of our navigator on the left side of Xcode. Then we need to go to the **Signing & Capabilities** tab. In the left corner of this tab we need to click on the **+ Capability** button and type in Sign in with Apple. Then press enter to add it to our project.

![](https://swifttom.com/wp-content/uploads/2020/09/screen-shot-2020-09-28-at-12.13.37-pm.png?w=1024)

Now let's navigate to our **ContentView.swift** file to get started.

We need to open our library to get a **Sign in with Apple** Button for our project. We can use the keyboard shortcut **Command + Shift + L** to bring up our library. In the search bar we can type in Sign in with Apple and drag and drop our **Sign in with Apple** button into either our code or onto our canvas.

![](https://swifttom.com/wp-content/uploads/2020/09/screen-shot-2020-09-28-at-10.29.10-am.png?w=1024)

Now you might have a error pop up that says Xcode can not find **Sign in with Apple** in our scope. All you have to do to get rid of this error is **import AuthenticationServices** at the top of our **ContentView.swift** file. Now let's add the code in the example below to our project and we will walk through what we are implementing in our app.

import SwiftUI
import AuthenticationServices

struct ContentView: View {
    var body: some View {
        SignInWithAppleButton(
            // 1.
            onRequest: { request in
                request.requestedScopes = \[.fullName, .email\]
            },
            onCompletion: { result in
                switch result {
                // 2.
                case .success (let authenticationResults):
                print("Authorization successful! :\\(authenticationResults)")

                // 3.
                case .failure(let error):
                    print("Authorization failed: " + error.localizedDescription)
                }
            }
            // 4.
        ).frame(width: 200, height: 50, alignment: .center)
    }
}

1. Here we are specify what kind of information we would like to get from our user. In this example we are requesting the users full name and email address to be used in our app.
2. If the request goes through successfully we can then gain access to the users information we requested. This would be the users full name and email address.
3. If something goes wrong this is where we will be able to show a error message to our user and notify them that something has gone wrong with using Sign in with Apple.
4. Lastly we are setting the frame of our button so our button won't take up the whole screen.

Now when we run our app we should see a **Sign in with Apple** button.

![](https://swifttom.com/wp-content/uploads/2020/09/simulator-screen-shot-iphone-11-pro-2020-09-28-at-12.06.50.png?w=473)

When we tap on our button we should be prompted to authenticate using our full name and email.

![](https://swifttom.com/wp-content/uploads/2020/09/simulator-screen-shot-iphone-11-pro-2020-09-28-at-12.24.44-1.png?w=473)

We can switch the Sign in button to be a **Continue with Apple** button or a **SignUp with Apple** button by simply adding the following code at the top of our existing code.

import SwiftUI
import AuthenticationServices

struct ContentView: View {
    var body: some View {
        SignInWithAppleButton(
            // Add this below for Sign up with Apple button
            .signUp,
            
            onRequest: { request in
                request.requestedScopes = \[.fullName, .email\]
            },
            onCompletion: { result in
                switch result {
                case .success (let authenticationResults):
                print("Authorization successful! :\\(authenticationResults)")
                case .failure(let error):
                    print("Authorization failed: " + error.localizedDescription)
                }
            }
        ).frame(width: 200, height: 50, alignment: .center)
    }
}

![](https://swifttom.com/wp-content/uploads/2020/09/simulator-screen-shot-iphone-11-pro-2020-09-28-at-12.45.07.png?w=473)

struct ContentView: View {
    var body: some View {
        SignInWithAppleButton(
            // Add this below for Continue with Apple button
            .continue,
            
            onRequest: { request in
                request.requestedScopes = \[.fullName, .email\]
            },
            onCompletion: { result in
                switch result {
                case .success (let authenticationResults):
                print("Authorization successful! :\\(authenticationResults)")
                case .failure(let error):
                    print("Authorization failed: " + error.localizedDescription)
                }
            }
        ).frame(width: 200, height: 50, alignment: .center)
    }
}

![](https://swifttom.com/wp-content/uploads/2020/09/simulator-screen-shot-iphone-11-pro-2020-09-28-at-12.46.40.png?w=473)

That's all there is to adding **Sign in with Apple** to our SwiftUI project. This blogs code can be found on my [Github](https://github.com/Tprezioso/Sign-In-with-Apple-SwiftUI-for-Blog). If you want to see how we can implement **Sign in with Apple** in **UIKit** please check out my other [blog post](https://swifttom.com/2020/04/19/how-to-implement-sign-in-with-apple-in-swift/).

Thanks for reading and I hope this helps you on your next SwiftUI project!

꩜💻👨🏻‍💻 Happy Coding! 👨🏻‍💻💻꩜
