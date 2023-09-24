---
date: 2019-11-19 00:00
title: "How to display a Modal View in SwiftUI"
tags: Swift, SwiftUI
---
# How to display a Modal View in SwiftUI

In SwiftUI, to present a modal view we need to use a new display modifier called sheets. To present a view modally we first need to start by creating a new SwiftUI file and name it ModalPresentedView. Go to File > New > File and choose iOS > User Interface > SwiftUI View. Then add the code below to our Modal view.

struct ModalPresentedView: View {
    @Binding var showModal: Bool
    
    var body: some View {
        VStack {
            Text("Inside Modal View")
                .padding()
            Button("Dismiss") {
                self.showModal.toggle()
            }
        }
    }
}

What we are doing in the code above is adding a binding property which will be used toggle the modal view to show and dismiss. I also added a button to dismiss the modal view.

Next we will change the code in the content view file to present our new modal view.

struct ContentView: View {
    @State private var showModalView = false
    
    var body: some View {
       Button("Show View") {
          self.showModalView.toggle()       
       }.sheet(isPresented: $showModal) {
            ModalPresentedView(showModal: self.$showModal)
        }
    }
}

What we did in the above code is we added a state property which will control the presenting of the modal view when toggled. We also added a button that toggles the state of our modal view and presents it with the sheet modifier.

Now press the resume button in the canvas view. Press the play button to run a live preview of your code and you should have the “show modal” button to present the modal. A swipe down will dismiss the modal or you can use the “Dismiss” button to remove the view.
