---
title: "How to Fetch JSON Data from APIs in SwiftUI"
date: 2021-01-11 00:00
tags: Swift, SwiftUI
---
# How to Fetch JSON Data from APIs in SwiftUI

In this post we are going to take a look at how we can get JSON data from an API and show it in a list view in SwiftUI. Let's jump right in a get started by creating a new SwiftUI project.

In this project we are going to be using the [JSONPlaceholder](https://jsonplaceholder.typicode.com/) API. [JSONPlaceholder](https://jsonplaceholder.typicode.com/) is a free to use fake **REST API** for testing and prototyping.

We will be fetching our data from the **_https://jsonplaceholder.typicode.com/posts/1/comments_** URL.

Now in our Xcode project we will create a model file and name it **Comments**. This will be our model for the data we are going to want to show in our list view.

```
import SwiftUI

struct Comments: Codable, Identifiable {
    let id = UUID()
    let name: String
    let email: String
    let body: String
    
}
```

In the code above we made a simple struct that conforms to the [Codable](https://developer.apple.com/documentation/swift/codable) and [Identifiable](https://developer.apple.com/documentation/swift/identifiable) protocols. [Codable](https://developer.apple.com/documentation/swift/codable) is used for decoding and encoding the JSON data we get from our API call. [Identifiable](https://developer.apple.com/documentation/swift/identifiable) is used to help us make a unique identifier for our **Comments** object so our app can keep track of it. In our example it helps us to keep track of our comments and display them in the right order for our list view. We also have added the **name**, **email**, and **body** properties that will be set to the JSON data we get back from our API call.

Next we will add a new file where we will create the call to our API to get our JSON data. Let's start by creating a new file and naming it **commentViewModel**. Then we will add the following code to our **commentViewModel** file.

```
import Foundation

class apiCall {
    func getUserComments(completion:@escaping ([Comments]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let comments = try! JSONDecoder().decode([Comments].self, from: data!)
            print(comments)
            
            DispatchQueue.main.async {
                completion(comments)
            }
        }
        .resume()
    }
}
```

Above all we did was create a class called **apiCall** and added a function called **getUserComments()**. In our **getUserComments()** function we first make a **guard let** statement on our **url** variable. This is to check to make sure we have a valid URL otherwise the function will stop there and not execute the rest of the code.

Next we use [URLSession](https://developer.apple.com/documentation/foundation/urlsession) to make our call to get the data from the URL. Inside of our [URLSession](https://developer.apple.com/documentation/foundation/urlsession) closure we create a new variable called **comments** and we assign the decoded JSON to our variable. Then we use **[DispatchQueue](https://developer.apple.com/documentation/dispatch/dispatchqueue)** to make sure we are running this API call on the main thread and not a background thread of our app. On completion of retrieving our data we then assigns the data to our comments variable. Lastly we can't forget the **.resume()** function at the end of your [URLSession](https://developer.apple.com/documentation/foundation/urlsession) curly brace. If you forget this the function will never run the API call to the URL.

Now that we have our view model setup lets go into **ContentView** file and add the following code to our file.

```
import SwiftUI

struct ContentView: View {
    //1.
    @State var comments = [Comments]()
    
    var body: some View {
        NavigationView {
            //3.
            List(comments) { comment in
                VStack(alignment: .leading) {
                    Text(comment.name)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(comment.email)
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Text(comment.body)
                        .font(.body)
                }
                
            }
            //2.
            .onAppear() {
                apiCall().getUserComments { (comments) in
                    self.comments = comments
                }
            }.navigationTitle("Comments")
        }
    }
}
```

1. First we created a **@State** variable that takes in an array of our **Comments** model.
2. Next we added the **.[onAppear](https://developer.apple.com/documentation/swiftui/text/onappear(perform:))()** function. This is were we make our call to our API to get our data and then set it to the **comments** variable we just created.
3. Then in our list view we pass in the data that we have in our **Comments** array

Now we can go and run our app. We should see something like the image below.

![](https://swifttom.com/wp-content/uploads/2021/01/simulator-screen-shot-iphone-12-pro-2021-01-08-at-16.39.36.png?w=473)

Thats all we need to fetch and show JSON data in SwiftUI. Thanks for reading!

Happy Coding!

![data numbers GIF](/images/giphy.gif?cid=ecf05e47eve0t94gcjgizod66y2n5j54arndqtk30lp9cibk&rid=giphy.gif)
