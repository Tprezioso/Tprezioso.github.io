---
title: "What is a Enum in Swift"
date: 2020-04-23 00:00
tags: Swift
---
# What is a Enum in Swift

What is a Enum? Apple defines and enum as “a common type for a group of related values and enables you to work with those values in a type-safe way within your code”. What the heck does that mean? A enum is shorthand for enumeration and gives us a way to use fixed names for values rather than using strings or integers. Let's take a look at an example to better explain how to use a enum.

enum Device {
    case phone
    case computer
    case tablet
}

In the above example we created a enum of devices. We can uses this enum to give our code a clean way to assign a value to a object. Let's look at the example below to see how we can apply this enum to a person struct.

struct Person {
    var name: String
    var device: Device
}

Above you can see we assigned our device variable to our **Device enum**. Because of this we now can use the **Device** **enum** to specify which device we want to assign when creating our Person variable.

let person1 = Person(name: "Tom", device: .phone)
let person2 = Person(name: "Tim", device: .computer)
let person3 = Person(name: "Ted", device: .tablet)

Another scenario for using enum's that you will see in most app projects is when using custom error messages. Below is an example of how I setup a error messages enum in a project I am working on.

import Foundation

enum TPError : String, Error {
    case invalidUsername = "This username created and invalid request. Please try again"
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again"
    case invalidData = "The data received from the sever was invalid. Please try again"
    case unableToFavorite = "There was an error favoriting this user please try again"
    case alreadyInFavorites = "You already favorited this person"
}

Above is my **TPError.swift** file which stores all my error messages in a enum to display in my app. Next let us look at an example of how I use this emun to handle error messaging in a network call.

    func getFollowers(for username: String, page: Int, completed: @escaping (Result<\[Follower\], TPError>) -> Void) {
        let endpoint = baseURL + "\\(username)/followers?per\_page=100&page=\\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        } ...

First I set my failure completion to use my **TPError**. Next in the failure completion handler I assign the **.invalidUsername** message from the enum that will be displayed on failure. This makes the code much more readable for possible future changes and eliminates a long string from being in my network call.

Using enum's is a great way to make sure you don't make silly string or value errors.

Hope this helps to explain enums and how you can use them in your swift programs!

👨🏻‍💻 Happy coding 👨🏻‍💻
