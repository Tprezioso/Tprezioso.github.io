---
date: 2020-01-14 00:00
title: "Using URLSession and Codable to retrieve data in Swift"
tags: Swift
---
# Using URLSession and Codable to retrieve data in Swift

How I learned to retrieve JSON data from API's was by using CocoaPods like [AlamoFire](https://github.com/Alamofire/Alamofire) and [AFNetworking](https://github.com/AFNetworking/AFNetworking). These Cocoapods make it easy to call an API for some piece of data but these libraries come with a lot of extra things I just don't use most of the time in my app. So now I have been trying to use Apple's solution by using Codable and URLSession.

As of Swift 4 Apple's Codable library with URLSession makes retrieve data as simple as a few lines of code. Let's take a dive into seeing how we can use these libraries to make a simple API call to retrieve my username from my Github account.

First we want to setup a struct that conforms to the Codable protocol. Add the following code to your swift file.

struct MyGitHub: Codable {
    
    let name: String?
    let followers: Int?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case followers

    }
}

In the code above we are make a simple struct with two variables, name as a string and followers as a Int. Below this we created a enum called "CodingKeys". What this does it make it so that whatever the key value name is of the object we want in the data, will automatically be assign to the corresponding variable object with the same name.

So "name" in the JSON will automatically be assigned to our name variable in our MyGitHub struct (Same goes for our followers variable). If we wanted an object from our JSON data that had a key name with two or more strings separated by "\_", we would set the variable name to match the JSON datas string like the code below to assign the object to our variable.

private enum CodingKeys: String, CodingKey {
        case name
        case followers
        case repos = "public\_repos"
        case avatarUrl = "avatar\_url"
    }

Next we are going to need to create a function that makes the call to the URL so we can get my GitHub username. Added the following function to our code and we will go through what's going on here.

func fetchDataFromApi() {
    
    guard let gitUrl = URL(string: "https://api.github.com/users/tprezioso") else { return }
    
    URLSession.shared.dataTask(with: gitUrl) { (data, response, error) in
        
        guard let data = data else { return }
    
        do {
            let decoder = JSONDecoder()
            let gitData = try decoder.decode(MyGitHub.self, from: data)
                print(gitData.name ?? "Empty Name")
                
        } catch let error {
            print("Error: ", error)
        }
    }.resume()
    
}

First we use a guard let statement on our URL variable to see if our URL is valid otherwise we return. Next we create a URLSession that takes in our URL variable with a closure that returns "data, response, error" data. We then use guard let statement on the data to check if we have any data (You should add some sort of default error handling on any "guard let" statement but for this example I am skipping that 😅). If we do have data we then want to add a "Do/Catch" statement because we can have an error on the data that is returned.

Next we need to use JSONDecoder which will decode the JSON and match our MyGithub struct variables to the data variables we received. Next we add a print statement to print my username for GitHub to the console. Lastly we will add a catch statement to catch if there was an error, if any (We are awesome programmers and we don't make errors 🤥 ).

Also don't forget that the end bracket of URLSession needs ".resume()" or else nothing will happen when you go to run your app.

Finally, all we need to do now is call our function from either "ViewdidLoad" if your using UIKit or ".onAppear()" if your using SwiftUI. Go ahead and run your code and you should see my name (or your name if you switched my handle with your github handle in the URL) in your console print out.

![](https://swifttom.com/wp-content/uploads/2020/01/screen-shot-2020-01-21-at-6.08.41-pm.png?w=1024)

With just a handful of lines of code we can get data from the web using Swifts Codable and URLSession. Hope this helps to simplify your code because it has helped me tons. Happy programming! 👨🏻‍💻💻📱
