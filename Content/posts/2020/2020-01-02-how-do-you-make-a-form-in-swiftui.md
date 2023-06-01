---
date: 2020-01-02 00:00
title: "How Do You Make a Form in SwiftUI?"
tags: Swift, SwiftUI
---
# How Do You Make a Form in SwiftUI?

In this tutorial we are going to look at how to make a Form in SwiftUI. The Form view helps make things like sign in sheets very simple and fast to setup in your app. With just a few simple lines of code you will have a form up and running. Let's get started with making a contact form sheet.

Open a new Xcode project and in your ContentView file change the code to the following code below.

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                // Form fields go here
            }.navigationBarTitle(Text("Contact Info"))
        }
    }
}

Above we added a NavigationView so we can have a nice Navigation title for our view. Then we added the Form view so we can setup taking in the information for our contact form.

Next we will add some text fields so we can take in a first name and a last name for our contact form. First we will make state variables for our first and last name text fields outside of our body view.

@State private var firstname = ""
@State private var lastname = ""

We make these @State properties so we can bind them to the text field views to update changes. Next we will add our text fields to our Form.

var body: some View {
    NavigationView {
        Form {
            TextField("Firstname", text: $firstname)
            TextField("Lastname", text: $lastname)
        }.navigationBarTitle(Text("Contact Info"))
    }
}

If we run this code now you should get a view with our title view and two text fields. The text fields should show up one on top of the other with labels that say "First Name" and "Last Name".

![](https://swifttom.com/wp-content/uploads/2020/01/simulator-screen-shot-iphone-11-pro-max-2020-01-01-at-19.59.27.png?w=473)

Next in our contact form we will create a picker to set the primary way of getting in contact with this user. We will create a struct of primary contact options (added this code outside of our Struct for our Content view).

struct PrimaryContact {
    static let userPrimaryContact = \[
        "Phone Number",
        "Text Message",
        "Email",
        "Skype",
        "Carrier Pigeon"
    \]
}

Next we will set up a State property for our primary way of getting in contact. Add the following code below the lastname state property.

@State private var primaryContact = ""

Now we will added our picker below our last name text field like this

    var body: some View {
        NavigationView {
            Form {
                TextField("Firstname", text: $firstname)
                TextField("Lastname", text: $lastname)
                Picker(selection: $primaryContact,
                       label: Text("Primary Contact")) {
                        ForEach(PrimaryContact.userPrimaryContact, id: \\.self) { primaryContact in
                            Text(primaryContact).tag(primaryContact)
                        }
                }
            }.navigationBarTitle(Text("Contact Info"))
        }
    }

Above we are binding the picker to our primary contact state. When a primary contact is selected the changes will automatically be updated by the view.

Now when we run our app we should be able to see a picker view below our "First Name" and "Last Name" text field. When we tap on the "Primary Contact's" button we will see our preset primary contact preferences that we made in our struct. After you select one by tapping, we can go back to the main form view and see the one you selected shows up on the opposite side from the "Primary Contact" label.

![](https://swifttom.com/wp-content/uploads/2020/01/simulator-screen-shot-iphone-11-pro-max-2020-01-01-at-20.01.57-2.png?w=473)

![](https://swifttom.com/wp-content/uploads/2020/01/simulator-screen-shot-iphone-11-pro-max-2020-01-01-at-20.02.01-1.png?w=473)

![](https://swifttom.com/wp-content/uploads/2020/01/simulator-screen-shot-iphone-11-pro-max-2020-01-01-at-20.02.56-1.png?w=473)

Next we will add a very common form field which is a toggle view. This toggle will control if we want to share this contact publicly. Like we did with the picker view, we will first add a state property to handle any changes to our toggle.

@State private var publiclyShare = false

We set the state of the toggle to false otherwise the toggle would start out already being turned on in our form. Now we will add our toggle view to our form. Add the following code below the picker view.

Toggle(isOn: $publiclyShare,
       label: {
           Text("Publicly Share Contact")
})

Like we did for the picker view we bind the toggle view with $publiclyShare variable to update our view if toggled. If you build and run now you will see our toggle view below our picker.

![](https://swifttom.com/wp-content/uploads/2020/01/simulator-screen-shot-iphone-11-pro-max-2020-01-01-at-20.04.01-1.png?w=473)

The last important form input field is a stepper view. We will add a contact rating as our stepper view (Always rate 5 stars to the contacts that you like 😂). Like we did previously we will again add some state to update the view when the user has tapped the stepper. Add the following code below your other state properties.

@State private var rating = 0

I set the rating to 0 for now but we will soon add a range from 0 - 5. Now added the following code underneath the toggle view code.

Stepper(value: $rating, 
        in: 0...5, 
        label: {
    Text("Rating: \\(self.rating)")
})

Above we bind the stepper to our rating property. Then we provide the range for our ratings (0 - 5). And last we add a label to name our stepper.

If you run your app now you should see a stepper starting at 0. On the opposite side you should see the plus and minus symbol which on being tapped to should make our rating go up and down for our contact.

![](https://swifttom.com/wp-content/uploads/2020/01/simulator-screen-shot-iphone-11-pro-max-2020-01-01-at-20.05.38-1.png?w=473)

Below is the completed code for our SwiftUI Form file.

import SwiftUI

struct ContentView: View {
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var primaryContact = ""
    @State private var publiclyShare = false
    @State private var rating = 0
    
    var body: some View {
        NavigationView {
            Form {
                TextField("First Name", text: $firstname)
                TextField("Last name", text: $lastname)
                
                // Picker
                Picker(selection: $primaryContact,
                       label: Text("Primary Contact")) {
                        ForEach(PrimaryContact.userPrimaryContact, id: \\.self) { primaryContact in
                            Text(primaryContact).tag(primaryContact)
                        }
                }
                
                // Toggle
                Toggle(isOn: $publiclyShare,
                       label: {
                           Text("Publicly Share Contact")
                })
                
                // Stepper
                Stepper(value: $rating,
                        in: 0...5,
                        label: {
                    Text("Rating: \\(self.rating)")
                })
            }.navigationBarTitle(Text("Contact Info"))
        }
    }
}

struct ContentView\_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PrimaryContact {
    static let userPrimaryContact = \[
        "Phone Number",
        "Text Message",
        "Email",
        "Skype",
        "Carrier Pigeon"
    \]
}

This is the basics to start building forms in your app. It pretty simple to create a form view in SwiftUI with not that much code. Hope this article helps you in you coding journey. Happy Coding!! 👨🏻‍💻💻📱
