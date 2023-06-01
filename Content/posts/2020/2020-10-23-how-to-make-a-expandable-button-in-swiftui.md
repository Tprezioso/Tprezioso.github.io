---
title: "How to Make a Expandable Button in SwiftUI"
date: 2020-10-23 00:00
tags: Swift, SwiftUI
---
# How to Make a Expandable Button in SwiftUI

In this post we are going to learn how to make a SwiftUI button that expands out to show more button options. Below is an example of what our button will look like when we are finished.

![](https://swifttom.com/wp-content/uploads/2020/10/screen-shot-2020-10-21-at-5.47.55-pm-1.png?w=508)

Let's get started by creating a new SwiftUI project.

In our project let's add a new SwiftUI file and name it **ExpandableButton**. Inside of our **ExpandableButton.swift** file we will add the following code.

import SwiftUI

struct ExpandableButton: View {
    var body: some View {
        Button(action: {
                    print("Expandable button tapped!!!")
        }) {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 75, height: 75)
                .foregroundColor(.green)

        }
        
    }
}

In the code above all we did was create a button and stylize it. Next we will need to wrap our button in a **VStack** so that when we add our menu buttons they will appear above our expandable button.

import SwiftUI

struct ExpandableButton: View {
    var body: some View {
        VStack {
            Button(action: {
                        print("Expandable button tapped!!!")
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 75, height: 75)
                    .foregroundColor(.green)

            }
        }
        
    }
}

Now let's create our menu buttons in a new SwiftUI file. We will name this file **MenuButtons** and we will add the following code to it.

import SwiftUI

struct MenuButtons: View {
    var buttonImage: String
    
    var body: some View {
        Button(action: {
            print("Menu Button tapped")
            
        }) {
            ZStack {
                Circle()
                    .foregroundColor(.green)
                    .frame(width: 50, height: 50)
                
                Image(systemName: buttonImage)
                    .imageScale(.large)
                    .foregroundColor(.white)
                
            }
        }
    }
}

In the code above we made our menu buttons similar to how we created our expandable button. The only difference is that our menu buttons are slightly smaller and have a green circular background. We also added a **buttonImage** variable so that we can change the image that appears on our menu button.

Now that we have our menu button created let's go back and add it to our **ExpandableButton.swift** file. First we will need to create a **@State** variable so that we can control when we show our menu buttons. In this example we will name are state property **isExpanded** and set it to false.

@State var isExpanded = false

Next we will add a conditional statement above our expandable button that will check if our button is expanded. If **isExpanded** returns true we will show our the menu buttons.

            if isExpanded {
                MenuButtons(buttonImage: "camera.fill")
                MenuButtons(buttonImage: "record.circle.fill")
                MenuButtons(buttonImage: "photo")
            }

In the action of our expandable button we will toggle our **isExpanded** property so that we can control when to show and hide our menu buttons. We'll also add an animation so that when the expandable button is pressed our button will have a smooth transition. Our code should now look like the example below.

import SwiftUI

struct ExpandableButton: View {
    
    @State var isExpanded = false
    
    var body: some View {
        VStack {
            if isExpanded {
                MenuButtons(buttonImage: "camera.fill")
                MenuButtons(buttonImage: "record.circle.fill")
                MenuButtons(buttonImage: "photo")
            }
            
            Button(action: {
                print("Expandable button tapped!!!")
                isExpanded.toggle()
                
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 75, height: 75)
                    .foregroundColor(.green)
            }
            
            
        }
        .animation(.spring())
    }
}

Now if we go and run our preview canvas we should see our button. If we go and tap our button then we should see our menu buttons pop up with an animation.

![](https://swifttom.com/wp-content/uploads/2020/10/screen-shot-2020-10-21-at-5.47.16-pm.png?w=505)

![](https://swifttom.com/wp-content/uploads/2020/10/screen-shot-2020-10-21-at-5.47.55-pm.png?w=508)

Thanks for reading! I hope this helps you in your next SwiftUI project.

All the code from this post can be found on my [Github](https://github.com/Tprezioso/ExpandableButtonSwiftUI).

📱 Happy Coding! 💻
