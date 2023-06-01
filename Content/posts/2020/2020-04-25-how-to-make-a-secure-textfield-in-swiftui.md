---
title: "How to make a Secure TextField in SwiftUI"
date: 2020-04-25 00:00
tags: Swift, SwiftUI
---
# How to make a Secure TextField in SwiftUI

A secure textfield allows us to display a editable text area that hides the text the user inputs. In this post I will show you how easy it is to implement a secure textfield in a SwiftUI project.

First we will need to open a SwiftUI project. Next we will need to copy the code below into our ContentView.swift file

import SwiftUI

struct ContentView: View {
    
    // 1.
    @State private var password: String = ""
    @State var buttonPass: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Login")
                .font(.headline)
            
            // 2.
            SecureField("Enter Your Password", text: $password)
                .padding(.all)
                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                .cornerRadius(10)

           // 3.
            HStack {
                Spacer()
                Button(action: {
                    self.buttonPass = self.password
                    
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                }
                .frame(width: 150)
                .padding(.all)
                .background(Color.green)
                .cornerRadius(10)
                Spacer()
            }

            // 4.
            Text("\\(buttonPass)")
        }.padding()
        
    }
    
}

So what's going on in the code above is:

1. We are creating @State property which will represent the entered text inside the textfield. Our other @State property is for passing our password to a label once the login button is pressed.
2. Create a SecureField with our placeholder text.
3. Making a button that when tapped will display our password.
4. Our Text where we will display the password.

Now if we go to our preview canvas and run our code you will see our login secure textfield and our login button. Type a password in and tap the login button. You should see something like the example below.

![](https://swifttom.com/wp-content/uploads/2020/04/screen-shot-2020-04-26-at-6.23.43-pm.png?w=502)

In just a few lines of code we now have a secure textfield to handle passwords or any other secure text in SwiftUI.

Hope this quick look at secure textfields helps to secure your project!

👮🏻‍♂️🚨Happy coding! 🚨👮🏻‍♂️
