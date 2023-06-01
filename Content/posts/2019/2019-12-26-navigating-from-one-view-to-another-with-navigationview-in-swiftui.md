---
date: 2019-12-26 00:00
title: "Navigating from One View to Another with NavigationView in SwiftUI"
tags: Swift, SwiftUI
---
# Navigating from One View to Another with NavigationView in SwiftUI

In this article we are going to learn how to use the NavigationView library to navigate from one view to another in SwiftUI. We will look at the most basic way to transition from a view using a button and a NavigationLink.

First thing we will need to do is add NavigationView into our body view. In the code below we wrapped our Vstack in a Navigation View. Then we added a Navigation Link which will be our button to send us to the next view. The parameter in the NavigationLink is destination. We will set this to the view we want to see when the button is pressed.

import SwiftUI

struct ContentView : View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Main Content View")
                    .font(.largeTitle)
                Spacer()
              // Button to make a transition to the next view
                NavigationLink(destination: DetailView()) {
                    Text("Detail View")
                    .frame(minWidth: 0, maxWidth: 300)
                    .padding()
                    .font(.title)
            }
          }
        }
    }
}

Next we will create a new SwiftUI file and name it DetailView. In your second view or DetailView we are just going to setup a text view so we have something to see when we transition to the new view.

import SwiftUI

struct DetailView: View {
    var body: some View {
        Text("I'm, The Detail View!")
            .font(.largeTitle)
    }
}

If you run the code now you should see our main view text at the top with our Detail View button at the bottom. Tap on the button and we should be taken to the Detail view. You will notice that when we use NavigationView we get the back button when we transition for free so we can navigate back to our main view (You also get swipe to go back as well).

That's really all there is to setting up navigation in SwiftUI! Happy Coding! 💻📱👨🏻‍💻🎉
